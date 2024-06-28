import 'dart:convert';

RequestModel requestFromJson(String str) =>
    RequestModel.fromJson(json.decode(str));

String requestToJson(RequestModel data) => json.encode(data.toJson());

class RequestModel {
  RequestModel({
    this.email,
    this.password,
  });

  String? email;
  String? password;

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
