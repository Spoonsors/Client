import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:save_children_v01/model/SponModel.dart';

import '../model/BMemberModel.dart';
import '../model/PostModel.dart';
import '../model/RecipeModel.dart';

class PostPosts {
  int post_id;
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

  PostPosts(
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
}

class PostsService extends ChangeNotifier {
  List<Post> allPostList = [];
  List<Post> myPostList = [];
  late Post _post;
  final BMember bMember;

  // 후원에 올리는 메뉴의 레시피
  late Recipe post_Recipe;

  PostsService({required this.bMember}) {
    getAllPosts();
    getAllMyPosts(bMember.bMember_Id);
  }

  void getAllMyPosts(String id) async {
    Response res = await Dio().get(
      "http://3.86.110.15:8080/viewMyPosting/" + id,
    );
    myPostList.clear();
    for (Map<String, dynamic> item in res.data) {
      Post Posts = Post.fromJson(item);
      myPostList.add(Posts);
    }

    notifyListeners();
  }

  void getAllPosts() async {
    Response res = await Dio().get(
      "http://3.86.110.15:8080/viewPosting",
    );
    allPostList.clear();
    for (Map<String, dynamic> item in res.data) {
      Post Posts = Post.fromJson(item);
      allPostList.add(Posts);
    }

    notifyListeners();
  }

  void writePost(PostPosts post, BMember bMember) async {
    Map<String, dynamic> data = {
      "post_id": post.post_id,
      "bMember": post.bMember,
      "post_title": post.post_title,
      "post_txt": post.post_txt,
      "post_state": post.post_state,
      "has_review": post.has_review,
      "post_date": post.post_date,
      "spon": post.spon,
      "remain_spon": post.remain_spon,
      "menu_img": post.menu_img,
      "menu_name": post.menu_name,
    };
    try {
      Response response = await Dio().post(
        "http://3.86.110.15:8080/bMember/post/" + bMember.bMember_Id,
        data: data,
      );
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('후원 POST 성공');
        print(response.data);
      } else {
        // 업로드 실패 시 처리
        print('업로드 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('후원 POST 에러');
      print(e.toString());
    }
    getAllPosts();
  }

  void viewPost(PostPosts post) async {
    Response res = await Dio().get(
      "http://3.86.110.15:8080/viewPosting/${post.post_id}",
    );
    _post = Post.fromJson(res.data);

    notifyListeners();
  }

  void getIngredientsOfPost(Post post) async {
    Response res = await Dio().get(
        "http://3.86.110.15:8080/recipe/findByName?RCP_NM=" + post.menu_name);
    post_Recipe = Recipe.fromJson(res.data);
  }
}
