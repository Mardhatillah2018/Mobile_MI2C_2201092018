// To parse this JSON data, do
//
//     final modelLoginLatihan = modelLoginLatihanFromJson(jsonString);

import 'dart:convert';

ModelLoginLatihan modelLoginLatihanFromJson(String str) => ModelLoginLatihan.fromJson(json.decode(str));

String modelLoginLatihanToJson(ModelLoginLatihan data) => json.encode(data.toJson());

class ModelLoginLatihan {
  int value;
  String message;
  String username;
  String nama;
  String id;

  ModelLoginLatihan({
    required this.value,
    required this.message,
    required this.username,
    required this.nama,
    required this.id,
  });

  factory ModelLoginLatihan.fromJson(Map<String, dynamic> json) => ModelLoginLatihan(
    value: json["value"],
    message: json["message"],
    username: json["username"],
    nama: json["nama"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
    "username": username,
    "nama": nama,
    "id": id,
  };
}
