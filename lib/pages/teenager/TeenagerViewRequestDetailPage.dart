import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/PostModel.dart';
import '../../model/SponModel.dart';
import '../../models/TeenagerViewRequestDetailPageModel.dart';

//viewPost
class TeenagerViewRequestDetailPageWidget extends StatefulWidget {
  const TeenagerViewRequestDetailPageWidget({super.key, required this.request});

  final Post request;

  @override
  _TeenagerViewRequestDetailPageWidgetState createState() =>
      _TeenagerViewRequestDetailPageWidgetState();
}

class _TeenagerViewRequestDetailPageWidgetState
    extends State<TeenagerViewRequestDetailPageWidget> {
  late TeenagerViewRequestDetailPageModel _model;
  late Post _request;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = TeenagerViewRequestDetailPageModel();
    _request = widget.request;
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
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        iconTheme: IconThemeData(color: const Color(0xff212121)),
        automaticallyImplyLeading: true,
        title: Text(
          '후원  정보',
          style: TextStyle(
            fontFamily: 'SUITE',
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/익명.png',
                                    //bMember의 사진으로 변경 필요
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _request.bMember.bMember_Nickname,
                                        style: TextStyle(
                                          fontFamily: 'SUITE',
                                          fontSize: 16,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 3, 0, 0),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: DateFormat('yyyy/MM/dd')
                                                    .format(_request.post_date),
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: ' | ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: DateFormat('hh:mm')
                                                    .format(_request.post_date),
                                                style: TextStyle(),
                                              ),
                                              // TextSpan(
                                              //   text: ' | ',
                                              //   style: TextStyle(),
                                              // ),
                                              // TextSpan(
                                              //   text: '닉네임',
                                              //   style: TextStyle(),
                                              // )
                                            ],
                                            style: TextStyle(
                                              fontFamily: 'SUITE',
                                              color: const Color(0xff757575),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              _request.post_title,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'SUITE',
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff212121)),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              _request.post_txt,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'SUITE',
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff757575)),
                            ),
                          ),
                          Divider(
                            height: 32,
                            thickness: 1,
                            color: const Color(0xffe0e0e0),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              '필요한 식재료 (체크 표시는 이미 후원이 완료된 상품입니다)',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'SUITE',
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff757575)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: _request.spon.length,
                          itemBuilder: (context, index) {
                            final _spon = _request.spon[index];
                            return IngredientImageCard(spon: _spon, idx: index);
                          }),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            height: 32,
                            thickness: 1,
                            color: const Color(0xffe0e0e0),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              '만들 음식 (${_request.menu_name})',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'SUITE',
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff757575)),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                _request.menu_img,
                                width: MediaQuery.sizeOf(context).width,
                                height: 230,
                                fit: BoxFit.cover,
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
        ],
      ),
    );
  }
}

class IngredientImageCard extends StatelessWidget {
  const IngredientImageCard({super.key, required this.spon, required this.idx});

  final Spon spon;
  final int idx;

  @override
  Widget build(BuildContext context) {
    if (spon.spon_state == 0) {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xffffb74d),
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Container(
                      width: 70,
                      height: 70,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        spon.ingredients.ingredients_image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Text(
                spon.ingredients.ingredients_name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lexend Deca',
                  color: const Color(0xff757575),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xffffb74d),
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Container(
                      width: 70,
                      height: 70,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        spon.ingredients.ingredients_image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xB3FFFFFF),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: const Color(0xff4CAF50),
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Text(
                spon.ingredients.ingredients_name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lexend Deca',
                  color: const Color(0xff757575),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
