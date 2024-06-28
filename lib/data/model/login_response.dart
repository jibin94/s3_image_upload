import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  Data? data;
  String? message;
  int? status;

  LoginResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "status": status,
      };
  LoginResponseModel.withError(int errorValue, String errorMessage)
      : status = errorValue,
        message = errorMessage;
}

class Data {
  String? email;
  String? userId;
  String? username;

  Data({
    this.email,
    this.userId,
    this.username,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        userId: json["user_id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "user_id": userId,
        "username": username,
      };
}
