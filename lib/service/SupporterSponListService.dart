import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

SupporterSponListModel SupporterSponListServiceJson(String str) =>
    SupporterSponListModel.fromJson(json.decode(str));

String SupporterSponListServiceToJson(SupporterSponListModel data) =>
    json.encode(data.toJson());

class SupporterSponListModel {
  SupporterSponListModel({
    required this.postId,
    required this.writerNickname,
    required this.ingredientsName,
    required this.productName,
    required this.ingredientsImage,
    required this.price,
    required this.sponDate,
  });

  factory SupporterSponListModel.fromJson(Map<String, dynamic> json) =>
      SupporterSponListModel(
          postId: json['post_id'],
          writerNickname: json['writer_nickname'],
          ingredientsName: json['ingredients_name'],
          productName: json['product_name'],
          ingredientsImage: json['ingredients_image'],
          price: json['price'],
          sponDate: json['spon_date']);

  int postId;
  String writerNickname;
  String ingredientsName;
  String productName;
  String ingredientsImage;
  int price;
  String sponDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['post_id'] = postId;
    map['writer_nickname'] = writerNickname;
    map['ingredients_name'] = ingredientsName;
    map['product_name'] = productName;
    map['ingredients_image'] = ingredientsImage;
    map['price'] = price;
    map['spon_date'] = sponDate;
    return map;
  }
}

class SupporterSponListService with ChangeNotifier {
  List<SupporterSponListModel> items = [];

  // 정보 가져오기
  Future<void> getAllSponItems(String? sMemberId) async {
    items.clear();

    try {
      Response res = await Dio().get(
        "http://15.165.106.139:8080/getSponList/${sMemberId}",
      );
      if (res.statusCode == 200) {
        print("후원자 감사글 GET 성공");
        for (Map<String, dynamic> item in res.data) {
          SupporterSponListModel supporterSponListModel =
              SupporterSponListModel.fromJson(item);
          items.add(supporterSponListModel);
          print(supporterSponListModel.toString());
        }

        notifyListeners();
      }
    } catch (e) {
      print("후원자 감사글 GET 실패");
    }
  }
}
