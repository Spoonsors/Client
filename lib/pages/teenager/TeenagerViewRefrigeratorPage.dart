import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/service/FridgesService.dart';

import 'package:save_children_v01/service/LoginService.dart';

import '../../components/teenagerAddIngredientPop2.dart';
import '../../model/FridgeModel.dart';
import '../../models/TeenagerViewRefrigeratorPageModel.dart';

class TeenagerViewRefrigeratorPageWidget extends StatefulWidget {
  const TeenagerViewRefrigeratorPageWidget({super.key});
  @override
  _TeenagerViewRefrigeratorPageWidgetState createState() =>
      _TeenagerViewRefrigeratorPageWidgetState();
}

class _TeenagerViewRefrigeratorPageWidgetState
    extends State<TeenagerViewRefrigeratorPageWidget> {
  late TeenagerViewRefrigeratorPageModel _model;
  @override
  void initState() {
    super.initState();
    _model = TeenagerViewRefrigeratorPageModel();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<FridgesService, LoginService>(
        builder: (context, fridgesService, loginservice, child) {
      fridgesService.getMyFridge(loginservice.loginB.bMember_id!);
      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 3, color: Colors.transparent),
                borderRadius: BorderRadius.circular(100)),
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: TeenagerAddIngredientPop2Widget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            backgroundColor: const Color(0xffFFB74D),
            icon: Icon(
              Icons.add_rounded,
              color: const Color(0xffffffff),
            ),
            elevation: 8,
            label: Text(
              '재료추가',
              style: TextStyle(
                fontFamily: 'SUITE',
                color: const Color(0xffFFFFFF),
                fontSize: 20,
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: const Color(0xffFFFFFF),
            automaticallyImplyLeading: false,
            title: Text(
              '나의 냉장고',
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
          body: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: TabBar(
                    labelColor: const Color(0xff212121),
                    unselectedLabelColor: const Color(0xff757575),
                    labelStyle: TextStyle(
                      fontFamily: "Primary Family",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                    indicatorColor: const Color(0xffFFB74D),
                    tabs: [
                      Tab(
                        text: '냉장',
                      ),
                      Tab(
                        text: '냉동/실온',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 0.7,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: fridgesService.fridgeList.length,
                                itemBuilder: (context, index) {
                                  final _item =
                                      fridgesService.fridgeList[index];
                                  return IngredientCard(
                                      fridgeItem: _item, idx: index);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 0.7,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: fridgesService.freezerList.length,
                                itemBuilder: (context, index) {
                                  final _item =
                                      fridgesService.freezerList[index];
                                  return IngredientCard(
                                      fridgeItem: _item, idx: index);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class IngredientCard extends StatelessWidget {
  const IngredientCard(
      {super.key, required this.fridgeItem, required this.idx});

  final Fridge fridgeItem;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Color(0x33000000),
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Color(0xFFE0E3E7),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "${fridgeItem.fridge_item_img}",
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Text(
                    '${fridgeItem.fridge_item_name}',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF14181B),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: fridgeItem.expiration_date == null
                              ? "-"
                              : '~${fridgeItem.expiration_date.toString()}',
                          style: TextStyle(),
                        )
                      ],
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: DateTime.now().isBefore(DateTime.parse(
                                fridgeItem.expiration_date == null
                                    ? "2099-08-30"
                                    : fridgeItem.expiration_date!))
                            ? Color(0xFF57636C)
                            : Color.fromARGB(239, 204, 26, 26),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
