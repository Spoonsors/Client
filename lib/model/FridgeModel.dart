import 'dart:convert';

import 'package:image_picker/image_picker.dart';

import 'BMemberModel.dart';

Fridge FridgeJson(String str) => Fridge.fromJson(json.decode(str));

String FridgeToJson(Fridge data) => json.encode(data.toJson());

class Fridge {
  int fridge_id;
  BMember bMember;
  String fridge_item_name;
  XFile? fridge_item_img;
  int is_frized;
  DateTime expiration_date;

  Fridge(
      {required this.fridge_id,
      required this.bMember,
      required this.fridge_item_name,
      required this.fridge_item_img,
      required this.is_frized,
      required this.expiration_date});

  factory Fridge.fromJson(Map<String, dynamic> json) => Fridge(
        bMember: json["fridge_id"],
        expiration_date: json["expiration_date"],
        fridge_id: json["fridge_id"],
        fridge_item_img: json["fridge_item_img"],
        fridge_item_name: json["fridge_item_name"],
        is_frized: json["is_frized"],
      );

  Map<String, dynamic> toJson() => {
        "fridge_id": fridge_id,
        "bMember": bMember,
        "fridge_item_name": fridge_item_name,
        "fridge_item_img": fridge_item_img,
        "is_frized": is_frized,
        "expiration_date": expiration_date,
      };
}
