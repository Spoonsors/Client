import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeenagerViewAllRecipesPageWidget extends StatefulWidget {
  const TeenagerViewAllRecipesPageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerViewAllRecipesPageWidgetState createState() =>
      _TeenagerViewAllRecipesPageWidgetState();
}

class _TeenagerViewAllRecipesPageWidgetState
    extends State<TeenagerViewAllRecipesPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Navigator.pushNamed('TeenagerViewRecipePage');
    });

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
            '모든 레시피 보기',
            style: TextStyle(
              fontFamily: 'SUITE',
              color: const Color(0xff212121),
              fontSize: 22,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: SingleChildScrollView(
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
                          child: Text('현재 등록된 재료 기준으로 정렬합니다',
                              style: TextStyle(
                                  fontFamily: 'SUITE',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff757575))),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          minHeight: 200,
                          maxWidth: 530,
                          maxHeight: 240,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x33000000),
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFF5FBFB),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '참치김치찌개',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xFF101518),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              '쉬움, 30분',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF57636C),
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.more_vert_rounded,
                                      color: Color(0xFF57636C),
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 0),
                                        child: MasonryGridView.count(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          itemCount: 7,
                                          itemBuilder: (context, index) {
                                            return [
                                              () => Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffFF8A80),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          '김치 1컵',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SUITE',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xff212121)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              () => Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffFF8A80),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          '참치캔 1개',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SUITE',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xff212121)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              () => Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffF5F5F5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          '두부 0.5모',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SUITE',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xff212121)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              () => Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffF5F5F5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          '청양고추 1개',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SUITE',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xff212121)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              () => Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffF5F5F5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          '설탕 0.3 숟가락',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SUITE',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xff212121)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              () => Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffF5F5F5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          '고춧가루 0.5 숟가락',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SUITE',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xff212121)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              () => Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffFF8A80),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          '멸치 다시마 육수 450ml',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SUITE',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xff212121)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                            ][index]();
                                          },
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0, 0.96),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24, 0, 24, 0),
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
                                                child: Text("부족한 물품 후원 등록",
                                                    style: TextStyle(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                                      fontWeight:
                                                          FontWeight.normal,
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
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          minHeight: 240,
                          maxWidth: 530,
                          maxHeight: 150,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x33000000),
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFF5FBFB),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '현미 잡곡밥',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xFF101518),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              '쉬움, 10분',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF57636C),
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.more_vert_rounded,
                                      color: Color(0xFF57636C),
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 0),
                                    child: MasonryGridView.count(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return [
                                          () => Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffFF8A80),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '쌀 50g',
                                                      style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff212121)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          () => Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffFF8A80),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '현미 10g',
                                                      style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff212121)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          () => Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '조 10g',
                                                      style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff212121)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          () => Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                ),
                                              ),
                                          () => Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                ),
                                              ),
                                        ][index]();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 530,
                          maxHeight: 200,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x33000000),
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFF5FBFB),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '고등어 무조림',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xFF101518),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              '쉬움, 30분',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF57636C),
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.more_vert_rounded,
                                      color: Color(0xFF57636C),
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 0),
                                    child: MasonryGridView.count(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      itemCount: 7,
                                      itemBuilder: (context, index) {
                                        return [
                                          () => Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffFF8A80),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '고등어 1토막(60g)',
                                                      style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff212121)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          () => Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffFF8A80),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '무 20g',
                                                      style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff212121)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          () => Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '고추장 20g',
                                                      style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff212121)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          () => Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '간장 17g',
                                                      style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff212121)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          () => Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '다진 마늘 2g',
                                                      style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff212121)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          () => Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '청고추',
                                                      style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff212121)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          () => Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffFF8A80),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '홍고추',
                                                      style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff212121)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        ][index]();
                                      },
                                    ),
                                  ),
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
          ),
        ),
      ),
    );
  }
}
