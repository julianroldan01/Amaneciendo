// ignore_for_file: deprecated_member_use
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// ignore: camel_case_types
class pagusuario extends StatefulWidget {
  const pagusuario({super.key});

  @override
  State<pagusuario> createState() => _pagusuarioState();
}

// ignore: camel_case_types
class _pagusuarioState extends State<pagusuario> {
  final url = Uri.parse("http://192.168.1.108:4000/api/registro");
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  final TextEditingController nombre = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController telefono = TextEditingController();
  final TextEditingController correo = TextEditingController();
  final TextEditingController contrasena = TextEditingController();
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
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
                  fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
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
                  fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
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
                  fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          const Divider(
            height: 18.0,
          ),
          TextField(
            controller: correo,
            keyboardType: TextInputType.emailAddress,
            enableInteractiveSelection: true,
            decoration: InputDecoration(
              hintText: 'Correo',
              hintStyle: const TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          const Divider(
            height: 18.0,
          ),
          TextField(
            controller: contrasena,
            enableInteractiveSelection: true,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Crear contraseña',
              hintStyle: const TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          const Divider(
            height: 18.0,
          ),
          TextField(
            controller: contrasena,
            enableInteractiveSelection: true,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Confirmar contraseña',
              hintStyle: const TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
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
                    saveUsuario();
                    Navigator.of(context).pop();
                  },
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
                      onPressed: () => {},
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
      ),
    );
  }

  void saveUsuario() async {
    final user = {
      "nombre": nombre.text,
      "direccion": direccion.text,
      "telefono": telefono.text,
      "correo": correo.text,
      "contrasena": contrasena.text,
      "id_rol": idrol.text
    };
    await http.post(url, headers: headers, body: jsonEncode(user));
    nombre.clear();
    direccion.clear();
    telefono.clear();
    correo.clear();
    contrasena.clear();
    idrol.clear();
  }
}
