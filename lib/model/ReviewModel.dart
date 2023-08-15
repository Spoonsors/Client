import 'dart:convert';
import 'dart:ffi';

import 'package:image_picker/image_picker.dart';
import 'package:save_children_v01/model/PostModel.dart';

Review ReviewJson(String str) => Review.fromJson(json.decode(str));

String ReviewToJson(Review data) => json.encode(data.toJson());

class Review {
  int review_id;
  Post post;
  String review_img; //img의 주소
  String review_txt;
  DateTime review_date;

  Review({
    required this.review_id,
    required this.post,
    required this.review_img,
    required this.review_txt,
    required this.review_date,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        review_id: json["review_id"],
        post: json["post"],
        review_img: json["review_img"],
        review_txt: json["review_txt"],
        review_date: json["review_date"],
      );

  Map<String, dynamic> toJson() => {
        "review_id": review_id,
        "post": post,
        "review_img": review_img,
        "review_txt": review_txt,
        "review_date": review_date,
      };
}
