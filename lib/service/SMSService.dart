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
  String requestedId = "";
  String idAnswer = "";
  String idCodeVerified = "";
  String pwAnswer = "";
  String pwCodeVerified = "";
  dynamic sessionId = "";
  Dio dioId = new Dio();

  Future<void> verifyIdAndSendCode(String name, String phoneNum) async {
    //아이디 : 아이디 존재하는지 확인하고 있으면 인증번호 전송
    Map<String, dynamic> data = {"name": name, "phoneNum": phoneNum};
    try {
      Response response = await dioId.post(
        "http://15.165.106.139:8080/join/matchId",
        data: data,
      );
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('아이디 전송 성공');
        print(response.data);

        sessionId = response.headers["Set-Cookie"]![0];
        print("세션 아이디는" + sessionId);
        sessionId = sessionId.replaceAll("JSESSIONID=", "");
        sessionId = sessionId.replaceAll("; Path=/; HttpOnly", "");
        print("세션 아이디는" + sessionId);
        pwAnswer = "success";
      } else {
        // 업로드 실패 시 처리
        print('전송 실패');
        print('Status Code: ${response.statusCode}');
        pwAnswer = "fail";
      }
    } catch (e) {
      print('아이디 전송 에러');
      print(e.toString());
      pwAnswer = "fail";
    }
  }

  Future<void> verifyCodeId(String name, String phoneNum, String code) async {
    //아이디 : 인증번호 일치 확인
    Map<String, dynamic> data = {
      "name": name,
      "phoneNum": phoneNum,
      "code": code
    };
    dioId.options.headers["Auth"] = sessionId;
    // dioId.options.headers["Cookie"] =
    //     dioId.options.headers["Cookie"] + "; sessionId = " + sessionId;
    try {
      Response response = await dioId.post(
        "http://15.165.106.139:8080/join/findId",
        data: data,
      );

      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('아이디 : 인증 성공');
        print("내 아이디는" + response.data);
        requestedId = response.data.toString();
      } else {
        // 업로드 실패 시 처리
        print('아이디 : 인증 실패');
        print('Status Code: ${response.statusCode}');
        requestedId = "fail";
      }
    } catch (e) {
      print('아이디 : 에러');
      print(e.toString());
      requestedId = "fail";
    }
  }

  void verifyId(String id) async {
    //비밀번호 : 아이디가 있는지 확인
    try {
      Response response = await Dio().get(
        "http://15.165.106.139:8080/join/matchId/${id}",
      );
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('아이디 : 인증 성공');
        print("내 아이디" + response.data.toString());
        pwAnswer = "success";
      } else {
        // 업로드 실패 시 처리
        print('아이디 : 인증 실패');
        print('Status Code: ${response.statusCode}');
        pwAnswer = "fail";
      }
    } catch (e) {
      print('아이디 : 에러');
      print(e.toString());
      pwAnswer = "fail";
    }
  }

  void sendCodePw(String id, String name, String phone) async {
    //비밀번호 : 인증번호 전송
    Dio dio = new Dio();
    Map<String, dynamic> data = {"id": id, "name": name, "phoneNum": phone};
    try {
      Response response = await dio
          .post("http://15.165.106.139:8080/join/matchPwd", data: data);
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

  void verifyCodePw(String phoneNum, String code) async {
    //비밀번호 : 인증번호 인증
    Dio dio = new Dio();
    Map<String, dynamic> data = {"phoneNum": phoneNum, "code": code};
    try {
      Response response = await dio
          .post("http://15.165.106.139:8080/join/verifyPwd", data: data);
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('정보 전송 성공');
        print(response.data.toString);
        pwCodeVerified = "success";
      } else {
        // 업로드 실패 시 처리
        print('전송 실패');
        print('Status Code: ${response.statusCode}');
        pwCodeVerified = "fail";
      }
    } catch (e) {
      print('정보 전송 에러');
      print(e.toString());
      pwCodeVerified = "fail";
    }
  }

  void changePw(String id, String new_pw) async {
    //비밀번호 변경
    Dio dio = new Dio();
    Map<String, dynamic> data = {"id": id, "pwd": new_pw};
    try {
      Response response = await dio
          .post("http://15.165.106.139:8080/join/changePwd", data: data);
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('아이디 전송 성공');
        print(response.data);
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
