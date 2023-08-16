import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/pages/teenager/TeenagerViewAllRecipesPage.dart';
import 'package:save_children_v01/pages/teenager/TeenagerViewRecipePage.dart';
import 'package:save_children_v01/service/MealPlannerService.dart';

import '../../model/MealPlannerModel.dart';
import '../../model/RecipeModel.dart';
import '../../models/TeenagerViewDietsPageModel.dart';
import '../../service/RecipeService.dart';

class TeenagerViewDietsPageWidget extends StatefulWidget {
  const TeenagerViewDietsPageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerViewDietsPageWidgetState createState() =>
      _TeenagerViewDietsPageWidgetState();
}

class _TeenagerViewDietsPageWidgetState
    extends State<TeenagerViewDietsPageWidget> {
  late TeenagerVIewDietsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = TeenagerVIewDietsPageModel();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MealPlannerService>(
        builder: (context, mealPlannerService, child) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xffFFFFFF),
          appBar: AppBar(
            backgroundColor: const Color(0xffFFFFFF),
            iconTheme: IconThemeData(color: const Color(0xff212121)),
            automaticallyImplyLeading: true,
            title: Text(
              '전체 식단 조회',
              style: TextStyle(
                  fontFamily: 'SUITE',
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff212121)),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                        child: Text(
                          '현재 등록된 재료 기준으로 정렬합니다',
                          style: TextStyle(
                              fontFamily: 'SUITE',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff757575)),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: mealPlannerService.mealPlannerList.length,
                      itemBuilder: (context, index) {
                        return DietCard(
                            diet: mealPlannerService.mealPlannerList[index],
                            idx: index);
                      }),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class DietCard extends StatelessWidget {
  const DietCard({super.key, required this.diet, required this.idx});
  final MealPlanner diet;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: ListView(
        padding: EdgeInsets.zero,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 8),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xfff5f5f5),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x411D2429),
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      String _name = diet.menu_name1;
                                      RecipeService _recipeService =
                                          RecipeService();
                                      _recipeService.getRecipeInfo(_name);
                                      Recipe _recipe =
                                          _recipeService.requestedMenu;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TeenagerViewRecipePageWidget(
                                                      recipe: _recipe)));
                                    },
                                    child: Container(
                                      width: 105,
                                      height: 85,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF5F5F5),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              diet.menu_img1,
                                              width: 100,
                                              height: 58,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 3, 0, 0),
                                            child: Text(diet.menu_name1,
                                                style: TextStyle(
                                                    fontFamily: 'SUITE',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xff212121))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      String _name = diet.menu_name2;
                                      RecipeService _recipeService =
                                          RecipeService();
                                      _recipeService.getRecipeInfo(_name);
                                      Recipe _recipe =
                                          _recipeService.requestedMenu;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TeenagerViewRecipePageWidget(
                                                      recipe: _recipe)));
                                    },
                                    child: Container(
                                      width: 105,
                                      height: 85,
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff5f5f5),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              diet.menu_img2,
                                              width: 100,
                                              height: 58,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 3, 0, 0),
                                            child: Text(diet.menu_name2,
                                                style: TextStyle(
                                                    fontFamily: 'SUITE',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xff212121))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      String _name = diet.menu_name3;
                                      RecipeService _recipeService =
                                          RecipeService();
                                      _recipeService.getRecipeInfo(_name);
                                      Recipe _recipe =
                                          _recipeService.requestedMenu;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TeenagerViewRecipePageWidget(
                                                      recipe: _recipe)));
                                    },
                                    child: Container(
                                      width: 105,
                                      height: 85,
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff5f5f5),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              diet.menu_img3,
                                              width: 100,
                                              height: 58,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 3, 0, 0),
                                            child: Text(diet.menu_name3,
                                                style: TextStyle(
                                                    fontFamily: 'SUITE',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xff212121))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      String _name = diet.menu_name4;
                                      RecipeService _recipeService =
                                          RecipeService();
                                      _recipeService.getRecipeInfo(_name);
                                      Recipe _recipe =
                                          _recipeService.requestedMenu;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TeenagerViewRecipePageWidget(
                                                      recipe: _recipe)));
                                    },
                                    child: Container(
                                      width: 105,
                                      height: 85,
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff5f5f5),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              diet.menu_img4,
                                              width: 100,
                                              height: 58,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 3, 0, 0),
                                            child: Text(diet.menu_name4,
                                                style: TextStyle(
                                                    fontFamily: 'SUITE',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xff212121))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RatingBarIndicator(
                                itemBuilder: (context, index) => Icon(
                                    Icons.star_rounded,
                                    color: const Color(0xffffd740)),
                                direction: Axis.horizontal,
                                rating: double.parse(diet.level),
                                itemCount: 5,
                                itemSize: 20,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 8, 0),
                                    child: AutoSizeText('열량',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: "SUITE",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xff757575))),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 8, 0),
                                    child: AutoSizeText('탄수화물',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: "SUITE",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xff757575))),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 8, 0),
                                    child: AutoSizeText('단백질',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: "SUITE",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xff757575))),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 8, 0),
                                    child: AutoSizeText('지방',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: "SUITE",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xff757575))),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 8, 0),
                                    child: AutoSizeText(diet.kcal.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: "SUITE",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xff757575))),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 8, 0),
                                    child: AutoSizeText(
                                        diet.carbohydrate.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: "SUITE",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xff757575))),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 8, 0),
                                    child: AutoSizeText(diet.protein.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: "SUITE",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xff757575))),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 8, 0),
                                    child: AutoSizeText(diet.fat.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: "SUITE",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xff757575))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: IconButton(
                              icon: const Icon(Icons.chevron_right_rounded,
                                  size: 24),
                              color: Color(0xFF57636C),
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TeenagerViewAllRecipesPageWidget(
                                                diet_name:
                                                    diet.mealPlanner_name)));
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
