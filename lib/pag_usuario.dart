// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/nose.dart';
import 'package:flutter_application_1/Utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/bloc/Auth/auth_bloc.dart';

// ignore: camel_case_types
class pagusuario extends StatefulWidget {
  const pagusuario({super.key});

  @override
  State<pagusuario> createState() => _pagusuarioState();
}

// ignore: camel_case_types
class _pagusuarioState extends State<pagusuario> {
  void _createAccountWithEmailAndPassword(BuildContext context) {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(
          _emailcontroller.text,
          _passwordcontroller.text,
        ),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

  final url = Uri.parse("http://192.168.20.25:4000/api/registro");
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  final formKey = GlobalKey<FormState>();
  final TextEditingController nombre = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController telefono = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController idrol = TextEditingController(text: "2");
  String pathImage = "images/google.png";
  @override
  Widget build(BuildContext context) {
    final iconBar = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 35.0,
          width: 35.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(pathImage),
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the nose screen if the user is authenticated
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const nose(),
              ),
            );
          }
          if (state is AuthError) {
            // Displaying the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            // Displaying the loading indicator while the user is signing up
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UnAuthenticated) {
            // Displaying the sign up form if the user is not authenticated
          return Form(
            key: formKey,
            child:
          ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              children: <Widget>[
                Column(mainAxisAlignment: MainAxisAlignment.center),
                const SizedBox(
                  width: 360.0,
                  height: 15.0,
                ),
                TextField(
                  controller: nombre,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                    hintStyle: const TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(158, 255, 255, 255)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const Divider(
                  height: 18.0,
                ),
                TextField(
                  controller: direccion,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    hintText: 'Dirección',
                    hintStyle: const TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(158, 255, 255, 255)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const Divider(
                  height: 18.0,
                ),
                TextField(
                  controller: telefono,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    hintText: 'Teléfono',
                    hintStyle: const TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(158, 255, 255, 255)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const Divider(
                  height: 18.0,
                ),
                TextFormField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                      hintText: 'Correo',
                      hintStyle: const TextStyle(
                          fontSize: 20.0,
                          color: Color.fromARGB(158, 255, 255, 255)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0)),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'ingrese un email valido'
                            : null),
                const Divider(
                  height: 18.0,
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  enableInteractiveSelection: true,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? 'Ingrese minimo 6 caracteres'
                      : null,
                  decoration: InputDecoration(
                    hintText: 'Crear contraseña',
                    hintStyle: const TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(158, 255, 255, 255)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const Divider(
                  height: 18.0,
                ),
                TextField(
                  controller: _passwordcontroller,
                  enableInteractiveSelection: true,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirmar contraseña',
                    hintStyle: const TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(158, 255, 255, 255)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const Divider(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  // height: 70.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        hoverColor: Colors.amber[900],
                        color: Colors.amber[900],
                        onPressed: () {
                                    _createAccountWithEmailAndPassword(context);
                                  },
                        // () {
                        //   saveUsuario();
                        //   Navigator.of(context).pop();
                        // },
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                              fontFamily: 'NerkoOne'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          iconBar,
                          FlatButton(
                            onPressed: () {
                              _authenticateWithGoogle(context);
                            },
                            color: const Color.fromARGB(102, 43, 42, 42),
                            textColor: Colors.white,
                            child: const Text('Registrarse con Google'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),);
          }
          return Container();
        },
      ),
    );
  }

  // void saveUsuario() async {
  //   final user = {
  //     "nombre": nombre.text,
  //     "direccion": direccion.text,
  //     "telefono": telefono.text,
  //     "email": correo.text,
  //     "contrasena": contrasena.text,
  //     "id_rol": idrol.text
  //   };
  //   await http.post(url, headers: headers, body: jsonEncode(user));
  //   nombre.clear();
  //   direccion.clear();
  //   telefono.clear();
  //   correo.clear();
  //   contrasena.clear();
  //   idrol.clear();
  // }
  Future signUp() async {
    final user = {
      "nombre": nombre.text,
      "direccion": direccion.text,
      "telefono": telefono.text,
      "email": _emailcontroller.text,
      "contrasena": _passwordcontroller.text,
      "id_rol": idrol.text
    };
    await http.post(url, headers: headers, body: jsonEncode(user));
    nombre.clear();
    direccion.clear();
    telefono.clear();
    _emailcontroller.clear();
    _passwordcontroller.clear();
    idrol.clear();
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(child: CircularProgressIndicator.adaptive())
    // );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.ShowSnackBar(e.message);
    }
    //navigator.of(context) not working!
    // navigatorKey.currentState!.popUntil((route))=> route;
  }
}
