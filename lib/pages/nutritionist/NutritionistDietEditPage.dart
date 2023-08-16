import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/etc/TextStyles.dart';
import 'package:save_children_v01/service/MealPlannerService.dart';
import 'package:save_children_v01/service/RecipeService.dart';

import '../../components/nutritionistDietAddFoodBottomSheet.dart';
import '../../etc/Colors.dart';
import '../../model/MealPlannerModel.dart';

class NutritionistDietEditPageWidget extends StatefulWidget {
  const NutritionistDietEditPageWidget({super.key});

  @override
  State<NutritionistDietEditPageWidget> createState() =>
      _NutritionistDietEditPageWidgetState();
}

class _NutritionistDietEditPageWidgetState
    extends State<NutritionistDietEditPageWidget> {
  @override
  Widget build(BuildContext context) {
    final _mealPlannerTitleTextController = TextEditingController();

    final idx = ModalRoute.of(context)?.settings.arguments as int;

    return Consumer2<RecipeService, MealPlannerService>(
        builder: (context, recipeService, mealPlannerService, child) {
      return Scaffold(
        backgroundColor: primaryBackground,
        appBar: AppBar(
          iconTheme: IconThemeData(color: primaryText),
          title: Text(
            '식단 등록하기',
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: GestureDetector(
                  onTap: () {
                    MealPlanner putMealPlanner = MealPlanner(
                        mealPlanner_id: mealPlannerService
                            .mealPlannerList[idx].mealPlanner_id,
                        menu_name1:
                            recipeService.selectedRecipeList[0].recipe.rcp_NM,
                        menu_img1: recipeService
                            .selectedRecipeList[0].recipe.att_FILE_NO_MAIN,
                        menu_name2:
                            recipeService.selectedRecipeList[1].recipe.rcp_NM,
                        menu_img2: recipeService
                            .selectedRecipeList[1].recipe.att_FILE_NO_MAIN,
                        menu_name3:
                            recipeService.selectedRecipeList[2].recipe.rcp_NM,
                        menu_img3: recipeService
                            .selectedRecipeList[2].recipe.att_FILE_NO_MAIN,
                        menu_name4:
                            recipeService.selectedRecipeList[3].recipe.rcp_NM,
                        menu_img4: recipeService
                            .selectedRecipeList[3].recipe.manual_IMG[0],
                        mealPlanner_name: _mealPlannerTitleTextController.text,
                        kcal: recipeService.kcal,
                        carbohydrate: recipeService.carbo,
                        protein: recipeService.pro,
                        fat: recipeService.fat,
                        level: "중",
                        timeRequired: "50");

                    mealPlannerService.updateMealPlanner(putMealPlanner, idx);

                    Navigator.pop(context);
                  },
                  child: Text(
                    '완료',
                    style: TextStyle(
                      fontFamily: 'SUITE',
                      color: secondaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            recipeService.selectedRecipeList.isNotEmpty
                ? Container(
                    width: double.infinity,
                    height: 162.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "${recipeService.selectedRecipeList[0].recipe.att_FILE_NO_MAIN}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    width: double.infinity,
                    height: 162.0,
                    color: secondaryBackground,
                    alignment: Alignment.center,
                    child: Text(
                      "메뉴를 추가하면 이미지가 자동으로 등록됩니다.",
                      style: bodyMedium,
                    ),
                  ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
              child: TextFormField(
                controller: _mealPlannerTitleTextController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: '식단명을 입력해주세요.',
                  hintStyle: TextStyle(
                    fontFamily: 'SUITE',
                    color: secondaryText,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: primaryText,
                  fontFamily: 'SUITE',
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '열량',
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: secondaryText,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '${recipeService.kcal.toStringAsFixed(1)}kcal',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            color: primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '단백질',
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: secondaryText,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '${recipeService.pro.toStringAsFixed(1)}g',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            color: primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '탄수화물',
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: secondaryText,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '${recipeService.carbo.toStringAsFixed(1)}g',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            color: primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '지방',
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: secondaryText,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '${recipeService.fat.toStringAsFixed(1)}g',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            color: primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2.0,
              color: alternate,
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: recipeService.selectedRecipeList.length,
                    itemBuilder: (context, index) {
                      final selectedRecipe =
                          recipeService.selectedRecipeList[index];
                      return SelectedFoodWidget(selectedRecipe: selectedRecipe);
                    })),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 15.0),
              child: Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: primaryBackground,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    width: 0.5,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return NutritionistDietAddFoodBottomSheetWidget();
                        });
                  },
                  child: Icon(
                    Icons.add_rounded,
                    color: Color(0xE2757575),
                    size: 35.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class SelectedFoodWidget extends StatelessWidget {
  const SelectedFoodWidget({super.key, required this.selectedRecipe});

  final SelectedRecipe selectedRecipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.network(
                        '${selectedRecipe.recipe.att_FILE_NO_MAIN}',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${selectedRecipe.recipe.rcp_NM}',
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            fontSize: 17.0,
                            color: primaryText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 1.0, 0.0, 1.0),
                                  child: Text(
                                    '탄수화물 ${selectedRecipe.recipe.info_CAR.toStringAsFixed(1)}g, 단백질 ${selectedRecipe.recipe.info_PRO.toStringAsFixed(1)}g, 지방 ${selectedRecipe.recipe.info_FAT.toStringAsFixed(1)}g',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'SUITE',
                                      fontSize: 12.0,
                                      color: secondaryText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  '${selectedRecipe.recipe.info_ENG}kcal',
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    color: secondaryText,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 2.5, 5.0),
                  child: OutlinedButton(
                    onPressed: () {
                      context
                          .read<RecipeService>()
                          .selectRecipe(selectedRecipe.recipe.rcp_SEQ);
                      // 제외버튼 구현
                    },
                    child: Text(
                      '제외',
                      style: TextStyle(
                          color: secondaryText,
                          fontFamily: 'SUITE',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: secondaryText),
                      fixedSize: Size.fromHeight(35.0),
                      backgroundColor: primaryBackground,
                      elevation: 2.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
