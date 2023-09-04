import 'package:flutter/material.dart';
import 'package:save_children_v01/pages/auth/NutriAdminLoginPage.dart';

import '../../etc/Colors.dart';
import '../../etc/TextStyles.dart';
import 'AllLoginPage.dart';

class AllSelectUserPageWidget extends StatefulWidget {
  const AllSelectUserPageWidget({Key? key}) : super(key: key);

  @override
  _AllSelectUserPageWidgetState createState() =>
      _AllSelectUserPageWidgetState();
}

class _AllSelectUserPageWidgetState extends State<AllSelectUserPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primary, secondary],
                stops: [-1, 1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  width: double.infinity,
                  height: 415,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                "assets/images/logo.jpg",
                                width: 300,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 24),
                        child: Text(
                          '환영합니다!',
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          '모두의 한끼를 통해 따뜻한 마음을 공유해보세요!',
                          style: bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 44),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AllLoginPageWidget(user: "b")));
                              },
                              child: Text(
                                '수혜자로 로그인',
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(100, 44),
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                backgroundColor: primary,
                                elevation: 3,
                                side: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AllLoginPageWidget(user: "s")));
                              },
                              child: Text(
                                '후원자로 로그인',
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(100, 44),
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                backgroundColor: primary,
                                elevation: 3,
                                side: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 44),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NutriAdminPageWidget()));
                              },
                              child: Text(
                                '영양사 및 관리자로 로그인',
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  color: primary,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(180, 44),
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                backgroundColor: Colors.white,
                                elevation: 3,
                                side: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
