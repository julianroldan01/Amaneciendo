import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/carta.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'Secure_Storage.dart';

class Apidio {
  Dio dio = Dio();
  final String host = dotenv.get("HOST");

  Future<void> setToken() async {
    String? token = await SecureStorage.getToken();
    if(token != null) {
      dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
    }
  }


  Future<List<Carta>> getAllCarta(int type) async {
    await setToken();
    final res = await dio.get("$host/api/carta/$type");
    List<Carta> cartas = [];
    for(var el in res.data) {
      final Carta cart = Carta.fromJson(el); 
      cartas.add(cart);
    }
    return cartas;
  }

  Future<void> deleteProductById(int id) async {
    await setToken();
    await dio.delete("$host/api/carta/$id");
  }

  Future<void> addProduct(FormData data) async {
    await setToken();
    await dio.post("$host/api/carta", data: data);
  }

  static Dio dioAuth() {
    Dio dio = Dio();
    /*var token = await SecureStorage.getToken();
    if (token != null) {
      print(token);
      dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
    }*/
    return dio;
  }
}
