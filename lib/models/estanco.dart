// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    Welcome({
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
       required this.horarioEstanco,
       required this.longitud,
       required this.latitud,
    });

    int idEstanco;
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
    String horarioEstanco;
    String longitud;
    String latitud;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
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
        horarioEstanco: json["horario_estanco"],
        longitud: json["longitud"],
        latitud: json["latitud"],
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
        "horario_estanco": horarioEstanco,
        "longitud": longitud,
        "latitud": latitud,
    };
}
