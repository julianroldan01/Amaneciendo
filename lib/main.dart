import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils.dart';
import 'package:flutter_application_1/auth_page.dart';
import 'package:flutter_application_1/models/usuario_cliente.dart';
import 'package:flutter_application_1/nose.dart';
import 'package:flutter_application_1/pag_usuario.dart';
import 'Login.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
  class MainPage extends StatelessWidget {
    @override
    Widget build (BuildContext context) => Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return nose();
          }else {
          return AuthPage();
        }
      }
    ),
    );
  }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey, 
      title: 'AMANECIENDO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: 'Login',
      home: MainPage(),
    ); 
  }
}
