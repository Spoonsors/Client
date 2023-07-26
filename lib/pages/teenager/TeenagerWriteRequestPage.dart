import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/TeenagerWriteRequestPageModel.dart';

class TeenagerWriteRequestPageWidget extends StatefulWidget {
  const TeenagerWriteRequestPageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerWriteRequestPageWidgetState createState() =>
      _TeenagerWriteRequestPageWidgetState();
}

class _TeenagerWriteRequestPageWidgetState
    extends State<TeenagerWriteRequestPageWidget> {
  late TeenagerWriteRequestPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = TeenagerWriteRequestPageModel();

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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 10),
                    child: Text(
                      '고등어 무조림',
                      style: TextStyle(
                          fontFamily: "SUITE",
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff212121)),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xffff8a80),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xffff8a80),
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Text(
                                '고등어1토막(60g)',
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xffff8a80),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xffff8a80),
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Text(
                                '무 20g',
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xfff5f5f5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Text(
                                '고추장 20g',
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xfff5f5f5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Text(
                                '간장 17g',
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xfff5f5f5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Text(
                                '다진 마늘 2g',
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xfff5f5f5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Text(
                                '청고추',
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xf),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xf),
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Text(
                                '홍고추',
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
                      ),
                    ]),
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
                        controller: _model.textController2,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontFamily: "SUITE",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff757575)),
                          hintText: '개인정보 및 신상을 작성할 경우 서비스 사용에 제한이 있을 수 있습니다.',
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
                          onPressed: () {},
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
  }
}
