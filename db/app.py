from psutil import users
from fastapi import FastAPI, HTTPException, Depends
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from pydantic import BaseModel
import pymysql
import requests
import json
import os
from datetime import datetime, timedelta
import jwt
from schemas import UserLogin, UserRegister
from auth import AuthHandler

auth_handler = AuthHandler()
security = HTTPBearer()

# Connexion à la base de données MySQL
conn = pymysql.connect(
    host="localhost",
    user="root",
    password="mirabelle20",
    database="medchat",
    cursorclass=pymysql.cursors.DictCursor
)

app = FastAPI()


# Middleware pour vérifier le jeton d'authentification
async def verify_token(credentials: HTTPAuthorizationCredentials = Depends(security)):
    try:
        # Récupérer le jeton d'authentification depuis le header Authorization
        token = credentials.credentials
        # Vérifier et décoder le jeton
        payload = jwt.decode(token, os.getenv("SECRET_KEY"), algorithms=["HS256"])
        return payload
    except jwt.ExpiredSignatureError:
        raise HTTPException(status_code=401, detail="Token expired")
    except jwt.InvalidTokenError:
        raise HTTPException(status_code=401, detail="Invalid token")


# Fonction de hachage du mot de passe (à implémenter avec un algorithme sécurisé)
def hash_password(password):
    # À implémenter
    return password


# Fonction de vérification du mot de passe
def verify_password(hashed_password, password):
    return hashed_password == password


# Fonction de génération de jeton d'authentification
def generate_auth_token(username):
    # Clé secrète pour signer le token
    secret_key = "$kjkjkloknhgjoulk$"
    # Durée de validité du token (30 minutes dans cet exemple)
    expires = datetime.utcnow() + timedelta(minutes=30)
    # Création du payload du token
    payload = {"sub": username, "exp": expires}
    # Génération du token JWT
    token = jwt.encode(payload, secret_key, algorithm="HS256")
    return token


# Fonction pour vérifier la validité du jeton d'authentification
def verify_token(token):
    # Clé secrète pour vérifier la signature du token
    secret_key = "your-secret-key"
    try:
        # Vérification du token
        payload = jwt.decode(token, secret_key, algorithms=["HS256"])
        return True
    except jwt.ExpiredSignatureError:
        # Le token a expiré
        return False
    except jwt.InvalidTokenError:
        # Le token est invalide
        return False


# Route pour l'enregistrement d'un nouvel utilisateur
@app.post("/register/")
def register_user(user_register: UserRegister):
    with conn.cursor() as cursor:
        # Vérifier si l'utilisateur existe déjà
        cursor.execute("SELECT * FROM users WHERE username = %s", (user_register.username,))
        existing_user = cursor.fetchone()
        if existing_user:
            raise HTTPException(status_code=400, detail="L'utilisateur existe déjà")

        # Hacher le mot de passe
        hashed_password = auth_handler.get_password_hash(user_register.password)

        # Insérer l'utilisateur dans la base de données
        sql = "INSERT INTO users (username, hashed_password, email) VALUES (%s, %s, %s)"
        cursor.execute(sql, (user_register.username, hashed_password, user_register.email))
        conn.commit()

    return {"message": "Utilisateur enregistré avec succès"}


# Route pour la connexion d'un utilisateur
@app.post("/login/")
def login_user(user_login: UserLogin):
    with conn.cursor() as cursor:
        # Récupérer le mot de passe hashé de l'utilisateur
        cursor.execute("SELECT hashed_password FROM users WHERE username = %s", (user_login.username,))
        hashed_password = cursor.fetchone()
        if not hashed_password or not verify_password(hashed_password["hashed_password"], user_login.password):
            raise HTTPException(status_code=401, detail="Nom d'utilisateur ou mot de passe invalide")

        # Générer un jeton d'authentification
        token = generate_auth_token(user_login.username)

        return {"message": "Connexion réussie", "token": token}






# Fonction de génération de jeton d'authentification (à implémenter avec une bibliothèque
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)


