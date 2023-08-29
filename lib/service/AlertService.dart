import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

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

class AlertService extends ChangeNotifier {}
