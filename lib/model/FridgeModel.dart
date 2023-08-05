import 'dart:convert';
import 'dart:ffi';

Fridge FridgeJson(String str) => Fridge.fromJson(json.decode(str));

String FridgeToJson(Fridge data) => json.encode(data.toJson());

class Fridge {
  Long fridge_id;
  String fridge_pwd;
  String fridge_nickname;
  String fridge_phoneNumber;
  String fridge_address;
  String fridge_certificate;

  Fridge(
      {required this.fridge_id,
      required this.fridge_pwd,
      required this.fridge_nickname,
      required this.fridge_phoneNumber,
      required this.fridge_address,
      required this.fridge_certificate});

  factory Fridge.fromJson(Map<String, dynamic> json) => Fridge(
        fridge_id: json["fridge_id"],
        fridge_pwd: json["fridge_pwd"],
        fridge_nickname: json["fridge_nickname"],
        fridge_phoneNumber: json["fridge_phoneNumber"],
        fridge_address: json["fridge_address"],
        fridge_certificate: json["fridge_certificate"],
      );

  Map<String, dynamic> toJson() => {
        "fridge_id": fridge_id,
        "fridge_pwd": fridge_pwd,
        "fridge_nickname": fridge_nickname,
        "fridge_phoneNumber": fridge_phoneNumber,
        "fridge_address": fridge_address,
        "fridge_certificate": fridge_certificate,
      };
}
