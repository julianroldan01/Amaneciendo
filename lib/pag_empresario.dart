// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/Utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/bloc/Auth/auth_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Apidio.dart';

// ignore: camel_case_types
class empresario extends StatefulWidget {
  const empresario({super.key});

  @override
  State<empresario> createState() => _empresarioState();
}

// ignore: camel_case_types
class _empresarioState extends State<empresario> {
  final formKey = GlobalKey<FormState>();
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
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  final Dio dio = Apidio.dioAuth();
  final TextEditingController nombre = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController telefono = TextEditingController();
  final TextEditingController nitempresa = TextEditingController();
  final TextEditingController nombreestanco = TextEditingController();
  final TextEditingController tipodocumento = TextEditingController(text: "cc");
  final TextEditingController documento = TextEditingController();
  final TextEditingController horainicio = TextEditingController();
  final TextEditingController horafin = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController diaatencion = TextEditingController();
  final String host = dotenv.get("HOST");
  final TextEditingController numerodocumentocomprador =
      TextEditingController();
  final TextEditingController idrol = TextEditingController(text: "1");
  String? _selectedTimeI;
  Future<void> _show() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, childWidget) {
          return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: childWidget!);
        });
    if (result != null) {
      setState(() {
        _selectedTimeI = result.format(context);
      });
    }
  }

  String? _selectedTimeF;
  Future<void> _show2() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, childWidget) {
          return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: childWidget!);
        });
    if (result != null) {
      setState(() {
        _selectedTimeF = result.format(context);
      });
    }
  }

  // TimeOfDay? time = TimeOfDay.now();
  // TimeOfDay? time2 = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
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
              controller: nitempresa,
              enableInteractiveSelection: true,
              decoration: InputDecoration(
                hintText: 'NIT',
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
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: nombreestanco,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: 'Razon socal / nombre',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: direccion,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: 'Dirección del local',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: nombre,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: 'Representante legal',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: documento,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: 'Cédula representante',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: telefono,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: 'Telefono',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: _emailcontroller,
              keyboardType: TextInputType.emailAddress,
              enableInteractiveSelection: false,
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
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: _passwordcontroller,
              enableInteractiveSelection: false,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   // ignore: prefer_const_literals_to_create_immutables
            //   children: <Widget>[
            //     const Text(
            //       "Seleccione los días de atención de su local: ",
            //       textAlign: TextAlign.left,
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontFamily: "Acme",
            //           fontSize: 15.0,
            //           fontWeight: FontWeight.w700),
            //     ),
            //   ],
            // ),
            // const Padding(
            //   padding: EdgeInsets.all(8),
            // ),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     ToggleButtons(
            //       borderRadius: BorderRadius.circular(30),
            //       borderWidth: 0,
            //       onPressed: (int index) {
            //         setState(() {
            //           _selections[index] = !_selections[index];
            //         });
            //       },
            //       isSelected: _selections,
            //       children: const <Widget>[
            //         Text('L'),
            //         Text('M'),
            //         Text('M'),
            //         Text('J'),
            //         Text('V'),
            //         Text('S'),
            //         Text('D'),
            //       ],
            //     ),

            //   ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //         textStyle: const TextStyle(fontSize: 20),
            //         shape: const CircleBorder(),
            //         primary: const Color.fromARGB(30, 43, 42, 42)),
            //     child: const Text("L", style: TextStyle(color: Colors.white)),
            //   ),
            //   ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //         textStyle: const TextStyle(fontSize: 20),
            //         shape: const CircleBorder(),
            //         primary: const Color.fromARGB(30, 43, 42, 42)),
            //     child: const Text("M", style: TextStyle(color: Colors.white)),
            //   ),
            //   ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //         textStyle: const TextStyle(fontSize: 20),
            //         shape: const CircleBorder(),
            //         primary: const Color.fromARGB(30, 43, 42, 42)),
            //     child: const Text("X", style: TextStyle(color: Colors.white)),
            //   ),
            //   ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //         textStyle: const TextStyle(fontSize: 20),
            //         shape: const CircleBorder(),
            //         primary: const Color.fromARGB(30, 43, 42, 42)),
            //     child: const Text("J", style: TextStyle(color: Colors.white)),
            //   ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     ElevatedButton(
            //       onPressed: () {},
            //       style: ElevatedButton.styleFrom(
            //           textStyle: const TextStyle(fontSize: 20),
            //           shape: const CircleBorder(),
            //           primary: const Color.fromARGB(30, 43, 42, 42)),
            //       child: const Text("V", style: TextStyle(color: Colors.white)),
            //     ),
            //     ElevatedButton(
            //       onPressed: () {},
            //       style: ElevatedButton.styleFrom(
            //           textStyle: const TextStyle(fontSize: 20),
            //           shape: const CircleBorder(),
            //           primary: const Color.fromARGB(30, 43, 42, 42)),
            //       child: const Text("S", style: TextStyle(color: Colors.white)),
            //     ),
            //     ElevatedButton(
            //       onPressed: () {},
            //       style: ElevatedButton.styleFrom(
            //           textStyle: const TextStyle(fontSize: 20),
            //           shape: const CircleBorder(),
            //           primary: const Color.fromARGB(30, 43, 42, 42)),
            //       child: const Text("D", style: TextStyle(color: Colors.white)),
            //     ),
            //   ],
            // ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Seleccione las horas de atención de su local: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  'De',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                ),
                ElevatedButton(
                  onPressed: _show,
                  style: ElevatedButton.styleFrom(
                      shadowColor: const Color.fromARGB(255, 248, 247, 247)),
                  child: Text(
                    _selectedTimeI != null ? _selectedTimeI! : '00:00 PM',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const Text(
                  'A',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                ),
                ElevatedButton(
                  onPressed: _show2,
                  // async {
                  //   TimeOfDay? newTime = await showTimePicker(
                  //       context: context, initialTime: time2!);
                  //   if (newTime != null) {
                  //     setState(() {
                  //       time2 = newTime;
                  //     });
                  //   }
                  // },
                  style: ElevatedButton.styleFrom(
                      shadowColor: const Color.fromARGB(255, 248, 247, 247)),
                  child: Text(
                    _selectedTimeF != null ? _selectedTimeF! : '00:00 AM',
                    style: const TextStyle(color: Colors.white),
                  ),
                  // '${time2!.hour.toString()}: ${time2!.minute.toString()}'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "* Cargue los documentos en PDF. El archivo debe pesar máximo 3MB.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles();
                  },
                  style: ElevatedButton.styleFrom(
                      shadowColor: const Color.fromARGB(102, 43, 42, 42)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.download_rounded, color: Colors.white),
                      Text(
                        'RUT*',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shadowColor: const Color.fromARGB(102, 43, 42, 42)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.download_rounded, color: Colors.white),
                      Text(
                        'Cámara y comercio*',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shadowColor: const Color.fromARGB(102, 43, 42, 42)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.download_rounded, color: Colors.white),
                      Text(
                        'Cédula de ciudadanía*',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            const Text(
              "Ubica del estanco en el mapa y selecciona la zona a la que pertecene.",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Acme",
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700),
            ),
               ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(shadowColor: Colors.amber[900]),
                  onPressed: () {
                    signUp();
                    _createAccountWithEmailAndPassword(context);
                  },
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20.0,
                        fontFamily: 'NerkoOne'),
                  ),
                ),
          ],
        ));
  }

  Future signUp() async {
    final user = {
      "nombre": nombre.text,
      "direccion": direccion.text,
      "telefono": telefono.text,
      "email": _emailcontroller.text,
      "contrasena": _passwordcontroller.text,
      "id_rol": idrol.toString()
    };
    await dio.post("$host/api/registro",
        options: Options(headers: headers), data: jsonEncode(user));
    nombre.clear();
    direccion.clear();
    telefono.clear();
    _emailcontroller.clear();
    _passwordcontroller.clear();
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
  }
}
