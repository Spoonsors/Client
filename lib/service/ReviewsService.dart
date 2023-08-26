import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/BMemberModel.dart';
import '../model/PostModel.dart';
import '../model/ReviewModel.dart';

class PostReview {
  int review_id;
  Post post;
  XFile? review_img;
  String review_txt;
  DateTime review_date;

  PostReview({
    required this.review_id,
    required this.post,
    required this.review_img,
    required this.review_txt,
    required this.review_date,
  });
}

class ReviewsService extends ChangeNotifier {
  List<Review> reviewsList = [];
  late BMember _bMember;

  ReviewsService() {
    getMyReviews(_bMember);
  }

  void getMyReviews(BMember bMember) async {
    Response res = await Dio().get(
      "http://3.86.110.15:8080/review/findMyReview/" + bMember.bMember_Id,
    );
    reviewsList.clear();
    for (Map<String, dynamic> item in res.data) {
      Review rev = Review.fromJson(item);
      reviewsList.add(rev);
    }

    notifyListeners();
  }

  void writeReview(BMember bMember, PostReview postReview) async {
    Map<String, dynamic> data = {
      "review_id": postReview.review_id,
      "post": postReview.review_img?.path,
      "review_img": await MultipartFile.fromFile(
        postReview.review_img!.path,
        filename: "${postReview.review_id}.jpg",
      ),
      "review_txt": postReview.review_txt,
      "review_date": postReview.review_date,
    };
    try {
      Response response = await Dio().post(
        "http://3.86.110.15:8080//review/create/${postReview.post.post_id}",
        data: data,
      );
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('리뷰 POST 성공');
        print(response.data);
      } else {
        // 업로드 실패 시 처리
        print('업로드 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('리뷰 POST 에러');
      print(e.toString());
    }
    getMyReviews(bMember);
  }
}
