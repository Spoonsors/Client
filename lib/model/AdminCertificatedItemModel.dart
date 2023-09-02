import 'dart:convert';

AdminCertificatedItemModel AdminCertificatedItemModelJson(String str) =>
    AdminCertificatedItemModel.fromJson(json.decode(str));

String AdminCertificatedItemModelToJson(AdminCertificatedItemModel data) =>
    json.encode(data.toJson());

class AdminCertificatedItemModel {
  int isVerified;
  String bmemberId;
  String bmemberName;
  String bmemberBirth;
  String bmemberPhoneNumber;
  String bmemberAddress;
  String bmemberCertificate;

  AdminCertificatedItemModel({
    required this.isVerified,
    required this.bmemberId,
    required this.bmemberName,
    required this.bmemberBirth,
    required this.bmemberPhoneNumber,
    required this.bmemberAddress,
    required this.bmemberCertificate,
  });

  factory AdminCertificatedItemModel.fromJson(Map<String, dynamic> json) =>
      AdminCertificatedItemModel(
          isVerified: json['is_verified'],
          bmemberId: json['bmember_id'],
          bmemberName: json['bmember_name'],
          bmemberBirth: json['bmember_birth'],
          bmemberPhoneNumber: json['bmember_phoneNumber'],
          bmemberAddress: json['bmember_address'],
          bmemberCertificate: json['bmember_certificate']);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_verified'] = isVerified;
    map['bmember_id'] = bmemberId;
    map['bmember_name'] = bmemberName;
    map['bmember_birth'] = bmemberBirth;
    map['bmember_phoneNumber'] = bmemberPhoneNumber;
    map['bmember_address'] = bmemberAddress;
    map['bmember_certificate'] = bmemberCertificate;
    return map;
  }
}
