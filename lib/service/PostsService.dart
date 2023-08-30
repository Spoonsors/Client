import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/PostModel.dart';
import '../model/RecipeModel.dart';

class PostPosts {
  String post_title;
  String post_txt;
  List<String> item_list;
  String menu_img;
  String menu_name;

  PostPosts(
      {required this.post_title,
      required this.post_txt,
      required this.menu_img,
      required this.menu_name,
      required this.item_list});
}

class PostsService extends ChangeNotifier {
  List<Post> allPostList = [];
  List<Post> myPostList = [];
  late Post _post;
  bool isVerified = true;
  // 후원에 올리는 메뉴의 레시피
  late Recipe post_Recipe;

  PostsService() {
    getAllPosts();
  }

  void getAllMyPosts(String id) async {
    Response res = await Dio().get(
      "http://15.165.106.139:8080/viewMyPosting/" + id,
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
      "http://15.165.106.139:8080/viewPosting",
    );
    allPostList.clear();
    for (Map<String, dynamic> item in res.data) {
      Post Posts = Post.fromJson(item);
      allPostList.add(Posts);
    }

    notifyListeners();
  }

  void writePost(PostPosts post, String bMember_id) async {
    Map<String, dynamic> data = {
      "post_title": post.post_title, //
      "post_txt": post.post_txt, //
      "menu_img": post.menu_img, //
      "menu_name": post.menu_name, //
      "item_list": post.item_list
    };
    print(post.post_title);
    print(post.post_txt);
    print(post.menu_img);
    print(post.menu_name);
    print(post.item_list);
    try {
      Response response = await Dio().post(
        "http://15.165.106.139:8080/bMember/post/${bMember_id}",
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
      if (e.toString() ==
          "DioError [DioErrorType.response]: Http status error [403]") {
        isVerified = false;
      }
    }
    getAllPosts();
  }

  void viewPost(Post post) async {
    Response res = await Dio().get(
      "http://15.165.106.139:8080/viewPosting/" + post.postId.toString(),
    );
    _post = Post.fromJson(res.data);

    notifyListeners();
  }

  void getIngredientsOfPost(Post post) async {
    Response res = await Dio().get(
        "http://15.165.106.139:8080/recipe/findByName?RCP_NM=" +
            post.menuName!);
    post_Recipe = Recipe.fromJson(res.data);
  }

  void changeStateofPost(Post post) async {
    Response res = await Dio().post(
      "http://15.165.106.139:8080/bMember/changePostState/${post.postId}",
    );
  }

  void deletePost(Post post) async {
    Response res = await Dio().delete(
      "http://15.165.106.139:8080/bMember/deletePost/${post.postId}",
    );
  }
}
