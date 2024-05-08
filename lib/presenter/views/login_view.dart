import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:medchat/constants/apps_theme_config.dart';
import 'dart:convert';

import 'package:medchat/presenter/views/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Appel de la fonction pour se connecter à l'API FastAPI
    await loginUser(username, password);
  }

  Future<void> loginUser(String username, String password) async {
    final url = Uri.parse('http://localhost:8000/login/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json'
      }, // Définir l'en-tête Content-Type à application/json
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('Connexion réussie');
      Get.toNamed(
        '/home',
      );
      // Traitez ici la réponse de succès, par exemple, en redirigeant l'utilisateur vers une nouvelle page
    } else if (response.statusCode == 401) {
      print('Nom d\'utilisateur ou mot de passe invalide');
      // Traitez ici la réponse d'échec, par exemple, en affichant un message d'erreur à l'utilisateur
    } else {
      print('Erreur lors de la connexion: ${response.statusCode}');
      print(response.body);
      // Traitez ici d'autres codes d'erreur éventuels
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/medchat.png',
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Nom d\'utilisateur ',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Se connecter',
                  style: TextStyle(color: appsTheme['dark']['w560'])),
            ),
            SizedBox(height: 40.0),
            TextButton(
                onPressed: () {
                  Get.toNamed('/register');
                },
                child: Text(
                  'Inscrivez-vous !',
                  style: TextStyle(
                      color: appsTheme['dark']['w560'], fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }
}
