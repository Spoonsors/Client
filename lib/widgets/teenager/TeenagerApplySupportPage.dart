import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeenagerApplySupportPageWidget extends StatefulWidget {
  const TeenagerApplySupportPageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerApplySupportPageWidgetState createState() =>
      _TeenagerApplySupportPageWidgetState();
}

class _TeenagerApplySupportPageWidgetState
    extends State<TeenagerApplySupportPageWidget> {
  final _countList = ['1', '2', '3'];
  var _selectedCount = '1';
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
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        iconTheme: IconThemeData(color: const Color(0xff212121)),
        automaticallyImplyLeading: true,
        title: Text(
          '후원 물품 등록',
          style: TextStyle(
              fontFamily: "SUITE",
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: const Color(0xffFFFFFF)),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Align(
        alignment: AlignmentDirectional(0, -1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 24),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 750,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff757575),
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
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '후원이 필요한 물품',
                              style: TextStyle(
                                  fontFamily: "SUITE",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffFFFFFF)),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                              child: Text(
                                '이미 있거나, 필요없는 경우 물품을 제외해주세요.',
                                style: TextStyle(
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575)),
                              ),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF5F5F5),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 0,
                                          color: const Color(0xffE0E0E0),
                                          offset: Offset(0, 1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 1, 1, 1),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.network(
                                                    'https://img-cf.kurly.com/shop/data/goods/1657695159250z0.jpg',
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '김치',
                                                        style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      10, 0, 0),
                                                          child: DropdownButton(
                                                              value:
                                                                  _selectedCount,
                                                              items: _countList
                                                                  .map(
                                                                (value) {
                                                                  return DropdownMenuItem(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value),
                                                                  );
                                                                },
                                                              ).toList(),
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  _selectedCount =
                                                                      value!;
                                                                });
                                                              })),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  '1500원',
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontFamily: 'SUITE',
                                                    fontSize: 22,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 8, 12),
                                          child: AutoSizeText(
                                            'CJ제일제당 비비고 썰은 배추김치 100g',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: "SUITE",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff757575)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.delete_outline,
                                                color: const Color(0xffF44336),
                                                size: 24,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Text(
                                                  '제외',
                                                  style: TextStyle(
                                                    fontFamily: 'SUITE',
                                                    color:
                                                        const Color(0xffF44336),
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF5F5F5),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 0,
                                          color: const Color(0xffE0E0E0),
                                          offset: Offset(0, 1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 1, 1, 1),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.network(
                                                    'https://shopping-phinf.pstatic.net/main_8095458/8095458474.20230201144839.jpg?type=f640',
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '스팸 (기프티콘)',
                                                        style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      10, 0, 0),
                                                          child: DropdownButton(
                                                              value:
                                                                  _selectedCount,
                                                              items: _countList
                                                                  .map(
                                                                (value) {
                                                                  return DropdownMenuItem(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value),
                                                                  );
                                                                },
                                                              ).toList(),
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  _selectedCount =
                                                                      value!;
                                                                });
                                                              })),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  '2700원',
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontFamily: 'SUITE',
                                                    fontSize: 22,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 8, 12),
                                          child: AutoSizeText(
                                            'CJ제일제당 스팸 클래식 340g',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: "SUITE",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff757575)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.delete_outline,
                                                color: const Color(0xffF44336),
                                                size: 24,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Text(
                                                  '제외',
                                                  style: TextStyle(
                                                    fontFamily: 'SUITE',
                                                    color:
                                                        const Color(0xffF44336),
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF5F5F5),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 0,
                                          color: const Color(0xffE0E0E0),
                                          offset: Offset(0, 1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 1, 1, 1),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.network(
                                                    'https://shopping-phinf.pstatic.net/main_1360439/13604394521.20180404173431.jpg?type=f640',
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '사골곰탕',
                                                        style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    0, 0),
                                                        child: DropdownButton(
                                                            value:
                                                                _selectedCount,
                                                            items:
                                                                _countList.map(
                                                              (value) {
                                                                return DropdownMenuItem(
                                                                  value: value,
                                                                  child: Text(
                                                                      value),
                                                                );
                                                              },
                                                            ).toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _selectedCount =
                                                                    value!;
                                                              });
                                                            }),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  '1000원',
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontFamily: 'SUITE',
                                                    fontSize: 22,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 8, 12),
                                          child: AutoSizeText(
                                            'CJ제일제당 비비고 사골곰탕 300g',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: "SUITE",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff757575)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.delete_outline,
                                                color: const Color(0xffF44336),
                                                size: 24,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Text(
                                                  '제외',
                                                  style: TextStyle(
                                                    fontFamily: 'SUITE',
                                                    color:
                                                        const Color(0xffF44336),
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 430,
                      ),
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
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '후원 예정 금액',
                              style: TextStyle(
                                  fontFamily: "SUITE",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffFFFFFF)),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                              child: Text(
                                '물품이 모두 후원되지 않을  수도 있습니다. \n시간을 갖고 후원을 기다려주세요!\n후원이 너무 오지 않는다면, 문의해주시기 바랍니다.',
                                style: TextStyle(
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575)),
                              ),
                            ),
                            Divider(
                              height: 32,
                              thickness: 2,
                              color: const Color(0xffE0E0E0),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Total',
                                              style: TextStyle(
                                                fontFamily: 'Outfit',
                                                color: const Color(0xff757575),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Icon(
                                              Icons.info_outlined,
                                              color: const Color(0xff757575),
                                              size: 18,
                                            )
                                          ],
                                        ),
                                        Text(
                                          '5200원',
                                          style: TextStyle(
                                              fontFamily: 'SUITE',
                                              fontSize: 36,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff212121)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                child: Text('후원 물품 등록'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  elevation: 1,
                                  side: BorderSide(
                                      width: 1, color: Colors.transparent),
                                  backgroundColor: const Color(0xffFFB74D),
                                  textStyle:
                                      TextStyle(color: const Color(0xff2196F3)),
                                )),
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
    );
  }
}
