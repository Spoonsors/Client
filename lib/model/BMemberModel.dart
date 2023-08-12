import 'dart:convert';

BMember BMemberJson(String str) => BMember.fromJson(json.decode(str));

String BMemberToJson(BMember data) => json.encode(data.toJson());

class BMember {
  String bMember_id;
  String bMember_pwd;
  String bMember_nickname;
  String bMember_phoneNumber;
  String bMember_address;
  String bMember_certificate;

  BMember(
      {required this.bMember_id,
      required this.bMember_pwd,
      required this.bMember_nickname,
      required this.bMember_phoneNumber,
      required this.bMember_address,
      required this.bMember_certificate});

  factory BMember.fromJson(Map<String, dynamic> json) => BMember(
        bMember_id: json["bMember_id"],
        bMember_pwd: json["bMember_pwd"],
        bMember_nickname: json["bMember_nickname"],
        bMember_phoneNumber: json["bMember_phoneNumber"],
        bMember_address: json["bMember_address"],
        bMember_certificate: json["bMember_certificate"],
      );

  Map<String, dynamic> toJson() => {
        "bMember_id": bMember_id,
        "bMember_pwd": bMember_pwd,
        "bMember_nickname": bMember_nickname,
        "bMember_phoneNumber": bMember_phoneNumber,
        "bMember_address": bMember_address,
        "bMember_certificate": bMember_certificate,
      };

  //읽기 전용으로 제공
  String get bMember_Id => bMember_id;
  String get bMember_Pwd => bMember_pwd;
  String get bMember_Nickname => bMember_nickname;
  String get bMember_PhoneNumber => bMember_phoneNumber;
  String get bMember_Address => bMember_address;
  String get bMember_Certificate => bMember_certificate;
}
