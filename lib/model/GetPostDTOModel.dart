import 'dart:convert';

import 'package:save_children_v01/model/IngredientsModel.dart';

GetPostDTO GetPostDTOJson(String str) => GetPostDTO.fromJson(json.decode(str));

BMemberGetDTO BMemberGetDTOJson(String str) =>
    BMemberGetDTO.fromJson(json.decode(str));

SponGetDTO SponGetDTOJson(String str) => SponGetDTO.fromJson(json.decode(str));

ReviewDTO ReviewDTOJson(String str) => ReviewDTO.fromJson(json.decode(str));

String GetPostDTOToJson(GetPostDTO data) => json.encode(data.toJson());

class SponGetDTO {
  int spon_id;
  Ingredients ingredients;
  String? spon_date;
  int spon_state;
  Map<String, dynamic>? smember;

  SponGetDTO(
      {required this.spon_id,
      required this.ingredients,
      required this.spon_date,
      required this.spon_state,
      required this.smember});

  factory SponGetDTO.fromJson(Map<String, dynamic> json) => SponGetDTO(
        spon_id: json["spon_id"],
        ingredients: Ingredients.fromJson(json["ingredients"]),
        spon_date: json["spon_date"] as String?,
        spon_state: json["spon_state"],
        smember: json["smember"] as Map<String, dynamic>?,
      );
}

List<SponGetDTO> ListDynamicToSponGETDTOList(List<dynamic> json) {
  List<SponGetDTO> res = [];

  for (dynamic item in json) {
    res.add(SponGetDTO.fromJson(item));
  }

  return res;
}

class BMemberGetDTO {
  String? createDate; // 생성 날짜
  String? modifiedDate; // 수정된 날짜
  String? token; // 토큰
  int is_verified; // 증명된 멤버인지.
  String? bMember_id;
  String? bMember_name;
  String? bMember_nickname;

  BMemberGetDTO(
      {required this.createDate,
      required this.modifiedDate,
      required this.token,
      required this.is_verified,
      required this.bMember_id,
      required this.bMember_name,
      required this.bMember_nickname});

  factory BMemberGetDTO.fromJson(Map<String, dynamic> json) => BMemberGetDTO(
        createDate: json["createDate"] as String?,
        modifiedDate: json["modifiedDate"] as String?,
        token: json["token"] as String?,
        is_verified: json["is_verified"],
        bMember_nickname: json["bmember_nickname"] as String?,
        bMember_id: json["bmember_id"] as String?,
        bMember_name: json["bmember_name"] as String?,
      );
}

class GetPostDTO {
  int post_id; // id를 int형으로.
  BMemberGetDTO bMember;
  String post_title;
  String post_txt;
  int post_state;
  int has_review;
  String post_date;
  List<SponGetDTO> spon;
  int remain_spon;
  String? menu_img;
  String? menu_name;

  GetPostDTO(
      {required this.post_id,
      required this.bMember,
      required this.post_title,
      required this.post_txt,
      required this.post_state,
      required this.has_review,
      required this.post_date,
      required this.spon,
      required this.remain_spon,
      required this.menu_img,
      required this.menu_name});

  factory GetPostDTO.fromJson(Map<String, dynamic> json) => GetPostDTO(
        post_id: json["post_id"],
        bMember: BMemberGetDTO.fromJson(json["bmember"]),
        post_title: json["post_title"],
        post_txt: json["post_txt"],
        post_state: json["post_state"],
        has_review: json["has_review"],
        post_date: json["post_date"],
        spon: ListDynamicToSponGETDTOList(json["spon"]),
        remain_spon: json["remain_spon"],
        menu_img: json["menu_img"] as String?,
        menu_name: json["menu_name"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "post_id": post_id,
        "bMember": bMember,
        "post_title": post_title,
        "post_txt": post_txt,
        "post_state": post_state,
        "has_review": has_review,
        "post_date": post_date,
        "spon": spon,
        "remain_spon": remain_spon,
        "menu_img": menu_img,
        "menu_name": menu_name,
      };
}

class ReviewDTO {
  int? review_id;
  String? review_img;
  String? review_txt;
  String? review_date;

  ReviewDTO({
    required this.review_id,
    required this.review_img,
    required this.review_txt,
    required this.review_date,
  });

  factory ReviewDTO.fromJson(Map<String, dynamic>? json) => ReviewDTO(
        review_id: json?["review_id"] as int?,
        review_img: json?["review_img"] as String?,
        review_txt: json?["review_txt"] as String?,
        review_date: json?["review_date"] as String?,
      );
}

class GetDetailPostDTO {
  GetPostDTO post;
  ReviewDTO? review;

  GetDetailPostDTO({required this.post, required this.review});

  factory GetDetailPostDTO.fromJson(Map<String, dynamic> json) =>
      GetDetailPostDTO(
        post: GetPostDTO.fromJson(json["post"]),
        review: ReviewDTO.fromJson(json["review"]),
      );
}
