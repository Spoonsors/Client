import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save_children_v01/model/IngredientsModel.dart';

// 식재료에 대한 서비스 객체

class PostIngredients {
  String ingredients_name;
  String product_name;
  XFile? ingredients_image;
  int price;

  PostIngredients(
      {required this.ingredients_name,
      required this.product_name,
      required this.ingredients_image,
      required this.price});
}

class IngredientsService extends ChangeNotifier {
  // 식재료 목록
  List<Ingredients> productList = [];

  IngredientsService() {
    getAllProductInfo();
  }

  // 상품 정보 가져오기
  void getAllProductInfo() async {
    productList.clear();
    // API 호출
    Response res = await Dio().get(
      "http://15.165.106.139:8080/manager/findAll",
    );

    for (Map<String, dynamic> item in res.data) {
      Ingredients ingredients = Ingredients.fromJson(item);
      productList.add(ingredients);
    }

    // 화면 갱신
    notifyListeners();
  }

  // 상품 삭제
  void deleteProduct(int ingredients_id) async {
    try {
      // DELETE 요청 보내기
      Response response = await Dio().delete(
          "http://15.165.106.139:8080/manager/delete/${ingredients_id}");

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

    for (int i = 0; i < productList.length; i++) {
      if (productList[i].ingredients_id == ingredients_id) {
        productList.removeAt(i);
      }
    }

    // 화면 갱신
    notifyListeners();
  }

  // 상품 등록
  void postProduct(PostIngredients postIngredients) async {
    final formData = FormData.fromMap(
      {
        "img": await MultipartFile.fromFile(
          postIngredients.ingredients_image!.path,
          filename: "${postIngredients.product_name}.jpg",
        ),
        "ingredientsDto": MultipartFile.fromString(
          jsonEncode({
            "ingredientsName": postIngredients.ingredients_name,
            "productName": postIngredients.product_name,
            "price": postIngredients.price,
          }),
          contentType: MediaType.parse('application/json'),
        ),
      },
      ListFormat.multiCompatible,
    );

    try {
      Response response = await Dio().post(
        "http://15.165.106.139:8080/manager/create",
        data: formData,
      );
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('상품 POST 성공');
        print(response.data);
      } else {
        // 업로드 실패 시 처리
        print('이미지 업로드 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('상품 POST 에러');
      print(e.toString());
    }

    getAllProductInfo();
  }

  // 상품 수정
  void updateProduct(PostIngredients postIngredients, int idx) async {
    final formData = FormData.fromMap(
      {
        "img": await MultipartFile.fromFile(
          postIngredients.ingredients_image!.path,
          filename: "${postIngredients.product_name}.jpg",
        ),
        "ingredientsDto": MultipartFile.fromString(
          jsonEncode({
            "ingredientsName": postIngredients.ingredients_name,
            "productName": postIngredients.product_name,
            "price": postIngredients.price,
          }),
          contentType: MediaType.parse('application/json'),
        ),
      },
      ListFormat.multiCompatible,
    );

    try {
      Response response = await Dio().put(
        "http://15.165.106.139:8080/manager/update/${idx}",
        data: formData,
      );
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('식재료 PUT 성공');
        print(response.data);
      } else {
        // 업로드 실패 시 처리
        print('식재료 이미지 업로드 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('식재료 PUT 에러');
      print(e.toString());
    }

    getAllProductInfo();
  }
}
