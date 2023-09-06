import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/etc/Colors.dart';
import 'package:save_children_v01/etc/Dialog.dart';
import 'package:save_children_v01/pages/admin/AdminViewAllProductPage.dart';
import 'package:save_children_v01/pages/nutritionist/NutritionistNutriHomePage.dart';
import 'package:save_children_v01/service/LoginService.dart';

class NutriAdminPageWidget extends StatefulWidget {
  const NutriAdminPageWidget({Key? key}) : super(key: key);

  @override
  _NutriAdminPageWidgetState createState() => _NutriAdminPageWidgetState();
}

class _NutriAdminPageWidgetState extends State<NutriAdminPageWidget> {
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
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: secondaryBackground,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Container(
                  width: double.infinity,
                  height: 500,
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
                      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '관리자/영양사 로그인',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'SUITE',
                              color: const Color(0xff212121),
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                            child: Text(
                              '로그인해주세요. 회원가입은 별도 문의 바랍니다.',
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
                                controller: passwordController,
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
                                      () => passwordVisibility =
                                          !passwordVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      //일단 bMember로만 로그인한다고 가정
                                      bool checkNutri =
                                          loginservice.LoginNutrioutionist(
                                              emailController.text,
                                              passwordController.text);
                                      bool checkAdmin = loginservice.LoginAdmin(
                                          emailController.text,
                                          passwordController.text);
                                      if (checkNutri) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NutritionistNutriHomePageWidget()));
                                      } else if (checkAdmin) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AdminViewAllProductPageWidget()));
                                      } else {
                                        dialog(
                                            "로그인 실패",
                                            "아이디와 비밀번호를 다시 입력해주시기 바랍니다.",
                                            context);
                                      }
                                    },
                                    child: Text("로그인",
                                        style: TextStyle(
                                          color: primaryBackground,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(180, 44),
                                      backgroundColor: primary,
                                      side: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ))),
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
      );
    });
  }
}
