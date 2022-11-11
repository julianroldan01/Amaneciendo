import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:flutter_application_1/Apidio.dart';

class galery extends StatefulWidget {
  const galery({super.key});

  @override
  State<galery> createState() => _galeryState();
}

class _galeryState extends State<galery> {
  List<XFile>? imageFileList = [];
  late File _imagen = File('images/noimagen.png');
  final Apidio dio = Apidio();

  void selectImages() async {
    final List<XFile> selectedImages = await ImagePicker().pickMultiImage(imageQuality: 3);
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }


  void send() async {
    List<MultipartFile> multipart = <MultipartFile>[];
    
    for (int i = 0; i < imageFileList!.length; i++) {
      multipart.add(await MultipartFile.fromFile(imageFileList![i].path));
    }

    FormData data = FormData.fromMap({
      "imagenes": multipart
    });
    await dio.updateEstancoGallery(data);
  }

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
                    onPressed: send,
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
                    crossAxisCount: imageFileList!.length,
                    children: List<Widget>.generate(
                      imageFileList!.length,
                      (index) => Image.file(File(imageFileList![index].path))
                    )
                  ): null
            ),
          ]),
    );
  }
}
