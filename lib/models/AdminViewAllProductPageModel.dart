import 'package:flutter/material.dart';

class AdminViewAllProductPageModel with ChangeNotifier {
  List<String> items = [
    "최신 순",
    "가격 순",
  ];

  String selectedItem = "최신 순";

  void select(String value) {
    selectedItem = value;
  }
}
