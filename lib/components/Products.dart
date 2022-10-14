// ignore_for_file: file_names

import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Apidio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import '../../models/carta.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/carta.dart';
import 'package:collection/collection.dart';
import '../Secure_Storage.dart';

// ignore: camel_case_types
class Products extends StatefulWidget {
  const Products({required this.type});

  final int type;

  @override
  State<Products> createState() => _ProductsState();
}

// ignore: camel_case_types
class _ProductsState extends State<Products> {
  final Dio dio = Apidio.dioAuth();
  late Future<List<Carta>> cartita;
  final picker = ImagePicker();

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
                          width: 50,
                          height: 100,
                          child: Image.asset(snap.data![i].imagen)),
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

  @override
  void initState() {
    super.initState();
    cartita = getCarta(widget.type);
  }

  Future<List<Carta>> getCarta(int type) async {
    final res = await dio.get("http://192.168.1.102:4000/api/carta/$type");
    final lista = res.data;
    // List <Map<String, dynamic>> lista = List.from(jsonDecode(res.data));
    // final url = Uri.parse("http://192.168.1.103:4000/api/carta/$type");
    // final resp = await http.get(url);
    // print(resp.body);
    // final listap = List.from(jsonDecode(resp.body));

    // Function eq = const ListEquality().equals;
    // print('***');
    // print(eq(lista, listap)); // => true

    List<Carta> cartita = [];
    for (var element in lista) {
      final Carta cart = Carta.fromJson(element);
      cartita.add(cart);
    }
    return cartita;
  }
}
