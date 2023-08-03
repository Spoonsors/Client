import 'package:flutter/material.dart';

import '../../models/TeenagerViewReviewsPageModel.dart';

class TeenagerViewReviewsPageWidget extends StatefulWidget {
  const TeenagerViewReviewsPageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerViewReviewsPageWidgetState createState() =>
      _TeenagerViewReviewsPageWidgetState();
}

class _TeenagerViewReviewsPageWidgetState
    extends State<TeenagerViewReviewsPageWidget> {
  late TeenagerViewReviewsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = TeenagerViewReviewsPageModel();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        automaticallyImplyLeading: false,
        title: Text(
          '내가 쓴 감사글',
          style: TextStyle(
            fontFamily: 'SUITE',
            color: const Color(0xff212121),
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x39000000),
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 16, 12, 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Text(
                              '20',
                              style: TextStyle(
                                fontFamily: 'SUITE',
                                fontSize: 28,
                              ),
                            ),
                          ),
                          Text(
                            '작성한 글 수',
                            style: TextStyle(
                                color: const Color(0xff757575),
                                fontFamily: "SUITE",
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  width: MediaQuery.sizeOf(context).width * 0.96,
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                child: Text(
                                  '첫 고등어 무조림!',
                                  style: TextStyle(
                                      color: const Color(0xff212121),
                                      fontFamily: "SUITE",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                '보내주신 고등어와 홍고추로 만들었습니다!\n후원 감사합니다!',
                                style: TextStyle(
                                    color: const Color(0xff757575),
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/고등어무조림.jpeg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  width: MediaQuery.sizeOf(context).width * 0.96,
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                child: Text(
                                  '된장찌개',
                                  style: TextStyle(
                                      color: const Color(0xff212121),
                                      fontFamily: "SUITE",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                '두부, 애호방등으로 만들었어요!\n감사합니다~',
                                style: TextStyle(
                                    color: const Color(0xff757575),
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/된장찌개.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
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
    );
  }
}
