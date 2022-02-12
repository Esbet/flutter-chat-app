import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
       this.nombre,
       this.email,
       this.onine,
       this.uid,
    });

    String? nombre;
    String? email;
    bool? onine;
    String? uid;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        email: json["email"],
        onine: json["onine"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "email": email,
        "onine": onine,
        "uid": uid,
    };
}
