import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/model/MealPlannerModel.dart';
import 'package:save_children_v01/pages/teenager/TeenagerViewAllRecipesPage.dart';
import 'package:save_children_v01/pages/teenager/TeenagerViewDietsPage.dart';
import 'package:save_children_v01/pages/teenager/TeenagerViewRecipePage.dart';
import 'package:save_children_v01/pages/teenager/TeenagerWriteRequestPage.dart';

import '../../etc/Dialog.dart';
import '../../model/RecipeModel.dart';
import '../../models/TeenagerViewHomePageModel.dart';
import '../../service/LoginService.dart';
import '../../service/MealPlannerService.dart';
import '../../service/RecipeService.dart';

class TeenagerViewHomePageWidget extends StatefulWidget {
  const TeenagerViewHomePageWidget({super.key});
  @override
  _TeenagerViewHomePageWidgetState createState() =>
      _TeenagerViewHomePageWidgetState();
}

class _TeenagerViewHomePageWidgetState extends State<TeenagerViewHomePageWidget>
    with TickerProviderStateMixin {
  late TeenagerViewHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = TeenagerViewHomePageModel();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<RecipeService, MealPlannerService, LoginService>(builder:
        (context, recipeService, mealPlannerService, loginService, child) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          backgroundColor: const Color(0xffFFFFFF),
          floatingActionButton: FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 3, color: Colors.transparent),
                borderRadius: BorderRadius.circular(100)),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeenagerViewAllRecipesPageWidget(
                            diet_name: '',
                          )));
            },
            backgroundColor: const Color(0xffFFB74D),
            icon: Icon(
              Icons.search,
              size: 20,
              color: const Color(0xffffffff),
            ),
            elevation: 8,
            label: Text(
              '모든 레시피 보기',
              style: TextStyle(
                fontFamily: 'SUITE',
                color: const Color(0xffFFFFFF),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.8, 0),
                          child: Text(
                            '오늘의 추천 식단',
                            style: TextStyle(
                              fontFamily: 'SUITE',
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TeenagerViewDietsPageWidget()));
                          },
                          child: Text(
                            '모든 식단 보기 >',
                            style: TextStyle(
                              fontFamily: 'SUITE',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  mealPlannerService.mealPlannerList.isNotEmpty
                      ? Container(
                          width: double.infinity,
                          height: 350,
                          decoration: BoxDecoration(),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              final _diet =
                                  mealPlannerService.mealPlannerList[index];
                              return RecommendedDietCard(
                                  diet: _diet, idx: index);
                            },
                          ),
                        )
                      : Container(
                          height: 350,
                          child: Container(
                              width: 200,
                              height: 200,
                              child: CircularProgressIndicator()),
                        ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(-0.8, 0),
                      child: Text(
                        '오늘의 추천 레시피',
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  recipeService.recipeList.isNotEmpty
                      ? Container(
                          width: double.infinity,
                          height: 240,
                          decoration: BoxDecoration(),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              final _menu =
                                  recipeService.recipeList[index].recipe;
                              return RecommendedMenuCard(
                                  menu: _menu,
                                  id: loginService.loginB.bMember_id!,
                                  idx: index);
                            },
                          ),
                        )
                      : Container(
                          height: 350,
                          child: Container(
                              width: 200,
                              height: 200,
                              child: CircularProgressIndicator()),
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class RecommendedDietCard extends StatelessWidget {
  const RecommendedDietCard({super.key, required this.diet, required this.idx});
  final MealPlanner diet;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TeenagerViewAllRecipesPageWidget(
                          diet_name: diet.mealPlannerName!,
                        )));
          },
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Color(0x3D0F1113),
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 140,
                      height: 102,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              diet.menuImg1!,
                              width: 140,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            diet.menuName1!,
                            style: TextStyle(
                                fontFamily: 'SUITE',
                                color: const Color(0xff212121),
                                fontSize: diet.menuName1 != null &&
                                        diet.menuName1!.length > 10
                                    ? diet.menuName1!.length > 15
                                        ? 8.0
                                        : 10.0
                                    : 14.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 102,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: diet.menuImg2 == null
                                ? Image.asset("assets/images/empty.jpeg",
                                    width: 140, height: 80, fit: BoxFit.cover)
                                : Image.network(
                                    diet.menuImg2!,
                                    width: 140,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Text(
                            diet.menuName2 == null ? "없음" : diet.menuName2!,
                            style: TextStyle(
                                fontFamily: 'SUITE',
                                color: const Color(0xff212121),
                                fontSize: diet.menuName2 != null &&
                                        diet.menuName2!.length > 10
                                    ? diet.menuName2!.length > 15
                                        ? 8.0
                                        : 10.0
                                    : 14.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 140,
                      height: 102,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: diet.menuImg3 == null
                                ? Image.asset("assets/images/empty.jpeg",
                                    width: 140, height: 80, fit: BoxFit.cover)
                                : Image.network(
                                    diet.menuImg3!,
                                    width: 140,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Text(
                            diet.menuName3 == null ? "없음" : diet.menuName3!,
                            style: TextStyle(
                                fontFamily: 'SUITE',
                                color: const Color(0xff212121),
                                fontSize: diet.menuName3 != null &&
                                        diet.menuName3!.length > 10
                                    ? diet.menuName3!.length > 15
                                        ? 8.0
                                        : 10.0
                                    : 14.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 102,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: diet.menuImg4 == null
                                ? Image.asset("assets/images/empty.jpeg",
                                    width: 140, height: 80, fit: BoxFit.cover)
                                : Image.network(
                                    diet.menuImg4!,
                                    width: 140,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Text(
                            diet.menuName4 == null ? "없음" : diet.menuName4!,
                            style: TextStyle(
                                fontFamily: 'SUITE',
                                color: const Color(0xff212121),
                                fontSize: diet.menuName4 != null &&
                                        diet.menuName4!.length > 10
                                    ? diet.menuName4!.length > 15
                                        ? 8.0
                                        : 10.0
                                    : 14.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            diet.mealPlannerName!,
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFFFF8D00),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              diet.timeRequired == null
                                  ? "-"
                                  : diet.timeRequired!,
                              style: GoogleFonts.outfit(
                                textStyle: TextStyle(
                                  color: Color(0xFF14181B),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          Text(
                            diet.level == "하"
                                ? "쉬움"
                                : diet.level == "중"
                                    ? "보통"
                                    : "어려움",
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF57636C),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '열량',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '탄수화물',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '단백질',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '지방',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      diet.kcal.toString(),
                      style: TextStyle(
                          fontFamily: 'SUITE',
                          color: const Color(0xff212121),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      diet.carbohydrate.toString(),
                      style: TextStyle(
                          fontFamily: 'SUITE',
                          color: const Color(0xff212121),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      diet.protein.toString(),
                      style: TextStyle(
                          fontFamily: 'SUITE',
                          color: const Color(0xff212121),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      diet.fat.toString(),
                      style: TextStyle(
                          fontFamily: 'SUITE',
                          color: const Color(0xff212121),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class RecommendedMenuCard extends StatelessWidget {
  const RecommendedMenuCard(
      {super.key, required this.menu, required this.id, required this.idx});
  final Recipe menu;
  final String id;
  final int idx;
  Future<int> isAvailablePost(String id) async {
    Response res = await Dio().get(
      "http://15.165.106.139:8080/bMember/canPost/${id}",
    );
    return res.data;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 12, 12),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TeenagerViewRecipePageWidget(
                        recipe: menu,
                      )));
        },
        child: Container(
          width: 230,
          decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x34090F13),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 5),
                  child: Text(
                    menu.rcp_NM,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'SUITE',
                        color: const Color(0xff212121),
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  menu.att_FILE_NO_MAIN,
                  width: 220,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.96),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await isAvailablePost(id) == 1
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TeenagerWriteRequestPageWidget(
                                              recipe: menu)))
                              : dialog("후원 글 작성 불가",
                                  "리뷰 작성 후 후원 글을 작성할 수 있습니다...", context);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            backgroundColor: const Color(0xff262D34),
                            minimumSize: Size(80, 30),
                            side: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            elevation: 2),
                        child: Text("후원 등록",
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TeenagerViewRecipePageWidget(
                                          recipe: menu)));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            backgroundColor: const Color(0xff4B39EF),
                            minimumSize: Size(80, 30),
                            side: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            elevation: 2),
                        child: Text("레시피 보기",
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
