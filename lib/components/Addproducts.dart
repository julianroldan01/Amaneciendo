// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_application_1/Apidio.dart';

import '../models/carta.dart';

class AddProduct extends StatefulWidget {
  final int type;
  final Function parentFunction;

  const AddProduct({
    Key? key,
    required this.type,
    required this.parentFunction,
  }) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController producto = TextEditingController();
  final TextEditingController volumen = TextEditingController();
  final TextEditingController valor = TextEditingController();
  late Future<List<Carta>> cartita;
  final Apidio dio = Apidio();
  final picker = ImagePicker();
  late File _imagen = File('images/noimagen.png');
  final String host = dotenv.get("HOST");

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AlertDialog(
              title: const Text("Agregar Producto",
                  style: TextStyle(color: Colors.orange)),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                TextField(
                  controller: producto,
                  decoration: const InputDecoration(hintText: "producto"),
                ),
                TextField(
                  controller: volumen,
                  decoration:
                      const InputDecoration(hintText: "contenido del producto"),
                ),
                TextField(
                  controller: valor,
                  decoration: const InputDecoration(hintText: "valor"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    color: Colors.orange[100],
                    child: Image.file(_imagen, fit: BoxFit.cover),
                  ),
                ),
                FlatButton(
                  onPressed: _getImagen,
                  color: const Color.fromARGB(102, 43, 42, 42),
                  textColor: Colors.white,
                  child: Row(
                    children: const <Widget>[
                      Icon(Icons.download_rounded),
                      Text('Cargar imagen')
                    ],
                  ),
                ),
              ]),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () {
                    saveProducto();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Guardar"),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  void _getImagen() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var imagen = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (imagen != null) {
        _imagen = File(imagen.path);
      } else {
        print('No selecciono una foto');
      }
    });
  }

  void saveProducto() async {
    FormData data = FormData.fromMap({
      "producto": producto.text,
      "volumen": volumen.text,
      "valor": valor.text,
      "id_tipo": widget.type,
      "imagen": await MultipartFile.fromFile(_imagen.path)
    });
    await dio.addProduct(data);
    producto.clear();
    volumen.clear();
    valor.clear();
    widget.parentFunction();
  }
}
