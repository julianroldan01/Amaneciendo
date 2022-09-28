import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/header_register.dart';
import 'package:flutter_application_1/pag_usuario.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context)=> isLogin 
  ? Login(onClickedSignUp:toggle): 
    usuario(onClickedSignIn:toggle);

    void toggle() => setState(() => isLogin = !isLogin);
  }