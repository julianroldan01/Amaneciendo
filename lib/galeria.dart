import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

class galery extends StatefulWidget {
  const galery({super.key});

  @override
  State<galery> createState() => _galeryState();
}

class _galeryState extends State<galery> {
  final picker = ImagePicker();
  List<XFile>? imageFileList = [];
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
                ElevatedButton(
                    onPressed: selectImages,
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
                  )
              ]
            ),
            Container(
              child:
                imageFileList!.isNotEmpty ? 
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: <Widget>[
                    Image.file(
                      height: 150,
                      width: 150,
                      File(imageFileList![0].path)
                    ),
                    Image.file(
                      height: 150,
                      width: 150,
                      File(imageFileList![1].path)
                    ),
                    Image.file(
                      height: 150,
                      width: 150,
                      File(imageFileList![2].path)
                    ),
                  ]) :
                  null
            ),
          ]),
    );
  }

  //   void _getImagen() async {
  //   // ignore: invalid_use_of_visible_for_testing_member
  //   var imagen = await picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (imagen != null) {
  //       _imagen = File(imagen.path);
  //     }
  //   });
  // }
  void selectImages() async {
    final List<XFile> selectedImages = await picker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }
}
