import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:save_children_v01/pages/auth/SupporterCreateProfilePage.dart';

import '../../models/AllSignInPageModel.dart';
import 'TeenagerCreateProfilePage.dart';

class AllSignInPageWidget extends StatefulWidget {
  final String whichPage;

  const AllSignInPageWidget({required this.whichPage, Key? key})
      : super(key: key);

  @override
  _AllSignInPageWidgetState createState() => _AllSignInPageWidgetState();
}

class _AllSignInPageWidgetState extends State<AllSignInPageWidget> {
  late String page;
  late AllSignInPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = AllSignInPageModel();
    _model.passwordVisibility = false;
    _model.passwordConfirmVisibility = false;
    _model.emailAddressController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
    _model.passwordConfirmController ??= TextEditingController();
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
                                        controller:
                                            _model.emailAddressController,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '이메일',
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
                                        controller: _model.passwordController,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.password],
                                        obscureText: !_model.passwordVisibility,
                                        decoration: InputDecoration(
                                          labelText: '비밀번호',
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
                                              () => _model.passwordVisibility =
                                                  !_model.passwordVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordVisibility
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
                                        controller:
                                            _model.passwordConfirmController,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.password],
                                        obscureText:
                                            !_model.passwordConfirmVisibility,
                                        decoration: InputDecoration(
                                          labelText: '비밀번호 확인',
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
                                              () => _model
                                                      .passwordConfirmVisibility =
                                                  !_model
                                                      .passwordConfirmVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordConfirmVisibility
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
                                          onPressed: () {
                                            if (page == "teenager") {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TeenagerCreateProfilePageWidget()));
                                            } else if (page == "supporter") {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SupporterCreateProfilePageWidget()));
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
                                            backgroundColor: Color(0xffFFB74D),
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
                                                color: const Color(0xfff5f5f5),
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
                                                color: const Color(0xff212121),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          style: ElevatedButton.styleFrom(
                                            minimumSize:
                                                Size(double.infinity, 44),
                                            backgroundColor: Color(0xfff5f5f5),
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
                                                color: const Color(0xffffb74d),
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
  }
}
