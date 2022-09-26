// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<user> userFromJson(String str) =>
    List<user>.from(json.decode(str).map((x) => user.fromJson(x)));

String welcomeToJson(List<user> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// ignore: camel_case_types
class user {
  user({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.email,
    required this.contrasena,
    required this.telefono,
    required this.idRol,
  });

  int id;
  String nombre;
  String direccion;
  String email;
  String contrasena;
  String telefono;
  int idRol;

  factory user.fromJson(Map<String, dynamic> json) => user(
        id: json["id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        email: json["email"],
        contrasena: json["contrasena"],
        telefono: json["telefono"],
        idRol: json["id_rol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "direccion": direccion,
        "email": email,
        "contrasena": contrasena,
        "telefono": telefono,
        "id_rol": idRol,
      };
}
