// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import '../models/carta.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/carta.dart';

// ignore: camel_case_types
class energizantes extends StatefulWidget {
  const energizantes({super.key});

  @override
  State<energizantes> createState() => _energizantesState();
}

// ignore: camel_case_types
class _energizantesState extends State<energizantes> {
  final url = Uri.parse("http://192.168.1.108:4000/api/carta");
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  late Future<List<Carta>> cartita;
  final TextEditingController producto = TextEditingController();
  final TextEditingController volumen = TextEditingController();
  final TextEditingController valor = TextEditingController();
  final TextEditingController tipo = TextEditingController(text: "energizantes");
  File? _imagen;
  final picker = ImagePicker();
  void _getImagen() async {
    var imagen =
        // ignore: invalid_use_of_visible_for_testing_member
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (imagen != null) {
        _imagen = File(imagen.path);
      } else {
        print('No selecciono una foto');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage("images/fondo.png")),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 35.0),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_circle_left_outlined),
                    color: Colors.white,
                    iconSize: 48,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 1.0),
                      child: const Text("CERVEZA NACIONAL",
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
              FutureBuilder<List<Carta>>(
                future: cartita,
                builder: (context, snap) {
                  if (snap.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snap.data!.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              ListTile(
                                leading: SizedBox(
                                    width: 50,
                                    height: 100,
                                    child: Image.asset(snap.data![i].imagen)),
                                title: Text(snap.data![i].producto,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Acme",
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500)),
                                subtitle: Text(snap.data![i].volumen,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Acme",
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500)),
                                trailing: Text(snap.data![i].valor.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Acme",
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const Divider()
                            ],
                          );
                        });
                  }
                  if (snap.hasError) {
                    return const Center(
                      child: Text("Ups ha habido un error"),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: showForm,
            child: const Icon(Icons.add, color: Colors.orange)),
      ),
    );
  }

  void showForm() {
    showDialog(
        context: context,
        builder: (context) {
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
                        decoration: const InputDecoration(
                            hintText: "contenido del producto"),
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
                          child: _imagen == null
                              ? const Text(
                                  'No hay Imagen',
                                  textAlign: TextAlign.center,
                                )
                              : Image.file(_imagen!),
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
        });
  }

  @override
  void initState() {
    super.initState();
    cartita = getCarta();
  }

  Future<List<Carta>> getCarta() async {
    final res = await http.get(url);
    final lista = List.from(jsonDecode(res.body));

    List<Carta> cartita = [];
    for (var element in lista) {
      final Carta cart = Carta.fromJson(element);
      cartita.add(cart);
    }

    return cartita;
  }

  // void saveProduto(imagen, producto, volumen, valor) async {
  //   {
  //     await http.post(url, body: {
  //       'imagen': imagen,
  //       'producto': producto,
  //       'volumen': volumen,
  //       'valor': valor
  //     });
  //   }
  // }

  void saveProducto() async {
    final product = {
      "producto": producto.text,
      "volumen": volumen.text,
      "valor": valor.text,
      "tipo": tipo.text,
      "imagen": _imagen.toString()
    };
    await http.post(url, headers: headers, body: jsonEncode(product));
    producto.clear();
    volumen.clear();
    valor.clear();
    tipo.clear();
    setState(() {
      cartita = getCarta();
    });
  }
}