import 'dart:ffi';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/BMemberModel.dart';
import '../model/FridgeModel.dart';

class PostFridges {
  Long fridge_id;
  BMember bMember;
  String item_name;
  XFile? item_img;
  String is_frized;
  DateTime expiration_data;

  PostFridges(
      {required this.fridge_id,
      required this.bMember,
      required this.item_name,
      required this.item_img,
      required this.is_frized,
      required this.expiration_data});
}

class FridgesService extends ChangeNotifier {
  List<Fridge> fridgeList = [];
  String myId = "";
  FridgesService() {
    getMyFridge(myId);
  }

  void getMyFridge(String bMember_id) async {
    Dio dio = new Dio();
    Response response =
        await dio.get("http://3.86.110.15:8080/bMember/fridge/" + bMember_id);
    for (Map<String, dynamic> item in response.data) {
      Fridge fridge = Fridge.fromJson(item);
      fridgeList.add(fridge);
    }

    notifyListeners();
  }

  void deleteFridge(String item_id) async {
    try {
      Response response = await Dio()
          .delete("http://3.86.110.15:8080/bMember/fridge/delete" + item_id);

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

    notifyListeners();
  }

  void postFridge(PostFridges postFridges, String bMember_id) async {
    final data = FormData.fromMap(
      {
        "img": await MultipartFile.fromFile(
          postFridges.item_img!.path,
          filename: "${postFridges.item_name}.jpg",
        ),
        "FridgesDto": MultipartFile.fromString(
          jsonEncode({
            "name": postFridges.item_name,
            "isFrized": postFridges.is_frized,
            "expirationDate": postFridges.expiration_data,
          }),
          contentType: MediaType.parse('application/json'),
        ),
      },
      ListFormat.multiCompatible,
    );
    print(data);
    try {
      Response response = await Dio().post(
        "http://3.86.110.15:8080/bMember/fridge/add/" + bMember_id,
        data: data,
      );
      if (response.statusCode == 200) {
        // 업로드 성공 시 처리
        print('냉장고 재료 POST 성공');
        print(response.data);
      } else {
        // 업로드 실패 시 처리
        print('이미지 업로드 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('냉장고 재료 POST 에러');
      print(e.toString());
    }

    getMyFridge(bMember_id);
  }
}

// Future<List<Fridge>> getIngredients(String id) async {
//   Dio dio = new Dio();
//   Response response =
//       await dio.get("http://3.86.110.15:8080/bMember/fridge/" + id);
//   final jsonBody = json.decode(response.data);
//   List<Fridge> ingredient = [];
//   for (var e in jsonBody) {
//     Fridge ing = new Fridge(
//         bMember: e["fridge_id"],
//         expiration_date: e["expiration_date"],
//         fridge_id: e["fridge_id"],
//         fridge_item_img: e["fridge_item_img"],
//         fridge_item_name: e["fridge_item_name"],
//         is_frized: e["is_frized"]);
//     ingredient.add(ing);
//   }
//   return ingredient;
// }
