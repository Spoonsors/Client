import 'dart:convert';
import 'dart:ffi';

import 'package:save_children_v01/model/SMemberModel.dart';

import 'IngredientsModel.dart';
import 'PostModel.dart';

Spon SponJson(String str) => Spon.fromJson(json.decode(str));

String SponToJson(Spon data) => json.encode(data.toJson());

class Spon {
  Long spon_id;
  SMember sMember;
  Post post;
  Ingredients ingredients;
  DateTime spon_date;
  int spon_state;

  Spon(
      {required this.spon_id,
      required this.sMember,
      required this.post,
      required this.ingredients,
      required this.spon_date,
      required this.spon_state});

  factory Spon.fromJson(Map<String, dynamic> json) => Spon(
        spon_id: json["spon_id"],
        sMember: json["sMember"],
        post: json["post"],
        ingredients: json["ingredients"],
        spon_date: json["spon_date"],
        spon_state: json["spon_state"],
      );

  Map<String, dynamic> toJson() => {
        "spon_id": spon_id,
        "sMember": sMember,
        "post": post,
        "ingredients": ingredients,
        "spon_date": spon_date,
        "spon_state": spon_state,
      };
}
