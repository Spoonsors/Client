import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/etc/Colors.dart';
import 'package:save_children_v01/model/IngredientsModel.dart';
import 'package:save_children_v01/service/IngredientsService.dart';

class AdminViewAllProductPageWidget extends StatefulWidget {
  const AdminViewAllProductPageWidget({Key? key}) : super(key: key);

  @override
  _AdminViewAllProductPageWidgetState createState() =>
      _AdminViewAllProductPageWidgetState();
}

class _AdminViewAllProductPageWidgetState
    extends State<AdminViewAllProductPageWidget> {
  List<String> items = [
    "최신 순",
    "가격 순",
  ];

  String selectedItem = "최신 순";

  @override
  Widget build(BuildContext context) {
    return Consumer<IngredientsService>(
        builder: (context, ingredientsService, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '현재 등록된 상품들',
          ),
          actions: [
            // Logout button
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: IconButton(
                icon: Icon(
                  Icons.login_rounded,
                  color: secondaryText,
                  size: 24.0,
                ),
                onPressed: () {}, // TODO : [admin] Logout 버튼 구현
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                itemCount: ingredientsService.productList.length,
                itemBuilder: (context, index) {
                  final ingredient = ingredientsService.productList[index];
                  return ProductDetailsWidget(
                      ingredients: ingredient,
                      ingredientsService: ingredientsService);
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/AdminProductRegisterPage');
          },
          backgroundColor: primary,
          icon: Icon(
            Icons.add,
            color: primaryBackground,
          ),
          elevation: 8.0,
          label: Text(
            '상품 등록',
            style: TextStyle(
              fontFamily: 'SUITE',
              color: primaryBackground,
              fontSize: 20.0,
            ),
          ),
        ),
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
    return // Generated code for this UserList9 Widget...
        Padding(
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/돼지고기.jpeg',
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                      ), // TODO : [admin] 이미지 확인
                    ),
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  '${widget.ingredients.product_name}',
                                  style: TextStyle(
                                      fontFamily: 'SUITE',
                                      fontSize: 13.0,
                                      color: secondaryText),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  '${widget.ingredients.price}원',
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    fontSize: 12.0,
                                    color: secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.delete_sharp,
                                  color: secondaryText,
                                  size: 17.0,
                                ),
                                onPressed: () {
                                  widget.ingredientsService.deleteProduct(
                                      widget.ingredients.ingredients_id);
                                }, // TODO : [admin] 등록된 상품 제거 구현
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.mode_edit_sharp,
                                  color: secondaryText,
                                  size: 17.0,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/AdminProductRegisterPage',
                                      arguments: widget.ingredients);
                                }, // TODO : [admin] 등록된 상품 수정 구현
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
  }
}
