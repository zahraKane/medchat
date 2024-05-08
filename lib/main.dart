import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medchat/presenter/views/Layout/presentation_layout.dart';
import 'package:medchat/presenter/views/chat_view.dart';
import 'package:medchat/presenter/views/home_view.dart';
import 'package:medchat/presenter/views/login_view.dart';
import 'package:medchat/presenter/views/map_view.dart';
import 'package:medchat/presenter/views/presentation.dart';
import 'package:medchat/presenter/views/registrer_view.dart';
import 'package:medchat/presenter/views/widgets/home_structure_view.dart';
import 'package:medchat/providers/chats_provider.dart';
import 'package:medchat/providers/models_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ModelsProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ChatProvider(),
          ),
        ],
        child: GetMaterialApp(
            title: 'Med Chat',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Presentation(),
            routes: {
              "/login": (context) => LoginPage(),
              "/register": (context) => RegisterForm(),
              "/home": (context) => HomePage(),
              "/chat": (context) => ChatScreen(),
              "/home_structure": (context) => HomeStrcutureView(),
              "/map": (context) => MapView(),
            },
            debugShowCheckedModeBanner: false
            // Affichez LoginPage comme page d'accueil
            ));
  }
}
