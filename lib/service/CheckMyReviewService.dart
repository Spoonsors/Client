import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CheckMyReviewModel {
  String? reviewTxt;
  String? reviewImg;
  String? writerNickname;
  String? writeDate;
  int? postId;

  CheckMyReviewModel(
      {this.reviewTxt,
      this.reviewImg,
      this.writerNickname,
      this.writeDate,
      this.postId});

  CheckMyReviewModel.fromJson(Map<String, dynamic> json) {
    reviewTxt = json['review_txt'];
    reviewImg = json['review_img'];
    writerNickname = json['writer_nickname'];
    writeDate = json['write_date'];
    postId = json['post_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_txt'] = this.reviewTxt;
    data['review_img'] = this.reviewImg;
    data['writer_nickname'] = this.writerNickname;
    data['write_date'] = this.writeDate;
    data['post_id'] = this.postId;
    return data;
  }
}

class CheckMyReviewService extends ChangeNotifier {
  // 감사글 목록 가져오기.
  List<CheckMyReviewModel> items = [];

  CheckMyReviewService() {}

  // 상품 정보 가져오기
  void getAllServicesInfo(String sMemberId) async {
    items.clear();
    // API 호출
    Response res = await Dio().get(
      "http://15.165.106.139:8080/sMember/receivedReview/${sMemberId}",
    );

    for (Map<String, dynamic> item in res.data) {
      CheckMyReviewModel checkMyReviewModel = CheckMyReviewModel.fromJson(item);
      items.add(checkMyReviewModel);
    }

    // 화면 갱신
    notifyListeners();
  }
}
