class MealPlanner {
  int? mealPlannerId;
  String? menuName1;
  String? menuImg1;
  String? menuName2;
  String? menuImg2;
  String? menuName3;
  String? menuImg3;
  String? menuName4;
  String? menuImg4;
  String? mealPlannerName;
  double? kcal;
  double? carbohydrate;
  double? protein;
  double? fat;
  double? na;
  String? level;
  String? timeRequired;

  MealPlanner(
      {this.mealPlannerId,
      this.menuName1,
      this.menuImg1,
      this.menuName2,
      this.menuImg2,
      this.menuName3,
      this.menuImg3,
      this.menuName4,
      this.menuImg4,
      this.mealPlannerName,
      this.kcal,
      this.carbohydrate,
      this.protein,
      this.fat,
      this.na,
      this.level,
      this.timeRequired});

  factory MealPlanner.fromJson(Map<String, dynamic> json) => MealPlanner(
        mealPlannerId: json["mealPlanner_id"],
        menuName1: json["menu_name1"],
        menuImg1: json["menu_img1"],
        menuName2: json["menu_name2"],
        menuImg2: json["menu_img2"],
        menuName3: json["menu_name3"],
        menuImg3: json["menu_img3"],
        menuName4: json["menu_name4"],
        menuImg4: json["menu_img4"],
        mealPlannerName: json["mealPlanner_name"],
        kcal: (json["carbohydrate"] * 4 + json["protein"] * 4 + json["fat"] * 9)
            .round()
            .toDouble(),
        carbohydrate: json["carbohydrate"],
        protein: json["protein"],
        fat: json["fat"],
        level: json["level"],
        na: json["na"],
        timeRequired: json["timeRequired"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mealPlanner_id'] = this.mealPlannerId;
    data['menu_name1'] = this.menuName1;
    data['menu_img1'] = this.menuImg1;
    data['menu_name2'] = this.menuName2;
    data['menu_img2'] = this.menuImg2;
    data['menu_name3'] = this.menuName3;
    data['menu_img3'] = this.menuImg3;
    data['menu_name4'] = this.menuName4;
    data['menu_img4'] = this.menuImg4;
    data['mealPlanner_name'] = this.mealPlannerName;
    data['kcal'] = this.kcal;
    data['carbohydrate'] = this.carbohydrate;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    data['na'] = this.na;
    data['level'] = this.level;
    data['timeRequired'] = this.timeRequired;
    return data;
  }
}
