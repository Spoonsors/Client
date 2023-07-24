import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeenagerVIewSupportsPageWidget extends StatefulWidget {
  const TeenagerVIewSupportsPageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerVIewSupportsPageWidgetState createState() =>
      _TeenagerVIewSupportsPageWidgetState();
}

class _TeenagerVIewSupportsPageWidgetState
    extends State<TeenagerVIewSupportsPageWidget> {
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
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          backgroundColor: const Color(0xfff5f5f5),
          automaticallyImplyLeading: false,
          leading: Icon(
            Icons.arrow_back_rounded,
            color: const Color(0xff212121),
            size: 30,
          ),
          title: Text(
            '수혜 내역 ',
            style: TextStyle(
                fontFamily: "SUITE",
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: const Color(0xff212121)),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(mainAxisSize: MainAxisSize.max, children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 8, 0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: '제품을 검색하세요',
                      labelStyle: TextStyle(
                          fontFamily: 'SUITE',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff212121)),
                      hintStyle: TextStyle(
                          fontFamily: 'SUITE',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff212121)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xffe0e0e0),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xffFFB74D),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xfff44336),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xfff44336),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: const Color(0xffffffff),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                      prefixIcon: Icon(
                        Icons.search,
                        color: const Color(0xff757575),
                        size: 16,
                      ),
                    ),
                    style: TextStyle(
                        fontFamily: "SUITE",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff212121)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 12, 0),
                child: Icon(
                  Icons.search_sharp,
                  color: const Color(0xff212121),
                  size: 30,
                ),
              ),
            ]),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: TabBar(
                          isScrollable: true,
                          labelStyle: TextStyle(
                              fontFamily: "SUITE",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffffb74d)),
                          unselectedLabelStyle: TextStyle(
                              fontFamily: "SUITE",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff757575)),
                          labelColor: const Color(0xffFFB74D),
                          unselectedLabelColor: const Color(0xff757575),
                          labelPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          tabs: [
                            Tab(
                              text: '대기 중인 후원',
                            ),
                            Tab(
                              text: '완료된 후원',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 0, 0),
                                    child: Text(
                                      '대기 중인 후원',
                                      style: TextStyle(
                                          fontFamily: "SUITE",
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff212121)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            Navigator.pushNamed(
                                                'ViewPostDetailPage');
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 4, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '이번에 김치찌개를 만들거에요~',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "SUITE",
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: const Color(
                                                                        0xff212121)),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '안녕하세요, 다음주에 김치찌개를 끓일려는데 , 제일 중요한 김치가 다 떨어졌어요.. 이번에도 잘 부탁드리겠습니다 ㅠㅠ',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'SUITE',
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 6),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: Text(
                                                          '필요한 식재료',
                                                          style: TextStyle(
                                                            fontFamily: 'SUITE',
                                                            color: const Color(
                                                                0xffffb74d),
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '2023.07.16',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: ' | ',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '4:20pm',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: ' | ',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '닉네임',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          color: const Color(
                                                              0xff757575),
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 150,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.91, 0),
                                                            child: Container(
                                                              width: 30,
                                                              height: 30,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                'https://img.danawa.com/prod_img/500000/406/197/img/4197406_1.jpg?_v=20161103141854',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.62, 0),
                                                            child: Container(
                                                              width: 30,
                                                              height: 30,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                'https://i.namu.wiki/i/y1vEkfKabfcqbF-qZ79SHA1UTT8j4V2VHltkcy5zXhz_bXaTYm_z3JRJikOf616oLd8ldnjQTYTV2wYneZabsg.webp',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.35, 0),
                                                            child: Container(
                                                              width: 30,
                                                              height: 30,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                'https://healingfactory.co.kr/data/files/cc7a540d5846dbbfa238bfdf499c2d2b.jpg',
                                                                fit: BoxFit
                                                                    .fitHeight,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {},
                                                        child: Text("후원 완료",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Color(0xffFFB74D),
                                                          side: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                        ))
                                                  ],
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
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 0, 0),
                                    child: Text(
                                      '완료된 후원',
                                      style: TextStyle(
                                          fontFamily: "SUITE",
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff212121)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            Navigator.pushNamed(
                                                'ViewPostDetailPage');
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 4, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '제육볶음',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "SUITE",
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: const Color(
                                                                        0xff212121)),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '안녕하세요, 제육볶음이 먹고 싶습니다. 돼지고기 후원해주시면 감사하겠습니다!',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'SUITE',
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 6),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: Text(
                                                          '모든 후원 완료!',
                                                          style: TextStyle(
                                                            fontFamily: 'SUITE',
                                                            color: const Color(
                                                                0xffffb74d),
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '2023.07.16',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: ' | ',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '4:20pm',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: ' | ',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '닉네임',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          color: const Color(
                                                              0xff757575),
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 3),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                      Icons.message,
                                                      color: const Color(
                                                          0xff757575),
                                                      size: 20,
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        Navigator.pushNamed(
                                                            'TeenagerWriteReviewPage');
                                                      },
                                                      child: Text(
                                                        ' 리뷰 쓰기',
                                                        style: TextStyle(
                                                            fontFamily: "SUITE",
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xff212121)),
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            Navigator.pushNamed(
                                                'ViewPostDetailPage');
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 4, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '현미밥',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "SUITE",
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: const Color(
                                                                        0xff212121)),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '안녕하세요, 맨날 쌀밥만 먹다가 현미밥이 몸에 좋대서 먹어보고 싶습니다. ',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'SUITE',
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 6),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: Text(
                                                          '모든 후원 완료!',
                                                          style: TextStyle(
                                                            fontFamily: 'SUITE',
                                                            color: const Color(
                                                                0xffffb74d),
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '2023.07.13',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: ' | ',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '1:30pm',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: ' | ',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '닉네임',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          color: const Color(
                                                              0xff757575),
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 3),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      ' 리뷰 작성 완료',
                                                      style: TextStyle(
                                                          fontFamily: "SUITE",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff212121)),
                                                    ),
                                                  ],
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
    );
  }
}
