import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/TeenagerWriteReviewPageModel.dart';

class TeenagerWriteReviewPageWidget extends StatefulWidget {
  const TeenagerWriteReviewPageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerWriteReviewPageWidgetState createState() =>
      _TeenagerWriteReviewPageWidgetState();
}

class _TeenagerWriteReviewPageWidgetState
    extends State<TeenagerWriteReviewPageWidget> with TickerProviderStateMixin {
  late TeenagerWriteReviewPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = TeenagerWriteReviewPageModel();

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            '리뷰 작성',
            style: TextStyle(
              fontFamily: 'SUITE',
              color: const Color(0xff212121),
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      '참치 김치찌개',
                      style: TextStyle(
                        fontFamily: 'SUITE',
                        color: const Color(0xff212121),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
                      TextFormField(
                        controller: _model.textController1,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff757575),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: '제목을 입력하세요',
                          hintStyle: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff757575),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
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
                          fontFamily: 'SUITE',
                          color: const Color(0xff757575),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        cursorColor: const Color(0xffffb74d),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _model.textController2,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff757575),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: '개인정보 및 신상을 작성할 경우 서비스 사용에 제한이 있을 수 있습니다.',
                          hintStyle: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff757575),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
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
                          fontFamily: 'SUITE',
                          color: const Color(0xff757575),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 24,
                        minLines: 9,
                        cursorColor: const Color(0xffffb74d),
                      ),
                    ]),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 500,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xfff5f5f5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xffe0e0e0),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.add_a_photo_rounded,
                                color: const Color(0xffffb74d),
                                size: 32,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: Text(
                                  '사진 업로드',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    color: const Color(0xff757575),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 170,
                      decoration: BoxDecoration(
                        color: const Color(0xfff5f5f5),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xfff5f5f5),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Text(
                                '후원해주신 분들',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 0, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 64,
                                          height: 64,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffff4081),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xffffb74d),
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/익명.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: Text(
                                            '익명1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: const Color(0xff757575),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 0, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 64,
                                          height: 64,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffff4081),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xffffb74d),
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/익명.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: Text(
                                            '익명2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: const Color(0xff757575),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 0, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 64,
                                          height: 64,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffff4081),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xffffb74d),
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/익명.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: Text(
                                            '익명3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: const Color(0xff757575),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 0, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 64,
                                          height: 64,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffff4081),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xffffb74d),
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/익명.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: Text(
                                            '익명4',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: const Color(0xff757575),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
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
                  ),
                  Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: ElevatedButton.icon(
                          icon: Icon(Icons.receipt_long,
                              color: const Color(0xffffffff)),
                          onPressed: () {},
                          label: Text("리뷰 올리기",
                              style: TextStyle(
                                fontFamily: 'SUITE',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                          style: ElevatedButton.styleFrom(
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
  }
}
