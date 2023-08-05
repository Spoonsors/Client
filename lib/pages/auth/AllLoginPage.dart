import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:save_children_v01/pages/auth/AllWelcomeSignInPage.dart';

import '../../models/AllLoginPageModel.dart';
import '../teenager/TeenagerViewMainPage.dart';

class AllLoginPageWidget extends StatefulWidget {
  const AllLoginPageWidget({Key? key}) : super(key: key);

  @override
  _AllLoginPageWidgetState createState() => _AllLoginPageWidgetState();
}

class _AllLoginPageWidgetState extends State<AllLoginPageWidget> {
  late AllLoginPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = AllLoginPageModel();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
    _model.passwordVisibility = false;
    _model.emailAddressController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
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
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0, -1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                    child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        '모두의 한끼',
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: const Color(0xff212121),
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 570,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xfff5f5f5),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xffffffff),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '로그인',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  color: const Color(0xff212121),
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 12, 0, 24),
                                child: Text(
                                  '로그인하거나 회원가입해서 서비스를 시작하세요!',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    color: const Color(0xff757575),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.emailAddressController,
                                    autofocus: true,
                                    autofillHints: [AutofillHints.email],
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '이메일을 입력해주세요',
                                      labelStyle: TextStyle(
                                        fontFamily: 'SUITE',
                                        color: const Color(0xff757575),
                                        fontSize: 14,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffe0e0e0),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffffb74d),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xfff44336),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xfff44336),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xfff5f5f5),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              24, 24, 0, 24),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'SUITE',
                                      color: const Color(0xff757575),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.passwordController,
                                    autofocus: true,
                                    autofillHints: [AutofillHints.password],
                                    obscureText: !_model.passwordVisibility,
                                    decoration: InputDecoration(
                                      labelText: '비밀번호를 입력해주세요',
                                      labelStyle: TextStyle(
                                        fontFamily: 'SUITE',
                                        color: const Color(0xff757575),
                                        fontSize: 14,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffe0e0e0),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffffb74d),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xfff44336),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xfff44336),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xfff5f5f5),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              24, 24, 0, 24),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => _model.passwordVisibility =
                                              !_model.passwordVisibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.passwordVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: const Color(0xff757575),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'SUITE',
                                      color: const Color(0xff757575),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TeenagerViewMainPageWidget()));
                                        },
                                        child: Text("로그인",
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(230, 44),
                                          backgroundColor: Color(0xffFFB74D),
                                          side: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                        ))),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Wrap(
                                  spacing: 16,
                                  runSpacing: 0,
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.center,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        child: ElevatedButton.icon(
                                            icon: FaIcon(FontAwesomeIcons.k),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TeenagerViewMainPageWidget()));
                                            },
                                            label: Text("카카오 계정으로 로그인",
                                                style: TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  color:
                                                      const Color(0xff212121),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(230, 44),
                                              backgroundColor:
                                                  Color(0xfff5f5f5),
                                              side: BorderSide(
                                                color: const Color(0xffe0e0e0),
                                                width: 2,
                                              ),
                                            ))),
                                  ],
                                ),
                              ),

                              // You will have to add an action on this rich text to go to your login page.
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 12),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AllWelcomeSignInPageWidget()));
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '계정이 없으신가요? ',
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text: '회원가입',
                                            style: TextStyle(
                                              fontFamily: 'SUITE',
                                              color: const Color(0xffffb74d),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                        style: TextStyle(
                                          fontFamily: 'SUITE',
                                          color: const Color(0xff212121),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
