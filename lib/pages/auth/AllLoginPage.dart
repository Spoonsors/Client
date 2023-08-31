import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/etc/Dialog.dart';
import 'package:save_children_v01/pages/auth/AllWelcomeSignInPage.dart';
import 'package:save_children_v01/service/LoginService.dart';

import '../teenager/TeenagerViewMainPage.dart';
import 'AllFindIdPage.dart';
import 'AllFindPwPage.dart';

class AllLoginPageWidget extends StatefulWidget {
  const AllLoginPageWidget({Key? key}) : super(key: key);

  @override
  _AllLoginPageWidgetState createState() => _AllLoginPageWidgetState();
}

class _AllLoginPageWidgetState extends State<AllLoginPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late bool passwordVisibility;
  TextEditingController emailController =
      TextEditingController(); // Move these here
  TextEditingController passwordController =
      TextEditingController(); // Move these here
  @override
  void initState() {
    super.initState();
    // _model = AllLoginPageModel();
    passwordVisibility = false;
    // On page load action.
    // SchedulerBinding.instance.addPostFrameCallback((_) async {});

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginService>(builder: (context, loginservice, child) {
      return GestureDetector(
        // onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: emailController,
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
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xffffb74d),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xfff44336),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xfff44336),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: passwordController,
                                      autofocus: true,
                                      autofillHints: [AutofillHints.password],
                                      obscureText: !passwordVisibility,
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
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xffffb74d),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xfff44336),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xfff44336),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xfff5f5f5),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                24, 24, 0, 24),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => passwordVisibility =
                                                !passwordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            passwordVisibility
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
                                          onPressed: () async {
                                            //일단 bMember로만 로그인한다고 가정
                                            loginservice.loginBMember(
                                                emailController.text,
                                                passwordController.text);
                                            if (loginservice.isLogin) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TeenagerViewMainPageWidget()));
                                            } else {
                                              dialog(
                                                  "로그인 실패",
                                                  "아이디와 비밀번호를 다시 입력해주시기 바랍니다.",
                                                  context);
                                            }
                                          },
                                          child: Text("로그인",
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xffFFB74D),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(180, 44),
                                            backgroundColor: Colors.white,
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
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.center,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: InkWell(
                                            child: Image.asset(
                                                'assets/images/kakao_login.png'),
                                            onTap: () async {
                                              User kakaoUser =
                                                  await loginservice
                                                      .kakaoLogin();
                                              if (kakaoUser != false) {
                                                loginservice.loginBMember(
                                                    kakaoUser
                                                        .kakaoAccount!.email!,
                                                    kakaoUser.id
                                                        .toString()); //아이디 : 카카오 계정 / 비번 :  카카오 회원번호
                                                loginservice.isLogin
                                                    ? Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                TeenagerViewMainPageWidget()))
                                                    : showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0)),
                                                            title: Column(
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    "앱 정보 등록 필요"),
                                                              ],
                                                            ),
                                                            content: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  "계정 정보를 등록해야합니다.",
                                                                ),
                                                              ],
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          20.0),
                                                                  foregroundColor:
                                                                      Color(
                                                                          0xffFFB74D),
                                                                  textStyle:
                                                                      const TextStyle(
                                                                          fontSize:
                                                                              20),
                                                                ),
                                                                child:
                                                                    Text("확인"),
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => AllWelcomeSignInPageWidget(
                                                                                isKakao: loginservice.isKakao,
                                                                                kakaoUser: kakaoUser,
                                                                              )));
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        });
                                              } else {
                                                dialog(
                                                    "로그인 실패",
                                                    "아이디와 비밀번호를 다시 입력해주시기 바랍니다.",
                                                    context);
                                              }
                                            },
                                          )),
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
                                                      AllWelcomeSignInPageWidget(
                                                        isKakao: loginservice
                                                            .isKakao,
                                                      )));
                                        },
                                        child: Column(
                                          children: [
                                            RichText(
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
                                                      color: const Color(
                                                          0xffffb74d),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                ],
                                                style: TextStyle(
                                                  fontFamily: 'SUITE',
                                                  color:
                                                      const Color(0xff212121),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'ID/PW를 잊어버리셨나요? ',
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            AllFindIdPageWidget()));
                                                          },
                                                    text: 'ID 찾기 / ',
                                                    style: TextStyle(
                                                      fontFamily: 'SUITE',
                                                      color: const Color(
                                                          0xffffb74d),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'PW 찾기',
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            AllFindPwPageWidget()));
                                                          },
                                                    style: TextStyle(
                                                      fontFamily: 'SUITE',
                                                      color: const Color(
                                                          0xffffb74d),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                ],
                                                style: TextStyle(
                                                  fontFamily: 'SUITE',
                                                  color:
                                                      const Color(0xff212121),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
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
    });
  }
}
