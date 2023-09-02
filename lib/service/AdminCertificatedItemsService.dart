import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:save_children_v01/model/AdminCertificatedItemModel.dart';

class AdminCertificateInfoService extends ChangeNotifier {
  List<AdminCertificatedItemModel> items = [];

  AdminCertificateInfoService() {
    getAllCertificateItems();
  }

  // 정보 가져오기
  void getAllCertificateItems() async {
    items.clear();

    Response res = await Dio().get(
      "http://15.165.106.139:8080/manager/certificate",
    );

    for (Map<String, dynamic> item in res.data) {
      AdminCertificatedItemModel certificatedItemModel =
          AdminCertificatedItemModel.fromJson(item);
      items.add(certificatedItemModel);
    }

    notifyListeners();
  }

  // 해당 정보 인가하기
  Future<void> putCerticiateInfo(String bMemberId) async {
    try {
      Response response = await Dio()
          .put("http://15.165.106.139:8080/manager/isVerified/${bMemberId}/1");

      if (response.statusCode == 200) {
        print('인가/거부 PUT 요청 성공');
        print(response.data);
        for (int i = 0; i < items.length; i++) {
          if (items[i].bmemberId == bMemberId) items.removeAt(i);
        }

        Fluttertoast.showToast(msg: '인가 성공!');
      } else {
        print('인가/거부 PUT 요청 실패');
        print('Status Code: ${response.statusCode}');
        Fluttertoast.showToast(msg: '인가 실패했습니다.');
      }
    } catch (e) {
      print('인가/거부 PUT 요청 에러');
      print(e.toString());
    }

    notifyListeners();
  }

  // 해당 정보 거부하기
  Future<void> putDeclineCerticiateInfo(String bMemberId) async {
    try {
      Response response = await Dio()
          .put("http://15.165.106.139:8080/manager/isVerified/${bMemberId}/2");

      if (response.statusCode == 200) {
        print('거부 PUT 요청 성공');
        print(response.data);
        Fluttertoast.showToast(msg: '거부하였습니다.');
      } else {
        print('인가/거부 PUT 요청 실패');
        print('Status Code: ${response.statusCode}');
        Fluttertoast.showToast(msg: '다시 한번 더 시도해주세요.');
      }
    } catch (e) {
      print('인가/거부 PUT 요청 에러');
      print(e.toString());
    }

    notifyListeners();
  }
}
