import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/BMemberModel.dart';
import '../model/SponModel.dart';

class LoginService extends ChangeNotifier {
  Future<bool> loginBMember(String _id, String _pwd) async {
    Map<String, dynamic> data = {
      "id": _id,
      "pwd": _pwd,
    };
    try {
      Response response =
          await Dio().post("http://3.86.110.15:8080/login/bMember", data: data);
      //토큰 처리
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> loginSMember(String _id, String _pwd) async {
    Map<String, dynamic> data = {
      "id": _id,
      "pwd": _pwd,
    };
    try {
      Response response =
          await Dio().post("http://3.86.110.15:8080/login/sMember", data: data);
      //토큰 처리
      return true;
    } catch (e) {
      return false;
    }
  }
}
