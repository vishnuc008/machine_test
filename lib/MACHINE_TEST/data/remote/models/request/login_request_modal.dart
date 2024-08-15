// To parse this JSON data, do
//
//     final loginRequestModal = loginRequestModalFromJson(jsonString);

import 'dart:convert';

LoginRequestModal loginRequestModalFromJson(String str) =>
    LoginRequestModal.fromJson(json.decode(str));

String loginRequestModalToJson(LoginRequestModal data) =>
    json.encode(data.toJson());

class LoginRequestModal {
  String userField;
  String password;

  LoginRequestModal({
    required this.userField,
    required this.password,
  });

  factory LoginRequestModal.fromJson(Map<String, dynamic> json) =>
      LoginRequestModal(
        userField: json["userField"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userField": userField,
        "password": password,
      };
}
