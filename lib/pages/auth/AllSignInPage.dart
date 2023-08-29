import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/pages/auth/SupporterCreateProfilePage.dart';
import 'package:save_children_v01/service/SignupService.dart';

import '../../models/AllSignInPageModel.dart';
import 'TeenagerCreateProfilePage.dart';

class AllSignInPageWidget extends StatefulWidget {
  final String whichPage;
  final User? kakaoUser;
  final bool isKakao;
  const AllSignInPageWidget(
      {required this.whichPage,
      Key? key,
      this.kakaoUser,
      required this.isKakao})
      : super(key: key);

  @override
  _AllSignInPageWidgetState createState() => _AllSignInPageWidgetState();
}

class _AllSignInPageWidgetState extends State<AllSignInPageWidget> {
  late String page;
  late AllSignInPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool passwordVisibility = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _model = AllSignInPageModel();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    page = widget.whichPage;
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupService>(builder: (context, signupservice, child) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xfff5f5f5),
          body: SafeArea(
            top: true,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    width: 100,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xfff5f5f5),
                    ),
                    alignment: AlignmentDirectional(0, -1),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                              color: const Color(0xfff5f5f5),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
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
                          Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 430,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xfff5f5f5),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 24, 24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '회원가입',
                                      style: TextStyle(
                                        fontFamily: 'SUITE',
                                        color: const Color(0xff212121),
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 24),
                                      child: Text(
                                        '아래 양식을 작성해주세요',
                                        style: TextStyle(
                                          fontFamily: 'SUITE',
                                          color: const Color(0xff757575),
                                          fontSize: 14,
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
                                          enabled:
                                              widget.isKakao ? false : true,
                                          controller: emailController,
                                          autofocus: true,
                                          autofillHints: [AutofillHints.email],
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: widget.isKakao
                                                ? widget.kakaoUser!
                                                    .kakaoAccount!.email
                                                : '이메일',
                                            labelStyle: TextStyle(
                                              fontFamily: 'SUITE',
                                              color: const Color(0xff757575),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xff757575),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xffffb74d),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xfff44336),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xfff44336),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            filled: true,
                                            fillColor: const Color(0xffffffff),
                                          ),
                                          style: TextStyle(
                                            fontFamily: 'SUITE',
                                            color: const Color(0xff212121),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 16),
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          enabled:
                                              widget.isKakao ? false : true,
                                          controller: passwordController,
                                          autofocus: true,
                                          autofillHints: [
                                            AutofillHints.password
                                          ],
                                          obscureText: !passwordVisibility,
                                          decoration: InputDecoration(
                                            labelText: widget.isKakao
                                                ? widget.kakaoUser!.id
                                                    .toString()
                                                : '비밀번호',
                                            labelStyle: TextStyle(
                                              fontFamily: 'SUITE',
                                              color: const Color(0xff757575),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xffffffff),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xffffb74d),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xfff44336),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xfff44336),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            filled: true,
                                            fillColor: const Color(0xffffffff),
                                            suffixIcon: InkWell(
                                              onTap: () => setState(
                                                () => passwordVisibility =
                                                    !passwordVisibility,
                                              ),
                                              focusNode: FocusNode(
                                                  skipTraversal: true),
                                              child: Icon(
                                                passwordVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color: const Color(0xff757575),
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                          style: TextStyle(
                                            fontFamily: 'SUITE',
                                            color: const Color(0xff212121),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 16),
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          enabled:
                                              widget.isKakao ? false : true,
                                          controller: passwordConfirmController,
                                          autofocus: true,
                                          autofillHints: [
                                            AutofillHints.password
                                          ],
                                          obscureText: !passwordVisibility,
                                          decoration: InputDecoration(
                                            labelText: widget.isKakao
                                                ? widget.kakaoUser!.id
                                                    .toString()
                                                : '비밀번호 확인',
                                            labelStyle: TextStyle(
                                              fontFamily: 'SUITE',
                                              color: const Color(0xff757575),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xffffffff),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xffffb74d),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xfff44336),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xfff44336),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            filled: true,
                                            fillColor: const Color(0xffffffff),
                                            suffixIcon: InkWell(
                                              onTap: () => setState(
                                                () => passwordVisibility =
                                                    !passwordVisibility,
                                              ),
                                              focusNode: FocusNode(
                                                  skipTraversal: true),
                                              child: Icon(
                                                passwordVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color: const Color(0xff757575),
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                          style: TextStyle(
                                            fontFamily: 'SUITE',
                                            color: const Color(0xff212121),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          minLines: 1,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: ElevatedButton(
                                            onPressed: () async {
                                              bool isIdAvailable =
                                                  await signupservice
                                                      .DuplicateCheckId(
                                                          emailController.text);
                                              if (isIdAvailable) {
                                                if ((passwordController
                                                                .text.length >=
                                                            8 &&
                                                        passwordController
                                                                .text.length <=
                                                            15) ||
                                                    widget.isKakao) {
                                                  if (passwordController.text ==
                                                      passwordConfirmController
                                                          .text) {
                                                    if (page == "teenager") {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  TeenagerCreateProfilePageWidget(
                                                                    email: widget.isKakao
                                                                        ? widget
                                                                            .kakaoUser!
                                                                            .kakaoAccount!
                                                                            .email!
                                                                        : emailController
                                                                            .text,
                                                                    pw: widget
                                                                            .isKakao
                                                                        ? widget
                                                                            .kakaoUser!
                                                                            .id!
                                                                            .toString()
                                                                        : passwordController
                                                                            .text,
                                                                  )));
                                                    } else if (page ==
                                                        "supporter") {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  SupporterCreateProfilePageWidget(
                                                                    email: widget.isKakao
                                                                        ? widget
                                                                            .kakaoUser!
                                                                            .kakaoAccount!
                                                                            .email!
                                                                        : emailController
                                                                            .text,
                                                                    pw: widget
                                                                            .isKakao
                                                                        ? widget
                                                                            .kakaoUser!
                                                                            .id!
                                                                            .toString()
                                                                        : passwordController
                                                                            .text,
                                                                  )));
                                                    }
                                                  } else {
                                                    showDialog(
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
                                                                Text("비밀번호 확인"),
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
                                                                  "비밀번호를 확인해주세요.",
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
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  }
                                                } else {
                                                  showDialog(
                                                      context: context,
                                                      barrierDismissible: false,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)),
                                                          title: Column(
                                                            children: <Widget>[
                                                              Text("비밀번호 확인"),
                                                            ],
                                                          ),
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Text(
                                                                "비밀번호는 8~15자여야 합니다.",
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
                                                              child: Text("확인"),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                }
                                              } else {
                                                showDialog(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        title: Column(
                                                          children: <Widget>[
                                                            Text("ID 중복"),
                                                          ],
                                                        ),
                                                        content: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Text(
                                                              "이미 사용 중인 ID입니다.",
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
                                                            child: Text("확인"),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              }
                                            },
                                            child: Text("계정 생성하기",
                                                style: TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffFFB74D),
                                              minimumSize:
                                                  Size(double.infinity, 44),
                                              side: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              elevation: 3,
                                            ))),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: Container(
                                        width: double.infinity,
                                        child: Stack(
                                          alignment: AlignmentDirectional(0, 0),
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 6, 0, 6),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 2,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffe0e0e0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width: 70,
                                                height: 32,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xfff5f5f5),
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Text(
                                                  'OR',
                                                  style: TextStyle(
                                                    fontFamily: 'SUITE',
                                                    color:
                                                        const Color(0xff757575),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: ElevatedButton.icon(
                                            icon: FaIcon(FontAwesomeIcons.k),
                                            onPressed: () {},
                                            label: Text("카카오 계정으로 가입",
                                                style: TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  color:
                                                      const Color(0xff212121),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            style: ElevatedButton.styleFrom(
                                              minimumSize:
                                                  Size(double.infinity, 44),
                                              backgroundColor:
                                                  Color(0xfff5f5f5),
                                              side: BorderSide(
                                                color: const Color(0xffe0e0e0),
                                                width: 2,
                                              ),
                                            ))),

                                    // You will have to add an action on this rich text to go to your login page.
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 12),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '이미 계정이 있으신가요? ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: '로그인하기',
                                                style: TextStyle(
                                                  fontFamily: 'SUITE',
                                                  color:
                                                      const Color(0xffffb74d),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                            style: TextStyle(
                                              fontFamily: 'SUITE',
                                              color: const Color(0xff212121),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
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
                        ],
                      ),
                    ),
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
