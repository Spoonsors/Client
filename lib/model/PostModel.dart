import 'dart:convert';

import 'package:save_children_v01/model/BMemberModel.dart';

import 'SponModel.dart';

Post PostJson(String str) => Post.fromJson(json.decode(str));

String PostToJson(Post data) => json.encode(data.toJson());

class Post {
  int post_id; // id를 int형으로.
  BMember bMember;
  String post_title;
  String post_txt;
  int post_state;
  int has_review;
  DateTime post_date;
  List<Spon> spon;
  int remain_spon;
  String menu_img;
  String menu_name;

  Post(
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

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        post_id: json["post_id"],
        bMember: json["bMember"],
        post_title: json["post_title"],
        post_txt: json["post_txt"],
        post_state: json["post_state"],
        has_review: json["has_review"],
        post_date: json["post_date"],
        spon: json["spon"],
        remain_spon: json["remain_spon"],
        menu_img: json["menu_img"],
        menu_name: json["menu_name"],
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
