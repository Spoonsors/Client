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

  Future<Uri> kakaoLogin() async {
    Dio dio = new Dio();
    dio.options.followRedirects = true;
    dio.options.responseType = ResponseType.plain;
    Response response = await dio.get(
        "https://kauth.kakao.com/oauth/authorize?client_id=03bbdf71352156f08fd91cdbd4b861e1&redirect_uri=http://15.165.106.139:8080/join/kakao&response_type=code");

    if (response.statusCode == 200) {
      // API 호출이 성공한 경우
      print('API response: ${response.data}');
    } else {
      // API 호출이 실패한 경우
      print('API request failed with status code: ${response.statusCode}');
    }
    return response.realUri;
  }
}
