import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../model/BMemberModel.dart';
import '../model/SMemberModel.dart';

class LoginService extends ChangeNotifier {
  late BMember loginB;
  late SMember loginS;
  bool isLogin = false;
  bool isKakao = false; //카카오 로그인인지 아닌지
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

      isLogin = true;
    } catch (e) {
      isLogin = false;
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
      isLogin = true;
    } catch (e) {
      isLogin = false;
      print(e.toString());
    }
  }

  Future<Uri> kakaoLoginRedirect() async {
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

  Future<dynamic> kakaoLogin() async {
    late User user;
    try {
      user = await UserApi.instance.me();
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
      return false;
    }
    List<String> scopes = [];

    if (user.kakaoAccount?.emailNeedsAgreement == true) {
      scopes.add('account_email');
    }
    if (user.kakaoAccount?.birthdayNeedsAgreement == true) {
      scopes.add("birthday");
    }
    if (user.kakaoAccount?.birthyearNeedsAgreement == true) {
      scopes.add("birthyear");
    }
    if (user.kakaoAccount?.ciNeedsAgreement == true) {
      scopes.add("account_ci");
    }
    if (user.kakaoAccount?.phoneNumberNeedsAgreement == true) {
      scopes.add("phone_number");
    }
    if (user.kakaoAccount?.profileNeedsAgreement == true) {
      scopes.add("profile");
    }
    if (user.kakaoAccount?.ageRangeNeedsAgreement == true) {
      scopes.add("age_range");
    }

    if (scopes.length > 0) {
      print('사용자에게 추가 동의 받아야 하는 항목이 있습니다');
      OAuthToken token;
      try {
        token = await UserApi.instance.loginWithNewScopes(scopes);
        print('현재 사용자가 동의한 동의 항목: ${token.scopes}');
      } catch (error) {
        print('추가 동의 요청 실패 $error');
        return false;
      }

      // 사용자 정보 재요청
      try {
        User user = await UserApi.instance.me();
        print('사용자 정보 요청 성공'
            '\n회원번호: ${user.id}'
            '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
            '\n이메일: ${user.kakaoAccount?.email}');
      } catch (error) {
        print('사용자 정보 요청 실패 $error');
      }
    }
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        print('사용자 정보 요청 성공'
            '\n회원번호: ${user.id}'
            '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
            '\n이메일: ${user.kakaoAccount?.email}');
        isKakao = true;
        return user;
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        if (error is PlatformException && error.code == 'CANCELED') {}
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
          print('사용자 정보 요청 성공'
              '\n회원번호: ${user.id}'
              '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
              '\n이메일: ${user.kakaoAccount?.email}');
          isKakao = true;
          return user;
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
          return false;
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
        print('사용자 정보 요청 성공'
            '\n회원번호: ${user.id}'
            '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
            '\n이메일: ${user.kakaoAccount?.email}');
        isKakao = true;
        return user;
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');

        print(error.toString());
        return false;
      }
    }
  }
}
