import 'dart:convert';

// ignore: non_constant_identifier_names
List<Users> UsersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

// ignore: non_constant_identifier_names
String UsersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// ignore: camel_case_types
class Users {
  Users({
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

  factory Users.fromJson(Map<String, dynamic> json) => Users(
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
