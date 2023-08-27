import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../etc/Colors.dart';
import '../../etc/TextStyles.dart';
import '../../service/SMSService.dart';

class AllFindPwPageWidget extends StatefulWidget {
  const AllFindPwPageWidget({Key? key}) : super(key: key);

  @override
  _AllFindPwPageWidgetState createState() => _AllFindPwPageWidgetState();
}

class _AllFindPwPageWidgetState extends State<AllFindPwPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  TextEditingController? idController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? codeController = TextEditingController();
  bool verifyState = false;
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
    return Consumer<SMSService>(builder: (context, smsservice, child) {
      return GestureDetector(
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: secondaryBackground,
          appBar: AppBar(
            backgroundColor: const Color(0xffffffff),
            iconTheme: IconThemeData(color: const Color(0xff212121)),
            automaticallyImplyLeading: true,
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 670,
                ),
                decoration: BoxDecoration(
                  color: secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 32, 0, 8),
                                child: Text(
                                  'PW 찾기',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    color: const Color(0xff212121),
                                    fontSize: 36,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 0, 12),
                                child: Text(
                                  '이름/전화번호/아이디를 입력해주세요.',
                                  textAlign: TextAlign.start,
                                  style: labelLarge,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 0),
                                child: TextFormField(
                                  controller: idController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '아이디',
                                    labelStyle: labelLarge,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: alternate,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primary,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: error,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: error,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 16, 8),
                                  ),
                                  style: bodyLarge,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 0),
                                child: TextFormField(
                                  controller: nameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '이름',
                                    labelStyle: labelLarge,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: alternate,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primary,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: error,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: error,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 16, 8),
                                  ),
                                  style: bodyLarge,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 0),
                                child: TextFormField(
                                  controller: phoneController,
                                  textCapitalization: TextCapitalization.none,
                                  decoration: InputDecoration(
                                    labelText: '전화번호',
                                    labelStyle: labelLarge,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: alternate,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primary,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: error,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: error,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 16, 8),
                                  ),
                                  style: bodyLarge,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 0),
                                child: TextFormField(
                                  controller: codeController,
                                  textCapitalization: TextCapitalization.none,
                                  decoration: InputDecoration(
                                    labelText: '인증번호',
                                    labelStyle: labelLarge,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: alternate,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primary,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: error,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: error,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 16, 8),
                                  ),
                                  style: bodyLarge,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 0),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    smsservice.verifyID(idController!.text);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      backgroundColor: const Color(0xff262D34),
                                      minimumSize: Size(80, 30),
                                      side: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      elevation: 2),
                                  child: Text("인증번호 전송",
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 0),
                                child: ElevatedButton(
                                  onPressed: () async {},
                                  style: ElevatedButton.styleFrom(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      backgroundColor: const Color(0xff262D34),
                                      minimumSize: Size(80, 30),
                                      side: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      elevation: 2),
                                  child: Text("인증하기",
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            backgroundColor: const Color(0xff262D34),
                            minimumSize: Size(80, 30),
                            side: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            elevation: 2),
                        child: Text("비밀번호 변경",
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                    ),
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
