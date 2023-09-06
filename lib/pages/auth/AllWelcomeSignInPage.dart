import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:save_children_v01/pages/auth/AllSignInPage.dart';

import '../../models/AllWelcomeSignInPageModel.dart';

class AllWelcomeSignInPageWidget extends StatefulWidget {
  const AllWelcomeSignInPageWidget({
    super.key,
    required this.isKakao,
    this.kakaoUser,
  });
  final bool isKakao;
  final User? kakaoUser;
  @override
  _AllWelcomeSignInPageWidgetState createState() =>
      _AllWelcomeSignInPageWidgetState();
}

class _AllWelcomeSignInPageWidgetState
    extends State<AllWelcomeSignInPageWidget> {
  late AllWelcomeSignInPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = AllWelcomeSignInPageModel();

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
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 180),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Text(
                            '처음으로 저희 서비스를 이용하시는군요! 반가워요!',
                            style: TextStyle(
                              fontFamily: 'SUITE',
                              color: const Color(0xff757575),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                          child: Text(
                            '어떤 회원으로 시작하시나요?',
                            style: TextStyle(
                              fontFamily: 'SUITE',
                              color: const Color(0xff212121),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
                          child: Text(
                            '자립준비청년(혹은 소년소녀가장)은 청소년으로,  기부를 하고 싶으신 분은 후원자로 시작해주세요. 자립준비청년 회원의 경우 별도의 인증 절차를 거칩니다.',
                            style: TextStyle(
                              fontFamily: 'SUITE',
                              color: const Color(0xff757575),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ]),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      widget.isKakao
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllSignInPageWidget(
                                        whichPage: "teenager",
                                        isKakao: widget.isKakao,
                                        kakaoUser: widget.kakaoUser,
                                      )))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllSignInPageWidget(
                                        whichPage: "teenager",
                                        isKakao: widget.isKakao,
                                      )));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/children.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.start,
                                '    자립준비청년 회원',
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.angleRight,
                              color: const Color(0xff757575),
                              size: 24,
                            ),
                          ]),
                    ),
                  ),
                  InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        widget.isKakao
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllSignInPageWidget(
                                          whichPage: "supporter",
                                          kakaoUser: widget.kakaoUser,
                                          isKakao: widget.isKakao,
                                        )))
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllSignInPageWidget(
                                          whichPage: "supporter",
                                          isKakao: widget.isKakao,
                                        )));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/helping-hand.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.start,
                                  '    후원자 회원',
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.angleRight,
                                color: const Color(0xff757575),
                                size: 24,
                              ),
                            ]),
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
