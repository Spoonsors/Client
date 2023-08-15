import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/BMemberModel.dart';
import '../model/SponModel.dart';

class PostBMember {
  String bMember_id;
  String bMember_pwd;
  String bMember_pwd_check;
  String bMember_nickname;
  String bMember_phoneNumber;
  String bMember_address;
  String bMember_certificate;
  String bMember_token;
  PostBMember(
      {required this.bMember_id,
      required this.bMember_pwd,
      required this.bMember_pwd_check,
      required this.bMember_nickname,
      required this.bMember_phoneNumber,
      required this.bMember_address,
      required this.bMember_certificate,
      required this.bMember_token});
}

class PostSMember {
  String sMember_id;
  String sMember_pwd;
  String sMember_pwd_check;
  String sMember_nickname;
  String sMember_phoneNumber;
  String sMember_token;
  PostSMember(
      {required this.sMember_id,
      required this.sMember_pwd,
      required this.sMember_pwd_check,
      required this.sMember_nickname,
      required this.sMember_phoneNumber,
      required this.sMember_token});
}

class SignupService extends ChangeNotifier {
  void signupBMember(PostBMember bMember) async {
    Map<String, dynamic> data = {
      "id": bMember.bMember_id,
      "pwd": bMember.bMember_pwd,
      "pwd_check": bMember.bMember_pwd_check,
      "nickname": bMember.bMember_nickname,
      "phoneNumber": bMember.bMember_phoneNumber,
      "address": bMember.bMember_address,
      "certificate": bMember.bMember_certificate,
      "token": bMember.bMember_token
    };
    try {
      Response response =
          await Dio().post("http://3.86.110.15:8080/join/bMember", data: data);
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('가입 정보 POST 성공');
        print(response.data);
      } else {
        // 업로드 실패 시 처리
        print('업로드 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('가입 정보 POST 에러');
      print(e.toString());
    }
  }

  void signupSMember(PostSMember sMember) async {
    Map<String, dynamic> data = {
      "id": sMember.sMember_id,
      "pwd": sMember.sMember_pwd,
      "pwd_check": sMember.sMember_pwd_check,
      "nickname": sMember.sMember_nickname,
      "phoneNumber": sMember.sMember_phoneNumber,
      "token": sMember.sMember_token,
    };
    try {
      Response response =
          await Dio().post("http://3.86.110.15:8080/join/sMember", data: data);
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('가입 정보 POST 성공');
        print(response.data);
      } else {
        // 업로드 실패 시 처리
        print('업로드 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('가입 정보 POST 에러');
      print(e.toString());
    }
  }

  Future<bool> DuplicateCheckId(String id) async {
    Response response =
        await Dio().get("http://3.86.110.15:8080/join/checkId?id=" + id);
    if (response == "사용 가능한 아이디입니다.") {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> DuplicateCheckNickname(String nickname) async {
    Response response = await Dio()
        .get("http://3.86.110.15:8080/join/checkNickname?nickname=" + nickname);
    if (response == "사용 가능한 닉네임입니다.") {
      return true;
    } else {
      return false;
    }
  }
}