import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeenagerViewHomePageWidget extends StatefulWidget {
  const TeenagerViewHomePageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerViewHomePageWidgetState createState() =>
      _TeenagerViewHomePageWidgetState();
}

class _TeenagerViewHomePageWidgetState extends State<TeenagerViewHomePageWidget>
    with TickerProviderStateMixin {
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
        backgroundColor: const Color(0xffFFFFFF),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Navigator.pushNamed('TeenagerViewAllRecipesPage');
          },
          backgroundColor: const Color(0xffFFB74D),
          icon: Icon(
            Icons.search,
            size: 20,
          ),
          elevation: 8,
          label: Text(
            '모든 레시피 보기',
            style: TextStyle(
              fontFamily: 'SUITE',
              color: const Color(0xffFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.8, 0),
                        child: Text(
                          '오늘의 추천 식단',
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pushNamed('TeenagerViewDietsPage');
                        },
                        child: Text(
                          '모든 식단 보기 >',
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x3D0F1113),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 140,
                                    height: 100,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            'data:image/jpeg;base64,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',
                                            width: 140,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          '흑미밥',
                                          style: TextStyle(
                                            fontFamily: 'SUITE',
                                            color: const Color(0xff212121),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 140,
                                    height: 100,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            'https://recipe1.ezmember.co.kr/cache/recipe/2015/05/26/0f8250454a50b4a0c57c6349fc2e06751.jpg',
                                            width: 140,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          '굴미역국',
                                          style: TextStyle(
                                            fontFamily: 'SUITE',
                                            color: const Color(0xff212121),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 140,
                                    height: 100,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            'https://previews.123rf.com/images/alexbaidj/alexbaidj1407/alexbaidj140700002/30017615-%EA%B5%AC%EC%9A%B4-%EB%8B%AD-%EA%B0%80%EC%8A%B4%EC%82%B4-%EA%B5%AC%EC%9D%B4-%EB%A7%88%EB%8A%98.jpg',
                                            width: 140,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          '닭가슴살 마늘구이',
                                          style: TextStyle(
                                            fontFamily: 'SUITE',
                                            color: const Color(0xff212121),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 140,
                                    height: 100,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            'https://recipe1.ezmember.co.kr/cache/recipe/2015/11/05/5d82686ecf18303a78383b4f82981d471.jpg',
                                            width: 140,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          '멸치 아몬드 볶음',
                                          style: TextStyle(
                                            fontFamily: 'SUITE',
                                            color: const Color(0xff212121),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 6),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RatingBarIndicator(
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: const Color(0xffFFD740),
                                          ),
                                          direction: Axis.horizontal,
                                          rating: 3,
                                          itemCount: 5,
                                          itemSize: 20,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '30분',
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF14181B),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '쉬움',
                                          style: TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '열량',
                                      style: TextStyle(
                                          fontFamily: 'Primary Family',
                                          color: const Color(0xff212121),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '탄수화물',
                                      style: TextStyle(
                                          fontFamily: 'Primary Family',
                                          color: const Color(0xff212121),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '단백질',
                                      style: TextStyle(
                                          fontFamily: 'Primary Family',
                                          color: const Color(0xff212121),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '지방',
                                      style: TextStyle(
                                          fontFamily: 'Primary Family',
                                          color: const Color(0xff212121),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '850kcal',
                                    style: TextStyle(
                                        fontFamily: 'Primary Family',
                                        color: const Color(0xff212121),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '127g',
                                    style: TextStyle(
                                        fontFamily: 'Primary Family',
                                        color: const Color(0xff212121),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '50g',
                                    style: TextStyle(
                                        fontFamily: 'Primary Family',
                                        color: const Color(0xff212121),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '32g',
                                    style: TextStyle(
                                        fontFamily: 'Primary Family',
                                        color: const Color(0xff212121),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x3D0F1113),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pushNamed('TeenagerViewRecipePage');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 140,
                                      height: 100,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              'https://recipe1.ezmember.co.kr/cache/recipe/2019/01/02/c870febc131bbb66f2bd174959695bb41.jpg',
                                              width: 140,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            '차조밥',
                                            style: TextStyle(
                                              fontFamily: 'SUITE',
                                              color: const Color(0xff212121),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 140,
                                      height: 100,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              'https://recipe1.ezmember.co.kr/cache/recipe/2018/10/21/b1a3f537aadca6e12f45b21aaca2a7981.jpg',
                                              width: 140,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            '콩나물국',
                                            style: TextStyle(
                                              fontFamily: 'SUITE',
                                              color: const Color(0xff212121),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 140,
                                      height: 100,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              'https://recipe1.ezmember.co.kr/cache/recipe/2016/03/16/4b2ad9b10dd6253ae2236658bab43b0b1.jpg',
                                              width: 140,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            '달걀채소말이',
                                            style: TextStyle(
                                              fontFamily: 'SUITE',
                                              color: const Color(0xff212121),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 140,
                                      height: 100,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              'https://i.namu.wiki/i/3u7KQ8jVXWJMJpioMNBo5bFb7NrMd1jUbJrGXy99vSgh57D2w0BHG3RlEnawqyRlfAuTihp37sPnlCKX3IlKNg.webp',
                                              width: 140,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            '배추김치',
                                            style: TextStyle(
                                              fontFamily: 'SUITE',
                                              color: const Color(0xff212121),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 6),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          RatingBarIndicator(
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star_rounded,
                                              color: const Color(0xffFFD740),
                                            ),
                                            direction: Axis.horizontal,
                                            rating: 4,
                                            itemCount: 5,
                                            itemSize: 20,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '20분',
                                            style: TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF14181B),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '중간',
                                            style: TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF57636C),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '열량',
                                        style: TextStyle(
                                            fontFamily: 'Primary Family',
                                            color: const Color(0xff212121),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '탄수화물',
                                        style: TextStyle(
                                            fontFamily: 'Primary Family',
                                            color: const Color(0xff212121),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '단백질',
                                        style: TextStyle(
                                            fontFamily: 'Primary Family',
                                            color: const Color(0xff212121),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '지방',
                                        style: TextStyle(
                                            fontFamily: 'Primary Family',
                                            color: const Color(0xff212121),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '645kcal',
                                      style: TextStyle(
                                          fontFamily: 'Primary Family',
                                          color: const Color(0xff212121),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '104g',
                                      style: TextStyle(
                                          fontFamily: 'Primary Family',
                                          color: const Color(0xff212121),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '29g',
                                      style: TextStyle(
                                          fontFamily: 'Primary Family',
                                          color: const Color(0xff212121),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '12g',
                                      style: TextStyle(
                                          fontFamily: 'Primary Family',
                                          color: const Color(0xff212121),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(-0.8, 0),
                    child: Text(
                      '오늘의 추천 레시피',
                      style: TextStyle(
                        fontFamily: 'SUITE',
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 12, 12),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pushNamed('TeenagerViewRecipePage');
                          },
                          child: Container(
                            width: 230,
                            decoration: BoxDecoration(
                              color: const Color(0xffF5F5F5),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x34090F13),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 5, 0, 5),
                                    child: Text(
                                      '제육볶음',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Primary Family',
                                          color: const Color(0xff212121),
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'data:image/jpeg;base64,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',
                                    width: 220,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 6),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          RatingBarIndicator(
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star_rounded,
                                              color: const Color(0xffFFD740),
                                            ),
                                            direction: Axis.horizontal,
                                            rating: 3,
                                            itemCount: 5,
                                            itemSize: 20,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '30분',
                                            style: TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF14181B),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '쉬움',
                                            style: TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF57636C),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0.96),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 24, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () async {
                                            Navigator.pushNamed(
                                                'TeenagerWriteRequestPage');
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff262D34),
                                              side: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              elevation: 2),
                                          child: Text("후원 등록",
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                              )),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            Navigator.pushNamed(
                                                'TeenagerViewRecipePage');
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff4B39EF),
                                              side: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              elevation: 2),
                                          child: Text("레시피 보기",
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 12, 12),
                        child: Container(
                          width: 230,
                          decoration: BoxDecoration(
                            color: const Color(0xffF5F5F5),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x34090F13),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 5, 0, 5),
                                  child: Text(
                                    '김치찌개',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Primary Family',
                                        color: const Color(0xff212121),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://i.namu.wiki/i/8drgvI-cQLUfJDC00zbl2ZolK4W3o4ZkVSpR-zM5FZk_QzT58vYnx_7ohk0qwGYYiSLPiZgwccyIEFUtYKDjUQ.webp',
                                  width: 220,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 6),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RatingBarIndicator(
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: const Color(0xffFFD740),
                                          ),
                                          direction: Axis.horizontal,
                                          rating: 3,
                                          itemCount: 5,
                                          itemSize: 20,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '15분',
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF14181B),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '아주 쉬움',
                                          style: TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0.96),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          Navigator.pushNamed(
                                              'TeenagerWriteRequestPage');
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff262D34),
                                            side: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            elevation: 2),
                                        child: Text("후원 등록",
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                            )),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          Navigator.pushNamed(
                                              'TeenagerViewRecipePage');
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff4B39EF),
                                            side: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            elevation: 2),
                                        child: Text("레시피 보기",
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                            )),
                                      ),
                                    ],
                                  ),
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
          ),
        ),
      ),
    );
  }
}
