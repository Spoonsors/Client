import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/BMemberModel.dart';
import '../model/SMemberModel.dart';

class LoginService extends ChangeNotifier {
  late BMember loginB;
  late SMember loginS;
  late bool answer;
  void loginBMember(String id, String pwd) async {
    Map<String, dynamic> data = {
      "id": id,
      "pwd": pwd,
    };
    try {
      Response response = await Dio()
          .post("http://15.165.106.139:8080/login/bMember", data: data);
      //토큰 처리
      loginB = BMember(
          bMember_id: response.data["member_id"],
          bMember_nickname: response.data["member_nickname"],
          bMember_pwd: "null",
          bMember_address: response.data["member_address"],
          bMember_certificate: "null",
          bMember_phoneNumber: response.data["member_phoneNumber"]);
      answer = true;
    } catch (e) {
      answer = false;
      print(e.toString());
    }
  }

  void loginSMember(String _id, String _pwd) async {
    Map<String, dynamic> data = {
      "id": _id,
      "pwd": _pwd,
    };
    try {
      Response response = await Dio()
          .post("http://15.165.106.139:8080/login/sMember", data: data);
      //토큰 처리
      loginS = SMember(
          sMember_id: response.data["member_id"],
          smemberNickname: response.data["member_nickname"],
          sMember_pwd: "null",
          sMember_phoneNumber: response.data["member_phoneNumber"],
          spons: []);
    } catch (e) {}
  }
}
