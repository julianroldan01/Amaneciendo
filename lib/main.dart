import 'package:flutter/material.dart';
import 'Login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'AMANECIENDO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: 'Login',
      routes: <String, WidgetBuilder>{
        'Login': (BuildContext context) => const Login(),
        // 'nose': (BuildContext context) => const nose(),
        // 'DescriptionPlace': (BuildContext context) => DescriptionPlace(
        //     "images/drunkemoji.png",
        //     "Emoji",
        //     4,
        //     "3108051414",
        //     "Estanco y club nocturno",
        //     "Horario: Martes a domingo",
        //     "Hora: 9:00 PM - 5:00 AM",
        //     "Direccion: Calle 13B #32-31",
        //     "Barrio: Santa Ines"),
        // 'register_usuario': (BuildContext context) => const usuario(),
      },

      // home: Container(
      //     decoration: const BoxDecoration(
      //       image: DecorationImage(
      //           image: AssetImage('images/fondo.png'), fit: BoxFit.cover),
      //     ),
      //     child: const Scaffold(
      //       backgroundColor: Colors.transparent,
      //       body:Login(),

      // Stack(
      //   children: <Widget>[
      //     ListView(children: <Widget>[
      //       DescriptionPlace(
      //           "images/drunkemoji.png",
      //           "Emoji",
      //           4,
      //           "3108051414",
      //           "Estanco y club nocturno",
      //           "Horario: Martes a domingo",
      //           "Hora: 9:00 PM - 5:00 AM",
      //           "Direccion:Calle 13B #32-31",
      //           "Barrio: Santa Ines")
      //     ]),
      //     const HeaderAppBar()
      //   ],
      // ),
    );
  }
}
