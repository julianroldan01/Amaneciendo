// To parse this JSON data, do
//
//     final carta = cartaFromJson(jsonString);

import 'dart:convert';

List<Carta> cartaFromJson(String str) =>
    List<Carta>.from(json.decode(str).map((x) => Carta.fromJson(x)));

String cartaToJson(List<Carta> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Carta {
  Carta({
    required this.imagen,
    required this.producto,
    required this.volumen,
    required this.valor, 
    required this.idtipo
  });

  String imagen;
  String producto;
  String volumen;
  int valor;
  int idtipo;

  factory Carta.fromJson(Map<String, dynamic> json) => Carta(
    imagen: json["imagen"] as String,
    producto: json["producto"] as String,
    volumen: json["volumen"] as String,
    valor: json["valor"] as int,
    idtipo: json["id_tipo"] as int
  );

  Map<String, dynamic> toJson() => {
    "imagen": imagen,
    "producto": producto,
    "volumen": volumen,
    "valor": valor,
    "id_tipo": idtipo
  };
}
