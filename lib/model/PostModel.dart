import 'dart:convert';

import 'BMemberModel.dart';
import 'SponModel.dart';

Post PostJson(String str) => Post.fromJson(json.decode(str));

String PostToJson(Post data) => json.encode(data.toJson());

class Post {

  int? postId;
  String? postTitle;
  String? postTxt;
  int? postState;
  int? hasReview;
  String? postDate;
  List<Spon>? spon;
  int? remainSpon;
  String? menuImg;
  String? menuName;
  BMember? bmember;

  Post(
      {this.postId,
      this.postTitle,
      this.postTxt,
      this.postState,
      this.hasReview,
      this.postDate,
      this.spon,
      this.remainSpon,
      this.menuImg,
      this.menuName,
      this.bmember});

  Post.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    postTitle = json['post_title'];
    postTxt = json['post_txt'];
    postState = json['post_state'];
    hasReview = json['has_review'];
    postDate = json['post_date'].toString();
    if (json['spon'] != null) {
      spon = <Spon>[];
      json['spon'].forEach((v) {
        spon!.add(new Spon.fromJson(v));
      });
    }
    remainSpon = json['remain_spon'];
    menuImg = json['menu_img'];
    menuName = json['menu_name'];
    bmember =
        json['bmember'] != null ? new BMember.fromJson(json['bmember']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['post_title'] = this.postTitle;
    data['post_txt'] = this.postTxt;
    data['post_state'] = this.postState;
    data['has_review'] = this.hasReview;
    data['post_date'] = this.postDate;
    if (this.spon != null) {
      data['spon'] = this.spon!.map((v) => v.toJson()).toList();
    }
    data['remain_spon'] = this.remainSpon;
    data['menu_img'] = this.menuImg;
    data['menu_name'] = this.menuName;
    if (this.bmember != null) {
      data['bmember'] = this.bmember!.toJson();
    }
    return data;
  }
}
