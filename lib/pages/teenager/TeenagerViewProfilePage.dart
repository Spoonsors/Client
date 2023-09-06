import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/pages/teenager/TeenagerViewSupportsPage.dart';

import '../../components/teenagerViewInfoPop.dart';
import '../../models/TeenagerViewProfilePageModel.dart';
import '../../service/LoginService.dart';
import 'TeenagerViewNotificationPage.dart';

class TeenagerViewProfilePageWidget extends StatefulWidget {
  const TeenagerViewProfilePageWidget({super.key});
  @override
  _TeenagerViewProfilePageWidgetState createState() =>
      _TeenagerViewProfilePageWidgetState();
}

class _TeenagerViewProfilePageWidgetState
    extends State<TeenagerViewProfilePageWidget> {
  late TeenagerViewProfilePageModel _model;
  @override
  void initState() {
    super.initState();
    _model = TeenagerViewProfilePageModel();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginService>(builder: (context, loginservice, child) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          backgroundColor: const Color(0xffE0E0E0),
          body: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 140,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    loginservice.loginB.profilePath == null
                                        ? "assets/images/user.png"
                                        : loginservice.loginB
                                            .profilePath!, //profile 이미지 경로 필요
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                    child: Text(
                      loginservice.loginB.bMember_nickname!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SUITE',
                        color: const Color(0xff212121),
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Text(
                    loginservice.loginB.bMember_id!,
                    style: TextStyle(
                      fontFamily: 'SUITE',
                      color: const Color(0xffFF8A80),
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 32),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
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
                                                  TeenagerViewNotificationPageWidget()));
                                    },
                                    child: Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF5F5F5),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Icon(
                                        Icons.notifications_outlined,
                                        color: const Color(0xff212121),
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '알람 보기',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    color: const Color(0xffFFB74D),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: TeenagerViewInfoPopWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                  child: Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: const Color(0xfff5f5f5),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Icon(
                                      Icons.help_outline_outlined,
                                      color: const Color(0xff212121),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '도움말',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  color: const Color(0xffFFB74D),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0x33000000),
                            offset: Offset(0, -1),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 12),
                                    child: Text(
                                      '내 정보',
                                      style: TextStyle(
                                        fontFamily: "SUITE",
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff212121),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 16, 8),
                                          child: Icon(
                                            Icons.phone,
                                            color: const Color(0xff757575),
                                            size: 24,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 12, 0),
                                            child: Text(
                                              '전화번호',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff212121),
                                                  fontFamily: "SUITE",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          loginservice
                                              .loginB.bMember_phoneNumber!,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'SUITE',
                                            color: const Color(0xffFFB74D),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 16, 8),
                                          child: FaIcon(
                                            FontAwesomeIcons.addressBook,
                                            color: const Color(0xff757575),
                                            size: 24,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 12, 0),
                                            child: Text('주소',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xff212121),
                                                    fontFamily: "SUITE",
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                        ),
                                        Text(
                                          loginservice.loginB.bMember_address!,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'SUITE',
                                              color: const Color(0xffFFB74D)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
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
                                                    TeenagerVIewSupportsPageWidget()));
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 16, 8),
                                            child: Icon(
                                              Icons.view_list_rounded,
                                              color: const Color(0xff757575),
                                              size: 24,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 12, 0),
                                              child: Text(
                                                '수혜 내역',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xff212121),
                                                    fontFamily: "SUITE",
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right_rounded,
                                            color: const Color(0xff757575),
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 16, 8),
                                          child: Icon(
                                            Icons.login_rounded,
                                            color: const Color(0xff757575),
                                            size: 24,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 12, 0),
                                              child: GestureDetector(
                                                onTap: () {
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
                                                              Text("로그아웃"),
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
                                                                "로그아웃 하시겠습니까?",
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
                                                                Navigator.of(
                                                                        context)
                                                                    .pushNamedAndRemoveUntil(
                                                                        '/login',
                                                                        (Route<dynamic>
                                                                                route) =>
                                                                            false);
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                },
                                                child: Text(
                                                  '로그아웃',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff212121),
                                                      fontFamily: "SUITE",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
      );
    });
  }
}
