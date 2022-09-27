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
    required this.idCarta,
    required this.imagen,
    required this.producto,
    required this.volumen,
    required this.valor, 
    required this.idtipo
  });

  int idCarta;
  String imagen;
  String producto;
  String volumen;
  int valor;
  int idtipo;

  factory Carta.fromJson(Map<String, dynamic> json) => Carta(
        idCarta: json["id_carta"],
        imagen: json["imagen"],
        producto: json["producto"],
        volumen: json["volumen"],
        valor: json["valor"],
        idtipo: json["id_tipo"]
      );

  Map<String, dynamic> toJson() => {
        "id_carta": idCarta,
        "imagen": imagen,
        "producto": producto,
        "volumen": volumen,
        "valor": valor,
        "id_tipo": idtipo
      };
}
