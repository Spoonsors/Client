import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/components/teenagerAddIngredientPop.dart';
import 'package:save_children_v01/etc/Colors.dart';
import 'package:save_children_v01/model/IngredientsModel.dart';
import 'package:save_children_v01/service/FridgesService.dart';
import 'package:save_children_v01/service/IngredientsService.dart';
import 'package:save_children_v01/service/LoginService.dart';

class TeenagerAddIngredientPop2Widget extends StatefulWidget {
  const TeenagerAddIngredientPop2Widget({Key? key}) : super(key: key);

  @override
  _TeenagerAddIngredientPop2Widget createState() =>
      _TeenagerAddIngredientPop2Widget();
}

class _TeenagerAddIngredientPop2Widget
    extends State<TeenagerAddIngredientPop2Widget> {
  List<String> items = [
    "최신 순",
    "가격 순",
  ];
  late List<Ingredients> ingredientsList;

  String selectedItem = "최신 순";
  List<Ingredients> filteredIngredientsList = [];
  void filterSearchResults(String query) {
    List<Ingredients> searchResults = [];
    searchResults.addAll(ingredientsList);

    if (query.isNotEmpty) {
      searchResults = searchResults.where((item) {
        return item.ingredients_name
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
    }

    setState(() {
      filteredIngredientsList = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<IngredientsService, FridgesService, LoginService>(builder:
        (context, ingredientsService, fridgesService, loginService, child) {
      ingredientsList = ingredientsService.productList;
      return Scaffold(
        appBar: AppBar(
          titleSpacing: 10.0,
          title: Text(
            '재료 검색',
            style: TextStyle(
              fontFamily: 'SUITE',
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search for fruits...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                    child: DropdownButton(
                      underline: SizedBox.shrink(),
                      style: TextStyle(
                        fontFamily: 'SUITE',
                        color: primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      value: selectedItem,
                      items: items.map(
                        (value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (value) => {
                        setState(() {
                          selectedItem = value!;
                        })
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: filteredIngredientsList.length,
                itemBuilder: (context, index) {
                  final ingredient = filteredIngredientsList[index];
                  return ProductDetailsWidget(
                      ingredients: ingredient,
                      ingredientsService: ingredientsService);
                },
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     //재료 추가 구현
        //     PostFridges ing = PostFridges(
        //         fridge_id: 100,
        //         bMember_id: loginService.loginB.bMember_id!,
        //         item_name: "임의",
        //         is_frized: 1,
        //         expiration_date: "2023-08-25");
        //     fridgesService.postFridge(ing, loginService.loginB.bMember_id!);
        //   },
        //   backgroundColor: primary,
        //   icon: Icon(
        //     Icons.add,
        //     color: primaryBackground,
        //   ),
        //   elevation: 8.0,
        //   label: Text(
        //     '재료 추가',
        //     style: TextStyle(
        //       fontFamily: 'SUITE',
        //       color: primaryBackground,
        //       fontSize: 20.0,
        //     ),
        //   ),
        // ),
      );
    });
  }
}

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget(
      {super.key, required this.ingredients, required this.ingredientsService});

  final Ingredients ingredients;
  final IngredientsService ingredientsService;

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginService>(builder: (context, loginService, child) {
      return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.0,
                  color: primaryBackground,
                  offset: Offset(0.0, 1.0),
                )
              ],
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '${widget.ingredients.ingredients_name}',
                                style: TextStyle(
                                    fontFamily: 'SUITE',
                                    color: info,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.mode_edit_sharp,
                                color: secondaryText,
                                size: 17.0,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TeenagerAddIngredientPopWidget(
                                              ingredient_name: widget
                                                  .ingredients.ingredients_name,
                                              bMember_id: loginService
                                                  .loginB.bMember_id!,
                                            )));
                                //유통기한 입력
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
