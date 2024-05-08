import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:medchat/constants/apps_theme_config.dart';

class UserRegister {
  final String username;
  final String password;
  final String email;

  UserRegister(
      {required this.username, required this.password, required this.email});

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'email': email,
      };
}

String text = '';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;
      String email = _emailController.text;

      // Envoie de la demande d'enregistrement à l'API FastAPI
      final response = await http.post(
        Uri.parse('http://localhost:8000/register/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        print('Enregistrement réussi');
        Get.toNamed('/login');
        // Traitez ici la réponse d'enregistrement réussi
      } else if (response.statusCode == 400) {
        print('L\'utilisateur existe déjà');
        text = 'Ce compte existe déjà';
        // Traitez ici la réponse d'échec d'enregistrement
      } else {
        print('Erreur lors de l\'enregistrement: ${response.statusCode}');
        // Traitez ici d'autres codes d'erreur éventuels
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: appsTheme['black'],
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              'assets/images/medchat.png',
            ),
          ), /* Text(
            'MEDCHAT', // Utilisation de l'opérateur de coalescence nulle (??) pour éviter une valeur nulle
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat'),
          ) */
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Identifiant'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nom d\'utilisateur';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Mot de passe'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre mot de passe';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre adresse e-mail';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: _register,
                  child: Text('Register'),
                ),
                SizedBox(
                  height: 20,
                ),
                text != ''
                    ? Text(
                        text,
                        style: TextStyle(
                            fontSize: 20, color: appsTheme['dark']['w650']),
                      )
                    : Container()
              ],
            ),
          ),
        ));
  }
}
