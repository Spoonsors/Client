import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/service/RecipeService.dart';

import '../../model/RecipeModel.dart';
import '../../models/TeenagerViewAllRecipesPageModel.dart';
import 'TeenagerViewRecipePage.dart';
import 'TeenagerWriteRequestPage.dart';

class TeenagerViewAllRecipesPageWidget extends StatefulWidget {
  const TeenagerViewAllRecipesPageWidget({super.key, required this.diet_name});

  //diet_name라는 이름의 식단에 포함된 메뉴들 및 레시피 조회
  final String diet_name;
  @override
  _TeenagerViewAllRecipesPageWidgetState createState() =>
      _TeenagerViewAllRecipesPageWidgetState();
}

class _TeenagerViewAllRecipesPageWidgetState
    extends State<TeenagerViewAllRecipesPageWidget> {
  late TeenagerViewAllRecipesPageModel _model;
  late String _diet_name;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = TeenagerViewAllRecipesPageModel();
    _diet_name = widget.diet_name;
    // On page load action.

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeService>(builder: (context, recipeService, child) {
      recipeService.get4RecipeInfo(_diet_name);
      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xffffffff),
            appBar: AppBar(
              backgroundColor: const Color(0xffffffff),
              iconTheme: IconThemeData(color: const Color(0xff212121)),
              automaticallyImplyLeading: true,
              title: Text(
                '모든 레시피 보기',
                style: TextStyle(
                  fontFamily: 'SUITE',
                  color: const Color(0xff212121),
                  fontSize: 22,
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                    child: Text(
                      '현재 등록된 재료 기준으로 정렬합니다',
                      style: TextStyle(
                        fontFamily: 'SUITE',
                        color: const Color(0xff757575),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _diet_name == ''
                            ? recipeService.recipeList.length
                            : recipeService.requested4MenuInDiet.length,
                        itemBuilder: (context, index) {
                          if (_diet_name == '') {
                            final _recipe = recipeService.recipeList[index];
                            return RecipeCard(
                                recipe: _recipe.recipe, idx: index);
                          } else {
                            print("hello");
                            final _recipe =
                                recipeService.requested4RecipeInDiet[index];
                            return RecipeCard(recipe: _recipe, idx: index);
                          }
                        }),
                  )
                ]),
              ),
            )),
      );
    });
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe, required this.idx});

  final Recipe recipe;
  final int idx;

  @override
  Widget build(BuildContext context) {
    List<String> parts = recipe.rcp_PARTS_DTLS.split(',');
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: 220,
            maxWidth: 530,
            maxHeight: 260,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x33000000),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Color(0xFFF5FBFB),
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.rcp_NM,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: const Color(0xff212121),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                '쉬움, 30분', //난이도 변경 예정
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF57636C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.more_vert_rounded,
                        color: Color(0xFF57636C),
                        size: 24,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                          child: MasonryGridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            itemCount: parts.length,
                            itemBuilder: (context, index) {
                              return Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(
                                        0xffFF8A80), //재료를 갖고 있는지 아닌지에 따라 색깔 구분 필요
                                    borderRadius: BorderRadius.circular(20),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      parts[index],
                                      style: TextStyle(
                                        fontFamily: 'SUITE',
                                        color: Color(0xFF212121),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.96),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // <-- Radius
                                      ),
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      backgroundColor: const Color(0xff262D34),
                                      minimumSize: Size(130, 30),
                                      side: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      elevation: 2),
                                  child: Text("부족한 물품 후원 등록",
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TeenagerWriteRequestPageWidget(
                                                    recipe: recipe)));
                                  },
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // <-- Radius
                                      ),
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                        fontWeight: FontWeight.w400,
                                      )),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TeenagerViewRecipePageWidget(
                                                  recipe: recipe,
                                                )));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
