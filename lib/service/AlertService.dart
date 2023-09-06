import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

String? _fcmToken;

Future<String?> getFcmToken() async {
  _fcmToken = await _firebaseMessaging.getToken();
  print('FCM Token: $_fcmToken');
  return _fcmToken;
}

Future<void> pushAlert(
    String token, String target_id, String writing_id, String state) async {
  Dio dio = new Dio(); //후원자 아이디로 토큰 알아내야함
  Map<String, dynamic> data = {
    "targetToken": token,
    "targetId": target_id,
    "postOrSponId": writing_id,
    "state": state
  };
  print("토큰 :" + token!);
  print("타겟아이디 : " + target_id);
  print("아이디" + writing_id);
  print("상태 : " + state);

  try {
    Response response =
        await dio.post("http://15.165.106.139:8080/fcm/post", data: data);
    print("알림 성공");
  } catch (e) {
    print(e.toString());
    print("알림 실패");
  }
}

Future<void> pushBToken(String bid) async {
  String? token = await getFcmToken();
  Dio dio = new Dio();
  Map<String, dynamic> data = {
    "id": bid,
    "token": token,
  };
  try {
    Response response = await dio
        .post("http://15.165.106.139:8080/bMember/putToken", data: data);
  } catch (e) {
    print(e.toString);
  }
}

Future<void> pushSToken(String sid) async {
  String? token = await getFcmToken();
  Dio dio = new Dio();

  Map<String, dynamic> data = {
    "id": sid,
    "token": token,
  };
  try {
    Response response = await dio
        .post("http://15.165.106.139:8080/sMember/putToken", data: data);
  } catch (e) {
    print(e.toString);
  }
}
