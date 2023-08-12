import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:save_children_v01/model/RecipeModel.dart';

// 레시피에 대한 서비스 객체
class SelectedRecipe {
  Recipe recipe;
  bool selected;

  SelectedRecipe(this.recipe, this.selected);
}
// 해당 레시피의 총 영양성분 확인

class RecipeService extends ChangeNotifier {
  // 식재료 목록
  List<SelectedRecipe> recipeList = [];

  // 선택재료
  List<SelectedRecipe> selectedRecipeList = [];

  // 검색된 식재료 목록
  List<SelectedRecipe> searchedRecipeList = [];

  double kcal = 0;
  double carbo = 0;
  double fat = 0;
  double pro = 0;
  String searchText = "";

  RecipeService() {
    getAllRecipeInfo();
  }

  // 모든 레시피 정보 가져오기
  void getAllRecipeInfo() async {
    try {
      // API 호출
      Response response = await Dio().get(
        "http://3.86.110.15:8080/recipe/findAll",
      );
      if (response.statusCode == 200) {
        print('GET 요청 성공');
        for (Map<String, dynamic> item in response.data) {
          Recipe recipe = Recipe.fromJson(item);
          recipeList.add(new SelectedRecipe(recipe, false));
        }
      } else {
        print('GET 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('GET 요청 에러');
      print(e.toString());
    }

    // 화면 갱신
    notifyListeners();
  }

  // 레시피 선택
  bool selectRecipe(String RCP_SEQ) {
    for (int i = 0; i < recipeList.length; i++) {
      if (recipeList[i].recipe.rcp_SEQ == RCP_SEQ) {
        if (recipeList[i].selected == false) {
          if (selectedRecipeList.length > 3) {
            print("4개 초과해서 선택이 불가합니다.");
            return true;
          } else {
            selectedRecipeList.add(recipeList[i]);
            recipeList[i].selected = true;
          }
        } else {
          selectedRecipeList.remove(recipeList[i]);
          recipeList[i].selected = false;
        }

        break;
      }
    }
    calNutriInfo();
    notifyListeners();
    return false;
  }

  // 선택된 레시피 토대로 영양성분 계산
  void calNutriInfo() {
    kcal = 0;
    carbo = 0;
    fat = 0;
    pro = 0;
    for (SelectedRecipe r in selectedRecipeList) {
      kcal += r.recipe.info_ENG;
      carbo += r.recipe.info_CAR;
      fat += r.recipe.info_FAT;
      pro += r.recipe.info_PRO;
    }
  }

  // 레시피 검색
  void searchRecipeByText() {
    searchedRecipeList.clear();
    for (int i = 0; i < recipeList.length; i++) {
      if (recipeList[i].recipe.rcp_NM.contains(searchText)) {
        searchedRecipeList.add(recipeList[i]);
      }
    }
  }

  // 입력받은 메뉴를 selectedList에 추가하기.
  void selectMenus(List<String> menus) {
    selectedRecipeList.clear();
    for (int i = 0; i < recipeList.length; i++) {
      if (menus.contains(recipeList[i].recipe.rcp_NM)) {
        recipeList[i].selected = true;
        selectedRecipeList.add(recipeList[i]);
        continue;
      }
      recipeList[i].selected = false;
    }
  }
}
