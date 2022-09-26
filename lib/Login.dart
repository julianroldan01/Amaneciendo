// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/nose.dart';
import 'package:flutter_application_1/header_register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  // FirebaseAuth auth = FirebaseAuth.instance;
  late String _email;
  late String _password;
  String pathImage = "images/google.png";
  @override
  Widget build(BuildContext context) {
    final iconBar = Container(
        height: 35.0,
        width: 35.0,
        margin: const EdgeInsets.only(top: 2.0, left: 10.0, right: 2.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(pathImage))));

    final margin = Container(
      margin: const EdgeInsets.only(top: 300.0),
    );
    final columna = Column(mainAxisAlignment: MainAxisAlignment.center);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/login.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
            children: <Widget>[
              columna,
              margin,
              const SizedBox(
                width: 360.0,
                height: 15.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                enableInteractiveSelection: false,
                controller: _emailcontroller,
                decoration: InputDecoration(
                  hintText: 'Correo',
                  hintStyle:
                      const TextStyle(fontSize: 20.0, color: Colors.white),
                  suffixIcon: const Icon(
                    Icons.alternate_email,
                    color: (Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onSubmitted: (valor) {
                  _email = valor;
                  // ignore: avoid_print
                  print('el correo es $_email');
                },
              ),
              const Divider(
                height: 18.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                controller: _passwordcontroller,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  hintStyle:
                      const TextStyle(fontSize: 20.0, color: Colors.white),
                  suffixIcon: const Icon(
                    Icons.lock_outline,
                    color: (Colors.white),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onSubmitted: (valor) {
                  _password = valor;
                  // ignore: avoid_print
                  print('la contraseña es $_password');
                },
              ),
              const Divider(height: 15.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: FlatButton(
                  hoverColor: Colors.amber[900],
                  color: Colors.amber[900],
                  onPressed: () {
                    // ignore: non_constant_identifier_names
                    final route =
                        MaterialPageRoute(builder: (context) => const nose());
                    Navigator.push(context, route);
                  },
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 30.0,
                        fontFamily: 'NerkoOne'),
                  ),
                ),
              ),
              const Divider(height: 18.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  iconBar,
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 40.0),
                        child: FlatButton(
                          onPressed: () => {},
                          color: const Color.fromARGB(102, 43, 42, 42),
                          textColor: Colors.white,
                          child: const Text('Acceder'),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              final route = MaterialPageRoute(
                                  builder: (context) => const usuario());
                              Navigator.push(context, route);
                            },
                            color: Colors.amber[900],
                            textColor: Colors.white,
                            child: const Text('Registrar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                  child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      onPressed: () => {},
                      color: Colors.transparent,
                      textColor: Colors.white,
                      child: const Text('Olvide mi contraseña'))),
            ],
          )),
    );
  }
}
