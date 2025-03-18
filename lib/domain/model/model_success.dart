// To parse this JSON data, do
//
//     final modelSucces = modelSuccesFromJson(jsonString);

import 'dart:convert';

ModelSucces modelSuccesFromJson(String str) =>
    ModelSucces.fromJson(json.decode(str));

String modelSuccesToJson(ModelSucces data) => json.encode(data.toJson());

class ModelSucces {
  String errorCode;
  String message;
  dynamic result;

  ModelSucces({
    required this.errorCode,
    required this.message,
    required this.result,
  });

  factory ModelSucces.fromJson(Map<String, dynamic> json) => ModelSucces(
        errorCode: json['errorCode'],
        message: json['message'],
        result: json['result'],
      );

  Map<String, dynamic> toJson() => {
        'errorCode': errorCode,
        'message': message,
        'result': result,
      };
}
