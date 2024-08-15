// To parse this JSON data, do
//
//     final loginResponseModal = loginResponseModalFromJson(jsonString);

import 'dart:convert';

LoginResponseModal loginResponseModalFromJson(String str) =>
    LoginResponseModal.fromJson(json.decode(str));

String loginResponseModalToJson(LoginResponseModal data) =>
    json.encode(data.toJson());

class LoginResponseModal {
  bool status;
  int errorCode;
  String message;
  LoginData data;

  LoginResponseModal({
    required this.status,
    required this.errorCode,
    required this.message,
    required this.data,
  });

  factory LoginResponseModal.fromJson(Map<String, dynamic> json) =>
      LoginResponseModal(
        status: json["status"],
        errorCode: json["errorCode"],
        message: json["message"],
        data: LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errorCode": errorCode,
        "message": message,
        "data": data.toJson(),
      };
}

class LoginData {
  User user;
  Auth auth;

  LoginData({
    required this.user,
    required this.auth,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        user: User.fromJson(json["user"]),
        auth: Auth.fromJson(json["auth"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "auth": auth.toJson(),
      };
}

class Auth {
  String tokenType;
  int expiresIn;
  String accessToken;
  String refreshToken;

  Auth({
    required this.tokenType,
    required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "expires_in": expiresIn,
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}

class User {
  int id;
  String name;
  String email;
  dynamic imgUrl;
  String mobileNumber;
  dynamic countryCode;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.imgUrl,
    required this.mobileNumber,
    required this.countryCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        imgUrl: json["imgUrl"],
        mobileNumber: json["mobileNumber"],
        countryCode: json["countryCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "imgUrl": imgUrl,
        "mobileNumber": mobileNumber,
        "countryCode": countryCode,
      };
}
