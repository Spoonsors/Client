import 'dart:convert';

Ingredients IngredientsJson(String str) =>
    Ingredients.fromJson(json.decode(str));

String IngredientsToJson(Ingredients data) => json.encode(data.toJson());

class Ingredients {
  int ingredients_id;
  String ingredients_name;
  String product_name;
  String ingredients_image;
  int price;

  Ingredients({
    required this.ingredients_id,
    required this.ingredients_name,
    required this.product_name,
    required this.ingredients_image,
    required this.price,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        ingredients_id: json["ingredients_id"],
        ingredients_name: json["ingredients_name"],
        product_name: json["product_name"],
        ingredients_image: json["ingredients_image"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "ingredients_id": ingredients_id,
        "ingredients_name": ingredients_name,
        "product_name": product_name,
        "ingredients_image": ingredients_image,
        "price": price,
      };
}
