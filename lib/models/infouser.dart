import 'dart:convert';

Info infoFromJson(String str) => Info.fromJson(json.decode(str));

String infoToJson(Info data) => json.encode(data.toJson());

class Info {
    Info({
      required this.nombre,
      required this.rol,
    });

    String nombre;
    String rol;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        nombre: json["nombre"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "rol": rol,
    };
}