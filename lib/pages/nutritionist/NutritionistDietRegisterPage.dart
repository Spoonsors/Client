import 'package:flutter/material.dart';

import '../../components/nutritionistDietAddFoodBottomSheet.dart';
import '../../etc/Colors.dart';

class NutritionistDietRegisterPageWidget extends StatefulWidget {
  const NutritionistDietRegisterPageWidget({super.key});

  @override
  State<NutritionistDietRegisterPageWidget> createState() =>
      _NutritionistDietRegisterPageWidgetState();
}

class _NutritionistDietRegisterPageWidgetState
    extends State<NutritionistDietRegisterPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryText),
        title: Text(
          '식단 등록하기',
        ),
        actions: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: Text(
                '완료',
                style: TextStyle(
                  fontFamily: 'SUITE',
                  color: secondaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 162.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://img-cf.kurly.com/shop/data/goodsview/20191213/gv10000072801_1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
              child: TextFormField(
                obscureText: false,
                decoration: InputDecoration(
                  hintText: '식단명을 입력해주세요.',
                  hintStyle: TextStyle(
                    fontFamily: 'SUITE',
                    color: secondaryText,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: primaryText,
                  fontFamily: 'SUITE',
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '열량',
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: secondaryText,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '200kcal',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            color: primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '단백질',
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: secondaryText,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '10g',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            color: primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '탄수화물',
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: secondaryText,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '30g',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            color: primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '지방',
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: secondaryText,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '5g',
                        style: TextStyle(
                            fontFamily: 'SUITE',
                            color: primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2.0,
              color: alternate,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SelectedFoodWidget(), // TODO : [Nutri] 메뉴 Listview 구현
                  SelectedFoodWidget(),
                  SelectedFoodWidget(),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 15.0),
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: primaryBackground,
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                          width: 0.5,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return NutritionistDietAddFoodBottomSheetWidget();
                              });
                        },
                        child: Icon(
                          Icons.add_rounded,
                          color: Color(0xE2757575),
                          size: 35.0,
                        ),
                      ),
                    ),
                  ), // TODO : [Nutri] 메뉴 추가 버튼 구현
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedFoodWidget extends StatelessWidget {
  const SelectedFoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.network(
                        'https://img-cf.kurly.com/shop/data/goodsview/20191213/gv10000072801_1.jpg',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '고등어구이 (200g)',
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            fontSize: 17.0,
                            color: primaryText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 1.0, 0.0, 1.0),
                                  child: Text(
                                    '탄수화물 30g, 단백질 13g, 지방 3g',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'SUITE',
                                      fontSize: 12.0,
                                      color: secondaryText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  '379kcal',
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    color: secondaryText,
                                    fontSize: 12.0,
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
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 2.5, 5.0),
                  child: OutlinedButton(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    child: Text(
                      '제외',
                      style: TextStyle(
                          color: secondaryText,
                          fontFamily: 'SUITE',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: secondaryText),
                      fixedSize: Size.fromHeight(35.0),
                      backgroundColor: primaryBackground,
                      elevation: 2.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.5, 0.0, 5.0, 5.0),
                  child: FilledButton(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    child: Text(
                      '변경',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SUITE',
                        color: primaryBackground,
                      ),
                    ),
                    style: FilledButton.styleFrom(
                      fixedSize: Size.fromHeight(35.0),
                      backgroundColor: primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
