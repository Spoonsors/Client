import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/components/allChooseImagePop.dart';

import '../../etc/Dialog.dart';
import '../../models/SupporterCreateProfilePageModel.dart';
import '../../service/SignupService.dart';
import 'AllLoginPage.dart';

class SupporterCreateProfilePageWidget extends StatefulWidget {
  const SupporterCreateProfilePageWidget({
    super.key,
    required this.email,
    required this.pw,
  });
  final String email;
  final String pw;
  @override
  _SupporterCreateProfilePageWidgetState createState() =>
      _SupporterCreateProfilePageWidgetState();
}

class _SupporterCreateProfilePageWidgetState
    extends State<SupporterCreateProfilePageWidget> {
  late SupporterCreateProfilePageModel _model;
  late String _email;
  late String _pw;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String choosed_profile_path = 'assets/images/user.png';
  @override
  void initState() {
    super.initState();
    _model = SupporterCreateProfilePageModel();
    _email = widget.email;
    _pw = widget.pw;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController nickController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Consumer<SignupService>(builder: (context, signupservice, child) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: const Color(0xfff5f5f5),
          automaticallyImplyLeading: false,
          leading: Icon(
            Icons.arrow_back_rounded,
            color: const Color(0xff212121),
            size: 30,
          ),
          title: Text(
            '프로필 생성',
            style: TextStyle(
              fontFamily: 'SUITE',
              color: const Color(0xff212121),
              fontSize: 22,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: const Color(0xfff5f5f5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x430F1113),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Container(
                              width: 80,
                              height: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                choosed_profile_path,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: ElevatedButton(
                            onPressed: () async {
                              final selected_profile_path =
                                  await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AllChooseImagePopWidget(),
                                ),
                              );
                              if (selected_profile_path != null) {
                                setState(() {
                                  choosed_profile_path = selected_profile_path;
                                });
                              }
                            },
                            child: Text('사진 변경',
                                style: TextStyle(
                                  color: const Color(0xffffffff),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: nameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '이름',
                                    hintStyle: TextStyle(
                                        fontFamily: 'SUITE',
                                        color: const Color(0xff212121),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(0xffffffff),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'SUITE',
                                      color: const Color(0xff212121),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  maxLines: null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: nickController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '닉네임',
                                    hintStyle: TextStyle(
                                        fontFamily: 'SUITE',
                                        color: const Color(0xff212121),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(0xffffffff),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'SUITE',
                                      color: const Color(0xff212121),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  maxLines: null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: phoneController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '전화번호',
                                    hintStyle: TextStyle(
                                        fontFamily: 'SUITE',
                                        color: const Color(0xff212121),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(0xffffffff),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'SUITE',
                                      color: const Color(0xff212121),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  maxLines: null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                            child: ElevatedButton(
                                onPressed: () async {
                                  bool isNickAvailable = await signupservice
                                      .DuplicateCheckNickname(
                                          nickController.text);
                                  if (isNickAvailable) {
                                    PostSMember _sMember = PostSMember(
                                        sMember_id: _email,
                                        sMember_pwd: _pw,
                                        sMember_pwd_check: _pw,
                                        sMember_name: nameController.text,
                                        sMember_nickname: nickController.text,
                                        sMember_phoneNumber:
                                            phoneController.text,
                                        sMember_token: "example_token_s",
                                        profile_path: choosed_profile_path);
                                    signupservice.signupSMember(_sMember);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AllLoginPageWidget(user: "s")));
                                  } else {
                                    dialog(
                                        "닉네임 중복", "이미 사용 중인 닉네임입니다.", context);
                                  }
                                },
                                child: Text("가입 완료",
                                    style: TextStyle(
                                      fontFamily: 'Lexend Deca',
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
            ],
          ),
        ),
      );
    });
  }
}
