import 'dart:ui';
import 'package:flutter/material.dart';

class TeenagerAddIngredientPopWidget extends StatefulWidget {
  const TeenagerAddIngredientPopWidget({Key? key}) : super(key: key);

  @override
  _TeenagerAddIngredientPopWidgetState createState() =>
      _TeenagerAddIngredientPopWidgetState();
}

class _TeenagerAddIngredientPopWidgetState
    extends State<TeenagerAddIngredientPopWidget>
    with TickerProviderStateMixin {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 4,
        ),
        child: Container(
          width: double.infinity,
          height: 700,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 670,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xfff5f5f5),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x33000000),
                          offset: Offset(0, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xffe0e0e0),
                        width: 1,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            autovalidateMode: AutovalidateMode.always,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 24, 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 4),
                                                child: Text(
                                                  '재료 추가',
                                                  style: TextStyle(
                                                      fontFamily: "SUITE",
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff212121)),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Text(
                                                    '냉장고에 추가할 재료를 등록하세요',
                                                    style: TextStyle(
                                                        fontFamily: "SUITE",
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff212121))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.close_rounded,
                                          color: const Color(0xff757575),
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: Container(
                                            width: 120,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffe0e0e0),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Stack(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .add_a_photo_outlined,
                                                      color: const Color(
                                                          0xff757575),
                                                      size: 72,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 12, 0, 0),
                                                      child: Text(
                                                        '사진 등록',
                                                        style: TextStyle(
                                                            fontFamily: "SUITE",
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: const Color(
                                                                0xff212121)),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Text(
                                                        '재료 사진을 등록하세요',
                                                        style: TextStyle(
                                                            fontFamily: "SUITE",
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xff757575)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    child: TextFormField(
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: '재료 이름',
                                        hintStyle: TextStyle(
                                          fontFamily: 'SUITE',
                                          color: const Color(0xff757575),
                                          fontWeight: FontWeight.normal,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xffe0e0e0),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xffffb74d),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xfff44336),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xfff44336),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 12, 0, 12),
                                      ),
                                      style: TextStyle(
                                          fontFamily: "SUITE",
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff212121)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    child: TextFormField(
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: '재료 설명(선택)',
                                        hintStyle: TextStyle(
                                          fontFamily: 'SUITE',
                                          color: const Color(0xff757575),
                                          fontWeight: FontWeight.normal,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xffe0e0e0),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xffffb74d),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xfff44336),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xfff44336),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 12, 0, 12),
                                      ),
                                      style: TextStyle(
                                          fontFamily: "SUITE",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff212121)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                '유통기한 |',
                                                style: TextStyle(
                                                  fontFamily: 'SUITE',
                                                  fontSize: 22,
                                                ),
                                              ),
                                              Icon(
                                                Icons.calendar_today,
                                                color: const Color(0xff757575),
                                                size: 24,
                                              ),
                                              Text(
                                                '23.07.25',
                                                style: TextStyle(
                                                  fontFamily: 'SUITE',
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ]),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '보관방법 |',
                                        style: TextStyle(
                                          fontFamily: 'SUITE',
                                          fontSize: 22,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                              ),
                                              unselectedWidgetColor:
                                                  const Color(0xff757575),
                                            ),
                                            child: CheckboxListTile(
                                              value: true,
                                              onChanged: (newValue) async {},
                                              title: Text(
                                                '냉장',
                                                style: TextStyle(
                                                    fontFamily: "SUITE",
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xff212121)),
                                              ),
                                              tileColor:
                                                  const Color(0xfff5f5f5),
                                              activeColor:
                                                  const Color(0xffffb74d),
                                              checkColor:
                                                  const Color(0xff2196f3),
                                              dense: false,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                              ),
                                              unselectedWidgetColor:
                                                  const Color(0xff757575),
                                            ),
                                            child: CheckboxListTile(
                                              value: true,
                                              onChanged: (newValue) async {},
                                              title: Text(
                                                '냉동',
                                                style: TextStyle(
                                                    fontFamily: "SUITE",
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xff212121)),
                                              ),
                                              tileColor:
                                                  const Color(0xfff5f5f5),
                                              activeColor:
                                                  const Color(0xffffb74d),
                                              checkColor:
                                                  const Color(0xff2196f3),
                                              dense: false,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                              ),
                                              unselectedWidgetColor:
                                                  const Color(0xff757575),
                                            ),
                                            child: CheckboxListTile(
                                              value: true,
                                              onChanged: (newValue) async {},
                                              title: Text(
                                                '실온',
                                                style: TextStyle(
                                                    fontFamily: "SUITE",
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xff212121)),
                                              ),
                                              tileColor:
                                                  const Color(0xfff5f5f5),
                                              activeColor:
                                                  const Color(0xffffb74d),
                                              checkColor:
                                                  const Color(0xff2196f3),
                                              dense: false,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text("재료 추가",
                                                    style: TextStyle(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(100, 40),
                                                  backgroundColor:
                                                      Color(0xffFFB74D),
                                                  side: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                ))),
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
                  )),
            ],
          ),
        ));
  }
}
