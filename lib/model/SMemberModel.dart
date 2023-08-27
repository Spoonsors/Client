import 'dart:convert';

import 'SponModel.dart';

SMember SMemberJson(String str) => SMember.fromJson(json.decode(str));

String SMemberToJson(SMember data) => json.encode(data.toJson());

class SMember {
  String? createDate;
  String? modifiedDate;
  String? role;
  String? token;
  String? profilePath;
  String? smemberId;
  String? smemberName;
  String? smemberNickname;
  String? sMember_id;
  String? sMember_pwd;
  String? sMember_phoneNumber;
  List<Spon>? spons;

  SMember(
      {this.createDate,
      this.modifiedDate,
      this.role,
      this.token,
      this.profilePath,
      this.smemberId,
      this.smemberName,
      this.smemberNickname,
      this.sMember_id,
      this.sMember_phoneNumber,
      this.sMember_pwd,
      this.spons});

  SMember.fromJson(Map<String, dynamic> json) {
    createDate = json['createDate'];
    modifiedDate = json['modifiedDate'];
    role = json['role'];
    token = json['token'];
    profilePath = json['profile_path'];
    smemberId = json['smember_id'];
    smemberName = json['smember_name'];
    smemberNickname = json['smember_nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createDate'] = this.createDate;
    data['modifiedDate'] = this.modifiedDate;
    data['role'] = this.role;
    data['token'] = this.token;
    data['profile_path'] = this.profilePath;
    data['smember_id'] = this.smemberId;
    data['smember_name'] = this.smemberName;
    data['smember_nickname'] = this.smemberNickname;
    return data;
  }
}
