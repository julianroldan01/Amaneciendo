import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class galery extends StatefulWidget {
  const galery({super.key});

  @override
  State<galery> createState() => _galeryState();
}

class _galeryState extends State<galery> {
   final picker = ImagePicker();
  late File _imagen = File('images/noimagen.png');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_circle_left_outlined),
                color: Colors.white,
                iconSize: 48,
              ),
              const Padding(
                padding: EdgeInsets.all(35),
              ),
              Row(
                children: const <Widget>[
                  Center(
                    child: Text('GALERIA',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Acme",
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            ]),
            const Padding(
              padding: EdgeInsets.all(35),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Cargue máximo 3 imágenes de su local comercial. ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Acme",
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 350.0,
                      width: 320.0,
                      color: Colors.orange[100],
                      child: Image.file(_imagen, fit: BoxFit.cover),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _getImagen,
                    style: ElevatedButton.styleFrom(
                        shadowColor: const Color.fromARGB(102, 43, 42, 42)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.download_rounded, color: Colors.white),
                        Text(
                          'Cargar imagen',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.amber[900]),
                    onPressed: () {},
                    // signIn,
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'NerkoOne'),
                    ),
                  ),
                ]),
          ]),
    );
  }
    void _getImagen() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var imagen = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (imagen != null) {
        _imagen = File(imagen.path);
      }
    });
  }
}
