import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RequestSMS {
  String? to;
  String? phoneNum;
  String? code;

  RequestSMS({this.to});

  RequestSMS.fromJson(Map<String, dynamic> json) {
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = this.to;
    return data;
  }
}

class SMSService extends ChangeNotifier {
  String idAnswer = "";
  String pwAnswer = "";
  void getSMS(String phone) async {
    Dio dio = new Dio();
    Map<String, dynamic> data = {"to": phone};
    try {
      Response response =
          await dio.post("http://15.165.106.139:8080/sms/send/", data: data);
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('문자 전송 성공');
        print(response.data);
        idAnswer = "success";
      } else {
        // 업로드 실패 시 처리
        print('전송 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('문자 전송 에러');
      print(e.toString());
    }
  }

  void verifySMS(String phoneNum, String code) async {
    Dio dio = new Dio();
    Map<String, dynamic> data = {"phoneNum": phoneNum, "code": code};
    try {
      Response response =
          await dio.post("http://15.165.106.139:8080/sms/verify/", data: data);
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('정보 전송 성공');
        print(response.data.toString);
      } else {
        // 업로드 실패 시 처리
        print('전송 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('정보 전송 에러');
      print(e.toString());
    }
  }

  void verifyID(String name, String phoneNum) async {
    //아이디 존재하는지 확인
    Dio dio = new Dio();
    Map<String, dynamic> data = {"name": name, "phoneNum": phoneNum};
    try {
      Response response = await dio.post(
        "http://15.165.106.139:8080/join/matchId/",
        data: data,
      );
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('아이디 전송 성공');
        print(response.data);
        pwAnswer = "success";
      } else {
        // 업로드 실패 시 처리
        print('전송 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('아이디 전송 에러');
      print(e.toString());
      pwAnswer = "fail";
    }
  }

  void changePw(String id, String new_pw) async {
    Dio dio = new Dio();
    Map<String, dynamic> data = {"id": id, "pwd": new_pw};
    try {
      Response response = await dio
          .post("http://15.165.106.139:8080/join/changePwd/", data: data);
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('아이디 전송 성공');
        print(response.data);
        pwAnswer = "success";
      } else {
        // 업로드 실패 시 처리
        print('전송 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('아이디 전송 에러');
      print(e.toString());
    }
  }
}
