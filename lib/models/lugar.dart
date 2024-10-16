// To parse this JSON data, do
//
//     final lugar = lugarFromMap(jsonString);

import 'dart:convert';

//

class Place {
  String altId;
  String detalles;
  String foto;
  String plId;
  String map;
  String nombre;

  String ubicacion;

  Place({
    required this.altId,
    required this.detalles,
    required this.foto,
    required this.plId,
    required this.map,
    required this.nombre,
    required this.ubicacion,
  });

  factory Place.fromJson(String str) => Place.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Place.fromMap(Map<String, dynamic> json) => Place(
        altId: json["alt_id"],
        detalles: json["detalles"],
        foto: json["foto"],
        plId: json["pl_id"],
        map: json["map"],
        nombre: json["nombre"],
        ubicacion: json["ubicacion"],
      );

  Map<String, dynamic> toMap() => {
        "alt_id": altId,
        "detalles": detalles,
        "foto": foto,
        "pl_id": plId,
        "map": map,
        "nombre": nombre,
        "ubicacion": ubicacion,
      };
}

//class Lugar {
//   Place maleconConocimiento;
//   Place paseoBanderas;

//   Lugar({
//     required this.maleconConocimiento,
//     required this.paseoBanderas,
//   });

//   factory Lugar.fromJson(String str) => Lugar.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Lugar.fromMap(Map<String, dynamic> json) => Lugar(
//         maleconConocimiento: Place.fromMap(json["malecon_conocimiento"]),
//         paseoBanderas: Place.fromMap(json["paseo_banderas"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "malecon_conocimiento": maleconConocimiento.toMap(),
//         "paseo_banderas": paseoBanderas.toMap(),
//       };
// }
