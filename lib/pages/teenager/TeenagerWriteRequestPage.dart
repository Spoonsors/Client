import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/model/IngredientsModel.dart';
import 'package:save_children_v01/pages/teenager/TeenagerAddIngredientPage.dart';
import 'package:save_children_v01/service/FridgesService.dart';
import 'package:save_children_v01/service/LoginService.dart';
import 'package:save_children_v01/service/PostsService.dart';

import '../../etc/Colors.dart';
import '../../etc/Dialog.dart';
import '../../model/RecipeModel.dart';
import '../../models/TeenagerWriteRequestPageModel.dart';

class TeenagerWriteRequestPageWidget extends StatefulWidget {
  const TeenagerWriteRequestPageWidget({super.key, required this.recipe});
  final Recipe recipe;
  @override
  _TeenagerWriteRequestPageWidgetState createState() =>
      _TeenagerWriteRequestPageWidgetState();
}

class _TeenagerWriteRequestPageWidgetState
    extends State<TeenagerWriteRequestPageWidget> {
  late TeenagerWriteRequestPageModel _model;
  late Recipe _recipe;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _model = TeenagerWriteRequestPageModel();
    _recipe = widget.recipe;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _titleTextController = TextEditingController();
    final _contentTextController = TextEditingController();
    List<String> requestParts = [];
    List<String> requiredParts = _recipe.rcp_PARTS_DTLS.split(',');
    return Consumer3<PostsService, LoginService, FridgesService>(
        builder: (context, postsService, loginservice, fridgesservice, child) {
      List<String> availableIng = [];
      fridgesservice.getMyFridge(loginservice.loginB.bMember_id!);
      fridgesservice.fridgeList.forEach((value) {
        availableIng.add(value.fridge_item_name);
      });
      fridgesservice.freezerList.forEach((value) {
        availableIng.add(value.fridge_item_name);
      });
      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xfff5f5f5),
          appBar: AppBar(
            backgroundColor: const Color(0xfff5f5f5),
            automaticallyImplyLeading: false,
            leading: Icon(
              Icons.arrow_back_rounded,
              color: const Color(0xff212121),
              size: 30,
            ),
            title: Text(
              '후원 요청',
              style: TextStyle(
                  fontFamily: "SUITE",
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff212121)),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 4, 132, 10),
                          child: Text(
                            _recipe.rcp_NM,
                            style: TextStyle(
                                fontFamily: "SUITE",
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff212121)),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            Ingredients requiredIngredient =
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TeenagerAddIngredientPageWidget()));
                            requestParts
                                .add(requiredIngredient.ingredients_name);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              backgroundColor: const Color(0xffffb74d),
                              minimumSize: Size(80, 30),
                              side: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              elevation: 2),
                          child: Text("재료 추가",
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      ],
                    ),
                    Container(
                        child: Text(
                      "필요한 모든 식재료",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF15161E),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          height: 60,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: requiredParts.length,
                              itemBuilder: (context, index) {
                                final _part = requiredParts[index];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: availableIng.contains(_part)
                                          ? Colors.white
                                          : info,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: availableIng.contains(_part)
                                            ? Colors.black
                                            : info,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Text(
                                          _part,
                                          style: TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF15161E),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )),
                    Container(
                        child: Text(
                      "후원이 필요한 식재료",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF15161E),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          height: 60,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: requestParts.length,
                              itemBuilder: (context, index) {
                                final _part = requestParts[index];
                                return InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              title: Column(
                                                children: <Widget>[
                                                  Text("재료 삭제"),
                                                ],
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "등록한 재료를 삭제하시겠습니까?",
                                                  ),
                                                ],
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    foregroundColor:
                                                        Color(0xffFFB74D),
                                                    textStyle: const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                  child: Text("확인"),
                                                  onPressed: () {
                                                    requestParts.remove(_part);
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: availableIng.contains(_part)
                                              ? Colors.white
                                              : primary,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: availableIng.contains(_part)
                                                ? Colors.black
                                                : primary,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 8, 0),
                                            child: Text(
                                              _part,
                                              style: TextStyle(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF15161E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                              }),
                        )),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        TextFormField(
                          controller: _titleTextController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontFamily: "SUITE",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff757575)),
                            hintText: '제목을 입력하세요',
                            hintStyle: TextStyle(
                                fontFamily: "SUITE",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff757575)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xffe0e0e0),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xffffb74d),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xfff44336),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xfff44336),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                          ),
                          style: TextStyle(
                              fontFamily: "SUITE",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff757575)),
                          cursorColor: const Color(0xffffb74d),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _contentTextController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontFamily: "SUITE",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff757575)),
                            hintText:
                                '개인정보 및 신상을 작성할 경우 서비스 사용에 제한이 있을 수 있습니다.',
                            hintStyle: TextStyle(
                                fontFamily: "SUITE",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff757575)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xffe0e0e0),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xffffb74d),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xfff44336),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xfff44336),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 24, 16, 12),
                          ),
                          style: TextStyle(
                              fontFamily: "SUITE",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff757575)),
                          maxLines: 24,
                          minLines: 12,
                          cursorColor: const Color(0xffffb74d),
                        ),
                      ]),
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        width: double.infinity,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                        child: ElevatedButton.icon(
                            onPressed: () async {
                              requestParts.removeWhere(
                                  (element) => availableIng.contains(element));

                              PostPosts _post = PostPosts(
                                  post_title: _titleTextController.text,
                                  post_txt: _contentTextController.text,
                                  menu_img: _recipe.att_FILE_NO_MAIN,
                                  menu_name: _recipe.rcp_NM,
                                  item_list: requestParts);
                              postsService.writePost(
                                  _post, loginservice.loginB.bMember_id!);
                              if (!postsService.isVerified) {
                                dialog(
                                    "후원 글 작성 불가", "인증되지 않은 사용자입니다.", context);
                              }

                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.receipt_long,
                                color: const Color(0xffffffff)),
                            label: Text("후원 요청하기",
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                            style: ElevatedButton.styleFrom(
                              maximumSize: Size(double.infinity, 48),
                              backgroundColor: Color(0xffFFB74D),
                              side: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ))),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
