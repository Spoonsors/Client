import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

String? _fcmToken;

Future<String?> getFcmToken() async {
  _fcmToken = await _firebaseMessaging.getToken();
  print('FCM Token: $_fcmToken');
  return _fcmToken;
}

void pushAlert(String target_id, String writing_id, String state) async {
  Dio dio = new Dio();

  Map<String, dynamic> data = {
    "targetToken": getFcmToken(),
    "targetId": target_id,
    "postOrSponId": writing_id,
    "state": state
  };

  try {
    Response response =
        await dio.post("http://15.165.106.139:8080/fcm/post", data: data);
  } catch (e) {
    print(e.toString);
  }
}

void pushBToken(String bid) async {
  Future<String?> token = getFcmToken();
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

void pushSToken(String sid) async {
  Future<String?> token = getFcmToken();
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
