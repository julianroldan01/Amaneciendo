// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_application_1/Apidio.dart';
import 'package:flutter_application_1/models/carta.dart';

import '../../models/carta.dart';

// ignore: camel_case_types
class Products extends StatefulWidget {
  Products({
    Key? key,
    required this.type,
  }) : super(key: key);

  final int type;
  final _ProductsState _productsState = _ProductsState();

  callGetCarta() {
    _productsState.refreshCartita();
  }

  @override
  // ignore: no_logic_in_create_state
  State<Products> createState() => _productsState;
}

// ignore: camel_case_types
class _ProductsState extends State<Products> {
  final Apidio apiDio = Apidio();
  late Future<List<Carta>> cartita;
  final picker = ImagePicker();
  final String host = dotenv.get("HOST");

  @override
  void initState() {
    super.initState();
    refreshCartita();
  }

  void deleteProducto(int idProducto) async {
    await apiDio.deleteProductById(idProducto);
    refreshCartita();
  }

  refreshCartita() {
    setState(() {
      cartita = apiDio.getAllCarta(widget.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Carta>>(
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                      "Estas seguro que quieres eliminar este producto?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        deleteProducto(snap.data![i].id_carta);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Si"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("No"),
                                    )
                                  ],
                                ));
                      },
                      leading: SizedBox(
                        width: 50,
                        height: 100,
                        child: CachedNetworkImage(
                          imageUrl: snap.data![i].imagen,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      title: Text(snap.data![i].producto,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Acme",
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500)),
                      subtitle: Text(
                        snap.data![i].volumen,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Acme",
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Text(
                        snap.data![i].valor.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Acme",
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
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
    );
  }
}
