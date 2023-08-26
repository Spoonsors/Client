import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/GetPostDTOModel.dart';

class SupporterPostService extends ChangeNotifier {
  List<GetPostDTO> allPostCompleteList = [];
  List<GetPostDTO> allPostInCompleteList = [];
  late GetDetailPostDTO post;

  SupporterPostService() {
    getAllSuppPosts();
  }

  void getAllSuppPosts() async {
    // 완료된 목록 가져오기
    Response res = await Dio().get(
      "http://3.86.110.15:8080/viewPosting",
    );
    allPostCompleteList.clear();
    allPostInCompleteList.clear();

    for (Map<String, dynamic> item in res.data) {
      GetPostDTO Posts = GetPostDTO.fromJson(item);

      if (Posts.post_state == 1) {
        // 완료됨
        allPostCompleteList.add(Posts);
      } else {
        // 미완료
        allPostInCompleteList.add(Posts);
      }
    }

    notifyListeners();
  }

  void viewSuppPost(int post_id) async {
    Response res = await Dio().get(
      "http://3.86.110.15:8080/viewPosting/${post_id}",
    );
    post = GetDetailPostDTO.fromJson(res.data);

    notifyListeners();
  }
}
