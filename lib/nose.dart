// ignore_for_file: deprecated_member_use
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/usuario_cliente.dart';
import 'package:flutter_application_1/nosemaps/mapsample.dart';
import 'descripcion.dart';
import 'nosemaps/norte.dart';

class nose extends StatefulWidget {
  const nose({super.key});

  @override
  State<nose> createState() => _noseState();
}

// ignore: camel_case_types
class _noseState extends State<nose> {
  String pathImageNorte = "images/norte.png";
  String pathImageEste = "images/este.png";
  String pathImageOeste = "images/oeste.png";
  String pathImageSur = "images/sur.png";
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    // return Scaffold(
    //     body: ListView(
    //   children: [
    //     GridView.count(
    //       crossAxisCount: 2,
    //       physics:
    //           const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
    //       shrinkWrap: true, // You won't see infinite size error
    //       children: [
    //         Container(
    //           decoration: const BoxDecoration(
    //             image: DecorationImage(
    //                 image: AssetImage('images/norte.png'), fit: BoxFit.fill),
    //           ),
    //         ),
    //         Container(
    //           decoration: const BoxDecoration(
    //             image: DecorationImage(
    //                 image: AssetImage('images/oeste.png'), fit: BoxFit.fill),
    //           ),
    //         ),
    //         Container(
    //           decoration: const BoxDecoration(
    //             image: DecorationImage(
    //                 image: AssetImage('images/sur.png'), fit: BoxFit.fill),
    //           ),
    //         ),
    //         Container(
    //           decoration: const BoxDecoration(
    //             image: DecorationImage(
    //                 image: AssetImage('images/este.png'), fit: BoxFit.fill),
    //           ),
    //         )
    //       ],
    //     ),
    //   ],
    // ));

    final contenedor = Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/fondo.png'), fit: BoxFit.fill),
      ),
      child: const Scaffold(backgroundColor: Colors.transparent),
    );
    final iconBar =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Material(
          child: SizedBox(
        height: 380.0,
        width: 180.0,
        child: InkWell(
          onTap: () {
            final route = MaterialPageRoute(
                builder: (context) => Stack(
                      children: <Widget>[
                        contenedor,
                        Stack(children: <Widget>[MapSample()]),
                      ],
                    ));
            Navigator.push(context, route);
          },
          child: Ink.image(image: AssetImage(pathImageNorte), fit: BoxFit.fill),
        ),
      )),
      Material(
          child: SizedBox(
        height: 380.0,
        width: 180.0,
        child: InkWell(
          onTap: () {
            final route = MaterialPageRoute(
                builder: (context) => Stack(
                      children: <Widget>[
                        contenedor,
                        ListView(children: <Widget>[
                          DescriptionPlace(
                              "images/drunkemoji.png",
                              "Emoji",
                              4,
                              "3108051414",
                              "Estanco y club nocturno",
                              "Horario: Martes a domingo",
                              "Hora: 9:00 PM - 5:00 AM",
                              "Direccion:Calle 13B #32-31",
                              "Barrio: Santa Ines")
                        ]),
                        // const HeaderAppBar()
                      ],
                    ));
            Navigator.push(context, route);
          },
          child: Ink.image(image: AssetImage(pathImageOeste), fit: BoxFit.fill),
        ),
      )),
    ]);
    final iconBar2 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Material(
            child: SizedBox(
          height: 380.0,
          width: 180.0,
          child: InkWell(
            onTap: () {
              final route = MaterialPageRoute(
                  builder: (context) => Stack(
                        children: <Widget>[
                          contenedor,
                          ListView(children: <Widget>[
                            DescriptionPlace(
                                "images/drunkemoji.png",
                                "Emoji",
                                4,
                                "3108051414",
                                "Estanco y club nocturno",
                                "Horario: Martes a domingo",
                                "Hora: 9:00 PM - 5:00 AM",
                                "Direccion:Calle 13B #32-31",
                                "Barrio: Santa Ines")
                          ]),
                          // const HeaderAppBar()
                        ],
                      ));
              Navigator.push(context, route);
            },
            child: Ink.image(image: AssetImage(pathImageSur), fit: BoxFit.fill),
          ),
        )),
        Material(
            child: SizedBox(
          height: 380.0,
          width: 180.0,
          child: InkWell(
            onTap: () {
              final route = MaterialPageRoute(
                  builder: (context) => Stack(
                        children: <Widget>[
                          contenedor,
                          ListView(children: <Widget>[
                            DescriptionPlace(
                                "images/drunkemoji.png",
                                "Emoji",
                                4,
                                "3108051414",
                                "Estanco y club nocturno",
                                "Horario: Martes a domingo",
                                "Hora: 9:00 PM - 5:00 AM",
                                "Direccion:Calle 13B #32-31",
                                "Barrio: Santa Ines")
                          ]),
                          // const HeaderAppBar()
                        ],
                      ));
              Navigator.push(context, route);
            },
            child:
                Ink.image(image: AssetImage(pathImageEste), fit: BoxFit.fill),
          ),
        )),
      ],
    );
    return Scaffold(
          appBar: AppBar(centerTitle: true,title: const Text("ZONAS", style: TextStyle(color:Colors.white)),
          backgroundColor: Color(0xFFFFAE00),
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded, color: Colors.white),
            tooltip: 'Login',
            onPressed: ()=> FirebaseAuth.instance.signOut(),),
      ],),
    body: ListView(
      children: <Widget>[
        Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[ 
              iconBar, iconBar2]),
      ],
    ));
  }
}
