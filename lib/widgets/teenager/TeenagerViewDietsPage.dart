import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeenagerVIewDietsPageWidget extends StatefulWidget {
  const TeenagerVIewDietsPageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerVIewDietsPageWidgetState createState() =>
      _TeenagerVIewDietsPageWidgetState();
}

class _TeenagerVIewDietsPageWidgetState
    extends State<TeenagerVIewDietsPageWidget> {
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
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          iconTheme: IconThemeData(color: const Color(0xff212121)),
          automaticallyImplyLeading: true,
          title: Text(
            '전체 식단 조회',
            style: TextStyle(
                fontFamily: 'SUITE',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: const Color(0xff212121)),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                      child: Text(
                        '현재 등록된 재료 기준으로 정렬합니다',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff757575)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pushNamed('TeenagerViewAllRecipesPage');
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xfff5f5f5),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x411D2429),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 4, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                Navigator.pushNamed(
                                                    'TeenagerViewRecipePage');
                                              },
                                              child: Container(
                                                width: 105,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffF5F5F5),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.network(
                                                        'https://recipe1.ezmember.co.kr/cache/recipe/2019/01/02/c870febc131bbb66f2bd174959695bb41.jpg',
                                                        width: 100,
                                                        height: 58,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 3, 0, 0),
                                                      child: Text('차조밥',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SUITE',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xff212121))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 105,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: const Color(0xfff5f5f5),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://recipe1.ezmember.co.kr/cache/recipe/2018/10/21/b1a3f537aadca6e12f45b21aaca2a7981.jpg',
                                                      width: 100,
                                                      height: 58,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 3, 0, 0),
                                                    child: Text('콩나물국',
                                                        style: TextStyle(
                                                            fontFamily: 'SUITE',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xff212121))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 105,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: const Color(0xfff5f5f5),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://recipe1.ezmember.co.kr/cache/recipe/2016/03/16/4b2ad9b10dd6253ae2236658bab43b0b1.jpg',
                                                      width: 100,
                                                      height: 58,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 3, 0, 0),
                                                    child: Text('달걀채소말이',
                                                        style: TextStyle(
                                                            fontFamily: 'SUITE',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xff212121))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 105,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: const Color(0xfff5f5f5),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://i.namu.wiki/i/3u7KQ8jVXWJMJpioMNBo5bFb7NrMd1jUbJrGXy99vSgh57D2w0BHG3RlEnawqyRlfAuTihp37sPnlCKX3IlKNg.webp',
                                                      width: 100,
                                                      height: 58,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 3, 0, 0),
                                                    child: Text('배추김치',
                                                        style: TextStyle(
                                                            fontFamily: 'SUITE',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xff212121))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RatingBarIndicator(
                                          itemBuilder: (context, index) => Icon(
                                              Icons.star_rounded,
                                              color: const Color(0xffffd740)),
                                          direction: Axis.horizontal,
                                          rating: 3,
                                          itemCount: 5,
                                          itemSize: 20,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 8, 0),
                                              child: AutoSizeText('열량',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: "SUITE",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff757575))),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 8, 0),
                                              child: AutoSizeText('탄수화물',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: "SUITE",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff757575))),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 8, 0),
                                              child: AutoSizeText('단백질',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: "SUITE",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff757575))),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 8, 0),
                                              child: AutoSizeText('지방',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: "SUITE",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff757575))),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 8, 0),
                                              child: AutoSizeText('645kcal',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: "SUITE",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff757575))),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 8, 0),
                                              child: AutoSizeText('104g',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: "SUITE",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff757575))),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 8, 0),
                                              child: AutoSizeText('29g',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: "SUITE",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff757575))),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 8, 0),
                                              child: AutoSizeText('12g',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: "SUITE",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff757575))),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Icon(
                                        Icons.chevron_right_rounded,
                                        color: Color(0xFF57636C),
                                        size: 24,
                                      ),
                                    ),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
