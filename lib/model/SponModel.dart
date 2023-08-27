import 'dart:convert';

import 'package:save_children_v01/model/SMemberModel.dart';

import 'IngredientsModel.dart';

Spon SponJson(String str) => Spon.fromJson(json.decode(str));

String SponToJson(Spon data) => json.encode(data.toJson());

class Spon {
  int? sponId;
  Ingredients? ingredients;
  String? sponDate;
  int? sponState;
  String? tid;
  SMember? smember;

  Spon(
      {this.sponId,
      this.ingredients,
      this.sponDate,
      this.sponState,
      this.tid,
      this.smember});

  Spon.fromJson(Map<String, dynamic> json) {
    sponId = json['spon_id'];
    ingredients = json['ingredients'] != null
        ? new Ingredients.fromJson(json['ingredients'])
        : null;
    sponDate = json['spon_date'];
    sponState = json['spon_state'];
    tid = json['tid'];
    smember =
        json['smember'] != null ? new SMember.fromJson(json['smember']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spon_id'] = this.sponId;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.toJson();
    }
    data['spon_date'] = this.sponDate;
    data['spon_state'] = this.sponState;
    data['tid'] = this.tid;
    if (this.smember != null) {
      data['smember'] = this.smember!.toJson();
    }
    return data;
  }
}
