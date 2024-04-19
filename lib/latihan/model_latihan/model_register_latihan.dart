// To parse this JSON data, do
//
//     final modelRegisterLatihan = modelRegisterLatihanFromJson(jsonString);

import 'dart:convert';

ModelRegisterLatihan modelRegisterLatihanFromJson(String str) => ModelRegisterLatihan.fromJson(json.decode(str));

String modelRegisterLatihanToJson(ModelRegisterLatihan data) => json.encode(data.toJson());

class ModelRegisterLatihan {
  int value;
  String message;

  ModelRegisterLatihan({
    required this.value,
    required this.message,
  });

  factory ModelRegisterLatihan.fromJson(Map<String, dynamic> json) => ModelRegisterLatihan(
    value: json["value"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
  };
}
