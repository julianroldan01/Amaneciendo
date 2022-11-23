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
class listCliente extends StatefulWidget {
  listCliente({
    Key? key,
    required this.type,
  }) : super(key: key);

  final int type;
  final _listClienteState _ListclienteState = _listClienteState();

  callGetCarta() {
    _ListclienteState.refreshCartita();
  }

  @override
  // ignore: no_logic_in_create_state
  State<listCliente> createState() => _ListclienteState;
}

// ignore: camel_case_types
class _listClienteState extends State<listCliente> {
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
                      leading: SizedBox(
                        width: 60,
                        height: 60,
                        child: CachedNetworkImage(
                          imageUrl: snap.data![i].imagen,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
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
