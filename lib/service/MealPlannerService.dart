import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:save_children_v01/model/MealPlannerModel.dart';

// 식재료에 대한 서비스 객체
class PostMealPlanner {
  String menu_name1;
  String menu_img1;

  String? menu_name2;
  String? menu_img2;

  String? menu_name3;
  String? menu_img3;

  String? menu_name4;
  String? menu_img4;

  String mealPlanner_name;

  int? kcal;
  int carbohydrate;
  int protein;
  int fat;
  int? na;

  String? level;
  String timeRequired;

  PostMealPlanner(
      {required this.menu_name1,
      required this.menu_img1,
      required this.menu_name2,
      required this.menu_img2,
      required this.menu_name3,
      required this.menu_img3,
      required this.menu_name4,
      required this.menu_img4,
      required this.mealPlanner_name,
      required this.kcal,
      required this.carbohydrate,
      required this.protein,
      required this.fat,
      required this.level,
      required this.na,
      required this.timeRequired});
}

class MealPlannerService extends ChangeNotifier {
  // 식재료 목록
  List<MealPlanner> mealPlannerList = [];
  MealPlannerService() {
    getAllMealPlannerInfo();
  }

  // 모든 상품 정보 가져오기
  void getAllMealPlannerInfo() async {
    // API 호출
    Response res = await Dio().get(
      "http://15.165.106.139:8080/mealplanner/findAll",
    );
    // mealPlannerList.clear();
    for (Map<String, dynamic> item in res.data) {
      MealPlanner mealPlanner = MealPlanner.fromJson(item);
      mealPlannerList.add(mealPlanner);
    }

    // 화면 갱신
    notifyListeners();
  }

  // 상품 삭제
  void deleteMealPlanner(int? mealPlanner_id) async {
    try {
      // DELETE 요청 보내기
      Response response = await Dio().delete(
          "http://15.165.106.139:8080/mealplanner/delete/${mealPlanner_id}");

      if (response.statusCode == 200) {
        print('DELETE 요청 성공');
        print(response.data);
      } else {
        print('DELETE 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('DELETE 요청 에러');
      print(e.toString());
    }

    for (int i = 0; i < mealPlannerList.length; i++) {
      if (mealPlannerList[i].mealPlannerId == mealPlanner_id) {
        mealPlannerList.removeAt(i);
      }
    }
    // 화면 갱신
    notifyListeners();
  }

  // 상품 등록
  void postMealPlanner(PostMealPlanner postMealPlanner) async {
    Map<String, dynamic> data = {
      "menu_name1": postMealPlanner.menu_name1,
      "menu_img1": postMealPlanner.menu_img1,
      "menu_name2": postMealPlanner.menu_name2,
      "menu_img2": postMealPlanner.menu_img2,
      "menu_name3": postMealPlanner.menu_name3,
      "menu_img3": postMealPlanner.menu_img3,
      "menu_name4": postMealPlanner.menu_name4,
      "menu_img4": postMealPlanner.menu_img4,
      "mealPlanner_name": postMealPlanner.mealPlanner_name,
      "kcal": postMealPlanner.kcal,
      "carbohydrate": postMealPlanner.carbohydrate,
      "protein": postMealPlanner.protein,
      "fat": postMealPlanner.fat,
      "level": postMealPlanner.level,
      "timeRequired": postMealPlanner.timeRequired
    };
    // print(data.toString());
    try {
      Response response = await Dio().post(
        "http://15.165.106.139:8080/mealplanner/create",
        data: data,
      );
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('상품 POST 성공');
        print(response.data);
      } else {
        // 업로드 실패 시 처리
        print('업로드 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('상품 POST 에러');
      print(e.toString());
    }

    getAllMealPlannerInfo();
  }

  // 상품 수정
  void updateMealPlanner(MealPlanner putMealPlanner, int idx) async {
    Map<String, dynamic> data = {
      "mealPlanner_id": putMealPlanner.mealPlannerId,
      "menu_name1": putMealPlanner.menuName1,
      "menu_img1": putMealPlanner.menuImg1,
      "menu_name2": putMealPlanner.menuName2,
      "menu_img2": putMealPlanner.menuImg2,
      "menu_name3": putMealPlanner.menuName3,
      "menu_img3": putMealPlanner.menuImg3,
      "menu_name4": putMealPlanner.menuName4,
      "menu_img4": putMealPlanner.menuImg4,
      "mealPlanner_name": putMealPlanner.mealPlannerName,
      "kcal": putMealPlanner.kcal,
      "carbohydrate": putMealPlanner.carbohydrate,
      "protein": putMealPlanner.protein,
      "fat": putMealPlanner.fat,
      "level": putMealPlanner.level,
      "timeRequired": putMealPlanner.timeRequired
    };

    print(data["mealPlanner_id"]);

    try {
      Response response = await Dio()
          .put("http://15.165.106.139:8080/mealplanner/update", data: data);
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('식단 PUT 성공');
        print(response.data);
        mealPlannerList.removeAt(idx);
        mealPlannerList.add(putMealPlanner);
      } else {
        // 업로드 실패 시 처리
        print('업로드 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('식단 PUT 에러');
      print(e.toString());
    }

    getAllMealPlannerInfo();
  }
}
