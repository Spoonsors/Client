import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/etc/Colors.dart';
import 'package:save_children_v01/model/IngredientsModel.dart';
import 'package:save_children_v01/pages/auth/NutriAdminLoginPage.dart';
import 'package:save_children_v01/service/IngredientsService.dart';

class AdminViewAllProductPageWidget extends StatefulWidget {
  const AdminViewAllProductPageWidget({Key? key}) : super(key: key);

  @override
  _AdminViewAllProductPageWidgetState createState() =>
      _AdminViewAllProductPageWidgetState();
}

class _AdminViewAllProductPageWidgetState
    extends State<AdminViewAllProductPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IngredientsService>(
        builder: (context, ingredientsService, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            '현재 등록된 상품들',
          ),
          actions: [
            // go to CertificatePage button
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              child: IconButton(
                icon: Icon(
                  Icons.contact_page_outlined,
                  color: secondaryText,
                  size: 24.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/AdminCertificateConfirmPage');
                },
              ),
            ),
            // Logout button
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: IconButton(
                icon: Icon(
                  Icons.login_rounded,
                  color: secondaryText,
                  size: 24.0,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => NutriAdminPageWidget()));
                },
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: ingredientsService.productList.length,
                itemBuilder: (context, index) {
                  final ingredient = ingredientsService.productList[index];
                  if (index == ingredientsService.productList.length - 1) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                      child: ProductDetailsWidget(ingredients: ingredient),
                    );
                  }
                  return ProductDetailsWidget(ingredients: ingredient);
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
  const ProductDetailsWidget({super.key, required this.ingredients});

  final Ingredients ingredients;

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 10.0, 0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    '${widget.ingredients.ingredients_image}',
                    width: 70.0,
                    height: 70.0,
                    fit: BoxFit.cover,
                  ),
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
                                10.0, 0.0, 0.0, 0.0),
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
                                10.0, 2.0, 0.0, 0.0),
                            child: Container(
                              width: 170,
                              child: RichText(
                                maxLines: 3,
                                text: TextSpan(
                                  text: '${widget.ingredients.product_name}',
                                  style: TextStyle(
                                      fontFamily: 'SUITE',
                                      fontSize: 13.0,
                                      color: secondaryText),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 2.0, 0.0, 0.0),
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
                              size: 20.0,
                            ),
                            onPressed: () {
                              context.read<IngredientsService>().deleteProduct(
                                  widget.ingredients.ingredients_id);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.mode_edit_sharp,
                              color: secondaryText,
                              size: 20.0,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/AdminProductRegisterPage',
                                  arguments: widget.ingredients);
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
  }
}
