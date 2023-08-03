import 'package:flutter/material.dart';
import '../../components/teenagerAddIngredientPop.dart';
import '../../models/TeenagerViewRefrigeratorPageModel.dart';

class TeenagerViewRefrigeratorPageWidget extends StatefulWidget {
  const TeenagerViewRefrigeratorPageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerViewRefrigeratorPageWidgetState createState() =>
      _TeenagerViewRefrigeratorPageWidgetState();
}

class _TeenagerViewRefrigeratorPageWidgetState
    extends State<TeenagerViewRefrigeratorPageWidget> {
  late TeenagerViewRefrigeratorPageModel _model;
  @override
  void initState() {
    super.initState();
    _model = TeenagerViewRefrigeratorPageModel();
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
        floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: Colors.transparent),
              borderRadius: BorderRadius.circular(100)),
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: TeenagerAddIngredientPopWidget(),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          },
          backgroundColor: const Color(0xffFFB74D),
          icon: Icon(
            Icons.add_rounded,
            color: const Color(0xffffffff),
          ),
          elevation: 8,
          label: Text(
            '재료추가',
            style: TextStyle(
              fontFamily: 'SUITE',
              color: const Color(0xffFFFFFF),
              fontSize: 20,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          automaticallyImplyLeading: false,
          title: Text(
            '나의 냉장고',
            style: TextStyle(
              fontFamily: 'SUITE',
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: TabBar(
                  labelColor: const Color(0xff212121),
                  unselectedLabelColor: const Color(0xff757575),
                  labelStyle: TextStyle(
                    fontFamily: "Primary Family",
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  indicatorColor: const Color(0xffFFB74D),
                  tabs: [
                    Tab(
                      text: '냉장',
                    ),
                    Tab(
                      text: '냉동/실온',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: GridView(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 0.7,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Container(
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
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0xFFE0E3E7),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                'assets/images/돼지고기.jpeg',
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.1,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                '돼지고기',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'D-3\n',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xffFF4081),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '~2023.07.09',
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
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
                                Container(
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
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0xFFE0E3E7),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                'assets/images/대파.jpeg',
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.1,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                '대파',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'D-4\n',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF4B39EF),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '~2023.07.09',
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
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
                                Container(
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
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0xFFE0E3E7),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                'assets/images/다진마늘.jpeg',
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.1,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                '다진마늘',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'D-10\n',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF4B39EF),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '~2023.07.09',
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
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
                                Container(
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
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0xFFE0E3E7),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                'assets/images/계란.jpg',
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.1,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                '계란',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'D-3\n',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF4B39EF),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '~2023.07.09',
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
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
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: GridView(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 0.7,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Container(
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
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0xFFE0E3E7),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                'assets/images/닭가슴살(냉동).jpeg',
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.1,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                '닭가슴살(냉동)',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'D-3\n',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xffFF4081),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '~2023.07.09',
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
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
                                Container(
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
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0xFFE0E3E7),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                'assets/images/햄_스팸.jpg',
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.1,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                '스팸 클래식',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'D-365\n',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF4B39EF),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '~2023.07.09',
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
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
                      ],
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
