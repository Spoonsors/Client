import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeenagerViewRecipePageWidget extends StatefulWidget {
  const TeenagerViewRecipePageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerViewRecipePageWidgetState createState() =>
      _TeenagerViewRecipePageWidgetState();
}

class _TeenagerViewRecipePageWidgetState
    extends State<TeenagerViewRecipePageWidget> {
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
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Navigator.pushNamed('TeenagerWriteRequestPage');
          },
          backgroundColor: const Color(0xffffb74d),
          icon: FaIcon(
            FontAwesomeIcons.pen,
            size: 20,
          ),
          elevation: 8,
          label: Text(
            '후원 요청하기',
            style: TextStyle(
              fontFamily: 'SUITE',
              color: const Color(0xffFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          iconTheme: IconThemeData(color: const Color(0xff212121)),
          automaticallyImplyLeading: true,
          title: Text(
            '레시피 상세',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              color: Color(0xFF15161E),
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.network(
                      'data:image/jpeg;base64,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',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, -0.13),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: Color(0x9AFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Icon(
                          Icons.play_arrow,
                          color: const Color(0xff),
                          size: 44,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Text(
                '고등어 무조림',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF15161E),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xffff8a80),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xffff8a80),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Text(
                            '고등어1토막(60g)',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF15161E),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xffff8a80),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xffff8a80),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Text(
                            '무 20g',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF15161E),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xfff5f5f5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Text(
                            '고추장 20g',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF15161E),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xfff5f5f5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Text(
                            '간장 17g',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF15161E),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xfff5f5f5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Text(
                            '다진 마늘 2g',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF15161E),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xfff5f5f5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Text(
                            '청고추',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF15161E),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xffff8a80),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xffff8a80),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Text(
                            '홍고추',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF15161E),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
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
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Text(
                '조리 순서',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  color: Color(0xFF15161E),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.5,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: 100,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        '1. 고등어를 물에 씻어서 5cm정도 크기로 토막을 낸다.',
                                        style: TextStyle(
                                          fontFamily: 'SUITE',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://static.wtable.co.kr/image/production/service/recipe/357/94293e63-0397-4966-b8fa-ccbfd5d4d2d5.jpg?size=800x800',
                                  width: 160,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: 100,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        '2. 냄비에 먹기 좋게 썬 무를 깔고 고등어를 넣는다.',
                                        style: TextStyle(
                                          fontFamily: 'SUITE',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNjExMDRfMTIg%2FMDAxNDc4MjQzNTc4Mzg4.EFNg3PskaP4UsqVi236Koh5lG_fRkY5iBm2i4EgIRtog.RCLFMhucUMt2EelfyYTgDTj-WR9CFRrTuWGAlVwKi24g.JPEG.hnn888%2FIMG_2563.JPG&type=a340',
                                  width: 160,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: 100,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        '3. 양념장(고추장, 간장, 다진 마늘)을 넣는다.',
                                        style: TextStyle(
                                          fontFamily: 'SUITE',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA0MTRfMjYw%2FMDAxNjgxNDUxODkwMjc0.hHJ9MeD9UGrhgxbjFFs-5GN70zk3IOhHWmrr1eLgQecg.omKDtKkOVWeClpa1OYY-oS73SPxVhC-rO1UCu9fRAokg.JPEG.tr0820%2FKakaoTalk_20230414_143900871_17.jpg&type=a340',
                                  width: 160,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: 100,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        '4. 청고추, 홍고추를 넣고 약한 불로 조린다.',
                                        style: TextStyle(
                                          fontFamily: 'SUITE',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMzFfMTY3%2FMDAxNjgwMjc0Nzg0NTk2.eM_F6cUJusspv4VKndAjZUphLBvhll_JFD48bVKXdZIg.9iTv08oEUivzcnl2rqpcvy5dqJSrV-1nI0uvsA9MLmkg.JPEG.museok27%2F5K7A0083.JPG&type=a340',
                                  width: 160,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
