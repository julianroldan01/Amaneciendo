// To parse this JSON data, do
//
//     final formulario = formularioFromJson(jsonString);

import 'dart:convert';

List<formulario> formularioFromJson(String str) => List<formulario>.from(json.decode(str).map((x) => formulario.fromJson(x)));

String formularioToJson(List<formulario> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// ignore: camel_case_types
class formulario {
    formulario({
       required this.idEstanco,
       required this.nombreEstanco,
       required this.direccionEstanco,
       required this.barrio,
       required this.telefonoEstanco,
       required this.idZona,
       required this.idFranquicia,
       required this.imagenEstanco,
       required this.logoEstanco,
       required this.descripcion,
       required this.horaEstanco,
       required this.longitud,
       required this.latitud,
       required this.nit,
       required this.cedulaRepresentante,
       required this.nombre,
       required this.direccion,
       required this.email,
       required this.contrasena,
       required this.telefono,
       required this.idRol,
    });

    dynamic idEstanco;
    String nombreEstanco;
    String direccionEstanco;
    String barrio;
    String telefonoEstanco;
    int idZona;
    int idFranquicia;
    String imagenEstanco;
    String logoEstanco;
    String descripcion;
    String horaEstanco;
    String longitud;
    String latitud;
    String nit;
    String cedulaRepresentante;
    String nombre;
    String direccion;
    String email;
    String contrasena;
    String telefono;
    int idRol;

    factory formulario.fromJson(Map<String, dynamic> json) => formulario(
        idEstanco: json["id_estanco"],
        nombreEstanco: json["nombre_estanco"],
        direccionEstanco: json["direccion_estanco"],
        barrio: json["barrio"],
        telefonoEstanco: json["telefono_estanco"],
        idZona: json["id_zona"],
        idFranquicia: json["id_franquicia"],
        imagenEstanco: json["imagen_estanco"],
        logoEstanco: json["logo_estanco"],
        descripcion: json["descripcion"],
        horaEstanco: json["hora_estanco"],
        longitud: json["longitud"],
        latitud: json["latitud"],
        nit: json["nit"],
        cedulaRepresentante: json["cedula_representante"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        email: json["email"],
        contrasena: json["contrasena"],
        telefono: json["telefono"],
        idRol: json["id_rol"],
    );

    Map<String, dynamic> toJson() => {
        "id_estanco": idEstanco,
        "nombre_estanco": nombreEstanco,
        "direccion_estanco": direccionEstanco,
        "barrio": barrio,
        "telefono_estanco": telefonoEstanco,
        "id_zona": idZona,
        "id_franquicia": idFranquicia,
        "imagen_estanco": imagenEstanco,
        "logo_estanco": logoEstanco,
        "descripcion": descripcion,
        "hora_estanco": horaEstanco,
        "longitud": longitud,
        "latitud": latitud,
        "nit": nit,
        "cedula_representante": cedulaRepresentante,
        "nombre": nombre,
        "direccion": direccion,
        "email": email,
        "contrasena": contrasena,
        "telefono": telefono,
        "id_rol": idRol,
    };
}
