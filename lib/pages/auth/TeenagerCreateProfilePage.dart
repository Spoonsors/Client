import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/pages/auth/AllLoginPage.dart';
import 'package:save_children_v01/service/SignupService.dart';

import '../../components/allChooseImagePop.dart';
import '../../models/TeenagerCreateProfilePageModel.dart';

class TeenagerCreateProfilePageWidget extends StatefulWidget {
  const TeenagerCreateProfilePageWidget({
    super.key,
    required this.email,
    required this.pw,
  });
  final String email;
  final String pw;
  @override
  _TeenagerCreateProfilePageWidgetState createState() =>
      _TeenagerCreateProfilePageWidgetState();
}

class _TeenagerCreateProfilePageWidgetState
    extends State<TeenagerCreateProfilePageWidget> {
  String? item_img;
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        item_img = pickedFile.path;
      });
    }
  }

  late TeenagerCreateProfilePageModel _model;
  late String _email;
  late String _pw;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String choosed_profile_path = 'assets/images/user.png';
  @override
  void initState() {
    super.initState();
    _model = TeenagerCreateProfilePageModel();
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
    TextEditingController addressController = TextEditingController();
    TextEditingController birthController = TextEditingController();
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.12,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              getImage(ImageSource.gallery);
                                            },
                                            icon: Icon(
                                              Icons.photo_camera,
                                            ),
                                            color: const Color(0xff757575),
                                            iconSize: 30,
                                          ),
                                          Text(
                                            '서류 첨부',
                                            style: TextStyle(
                                              fontFamily: 'SUITE',
                                              color: const Color(0xff212121),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: addressController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '주소',
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
                                  controller: birthController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '생년월일(YYYYMMDD)',
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
                                    print(_email);
                                    print(_pw);
                                    print(nickController.text);
                                    print(phoneController.text);
                                    print(addressController.text);
                                    print(item_img!);
                                    print(choosed_profile_path);
                                    print(birthController.text);
                                    print(nameController.text);

                                    PostBMember _bMember = PostBMember(
                                        bMember_id: _email,
                                        bMember_pwd: _pw,
                                        bMember_pwd_check: _pw,
                                        bMember_nickname: nickController.text,
                                        bMember_phoneNumber:
                                            phoneController.text,
                                        bMember_address: addressController.text,
                                        bMember_certificate: item_img!,
                                        bMember_token: "example_token_b",
                                        profile_path: choosed_profile_path,
                                        birth: birthController.text,
                                        name: nameController.text);
                                    signupservice.signupBMember(_bMember);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AllLoginPageWidget()));
                                  } else {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            title: Column(
                                              children: <Widget>[
                                                Text("닉네임 중복"),
                                              ],
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "이미 사용 중인 닉네임입니다.",
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  foregroundColor:
                                                      Color(0xffFFB74D),
                                                  textStyle: const TextStyle(
                                                      fontSize: 20),
                                                ),
                                                child: Text("확인"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        });
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
                                  elevation: 3,
                                  minimumSize: Size(180, 40),
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
