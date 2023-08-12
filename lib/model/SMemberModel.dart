import 'dart:convert';

import 'SponModel.dart';

SMember SMemberJson(String str) => SMember.fromJson(json.decode(str));

String SMemberToJson(SMember data) => json.encode(data.toJson());

class SMember {
  String sMember_id;
  String sMember_pwd;
  String sMember_nickname;
  String sMember_phoneNumber;
  List<Spon> spons;

  SMember(
      {required this.sMember_id,
      required this.sMember_pwd,
      required this.sMember_nickname,
      required this.sMember_phoneNumber,
      required this.spons});

  factory SMember.fromJson(Map<String, dynamic> json) => SMember(
        sMember_id: json["sMember_id"],
        sMember_pwd: json["sMember_pwd"],
        sMember_nickname: json["sMember_nickname"],
        sMember_phoneNumber: json["sMember_phoneNumber"],
        spons: json["spons"],
      );

  Map<String, dynamic> toJson() => {
        "sMember_id": sMember_id,
        "sMember_pwd": sMember_pwd,
        "sMember_nickname": sMember_nickname,
        "sMember_phoneNumber": sMember_phoneNumber,
        "spons": spons,
      };
}
