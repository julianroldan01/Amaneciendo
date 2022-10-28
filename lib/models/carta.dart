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
    // ignore: non_constant_identifier_names
    required this.id_carta,
    required this.imagen,
    required this.producto,
    required this.volumen,
    required this.valor, 
    required this.idtipo
  });
  // ignore: non_constant_identifier_names
  int id_carta;
  String imagen;
  String producto;
  String volumen;
  int valor;
  int idtipo;

  factory Carta.fromJson(Map<String, dynamic> json) => Carta(
    id_carta: json["id_carta"] as int,
    imagen: json["imagen"] as String,
    producto: json["producto"] as String,
    volumen: json["volumen"] as String,
    valor: json["valor"] as int,
    idtipo: json["id_tipo"] as int
  );

  Map<String, dynamic> toJson() => {
    "id_carta": id_carta,
    "imagen": imagen,
    "producto": producto,
    "volumen": volumen,
    "valor": valor,
    "id_tipo": idtipo
  };
}
