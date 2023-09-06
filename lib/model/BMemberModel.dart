import 'dart:convert';

BMember BMemberJson(String str) => BMember.fromJson(json.decode(str));

String BMemberToJson(BMember data) => json.encode(data.toJson());

class BMember {
  String? bMember_id;
  String? bMember_pwd;
  String? bMember_nickname;
  String? bMember_phoneNumber;
  String? bMember_address;
  String? bMember_certificate;
  String? createDate;
  String? modifiedDate;
  String? token;
  int? isVerified;
  String? profilePath;
  String? bmemberName;
  String? bmemberBirth;
  int? canPost;

  BMember(
      {this.bMember_id,
      this.bMember_pwd,
      this.bMember_nickname,
      this.bMember_phoneNumber,
      this.bMember_address,
      this.bMember_certificate,
      this.createDate,
      this.modifiedDate,
      this.token,
      this.isVerified,
      this.profilePath,
      this.bmemberName,
      this.bmemberBirth,
      this.canPost});

  BMember.fromJson(Map<String, dynamic> json) {
    bMember_id = json["bmember_id"];
    bMember_pwd = json["bMember_pwd"];
    bMember_nickname = json["bmember_nickname"];
    bMember_phoneNumber = json["bMember_phoneNumber"];
    bMember_address = json["bMember_address"];
    bMember_certificate = json["bMember_certificate"];
    createDate = json['createDate'].toString();
    modifiedDate = json['modifiedDate'].toString();
    token = json['token'];
    isVerified = json['is_verified'];
    profilePath = json['profile_path'];
    bmemberName = json['bmember_name'];
    bmemberBirth = json['bmember_birth'];
    canPost = json['can_post'];
  }

  Map<String, dynamic> toJson() => {
        "bMember_id": bMember_id,
        "bMember_pwd": bMember_pwd,
        "bMember_nickname": bMember_nickname,
        "bMember_phoneNumber": bMember_phoneNumber,
        "bMember_address": bMember_address,
        "bMember_certificate": bMember_certificate,
      };
}
