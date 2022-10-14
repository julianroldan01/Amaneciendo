import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Apidio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/components/Products.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({required this.type});

  final int type;
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final contHeaders = {"Content-Type": "application/json;charset=UTF-8"};
  final TextEditingController producto = TextEditingController();
  final TextEditingController volumen = TextEditingController();
  final TextEditingController valor = TextEditingController();
  final int idtipo = 1;
  final Dio dio = Apidio.dioAuth();
  final picker = ImagePicker();
  late Future<File> _imagen = Future(() => File('images/noimagen.png'));

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
                    child: FutureBuilder<File>(
                        future: _imagen,
                        builder: (context, snap) {
                          if (snap.hasData) return Image.file(snap.data!);
                          if (snap.hasError)
                            return const Text('No hay Imagen',
                                textAlign: TextAlign.center);
                          return const Text('No hay Imagen',
                              textAlign: TextAlign.center);
                        }),
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
        _imagen = Future(() => File(imagen.path));
      } else {
        print('No selecciono una foto');
      }
    });
  }

  void saveProducto() async {
    // final res = await Uri.parse("http://192.168.1.102:4000/api/carta");
    final product = {
      "producto": producto.text,
      "volumen": volumen.text,
      "valor": valor.text,
      "id_tipo": idtipo,
      "imagen": _imagen.toString()
    };
    // await http.post(res, headers: headers, body: jsonEncode(product));
  final response =  await dio.post("http://192.168.1.102:4000/api/carta",
        options: Options(headers: contHeaders), data: jsonEncode(product));
    producto.clear();
    volumen.clear();
    valor.clear();
    // if (response.statusCode == 200){
    //   setState(() {
        
    //   });
    // }
  }
}
