import 'package:flutter/material.dart';

import '../../etc/Colors.dart';
import '../../etc/TextStyles.dart';

class SupporterReviewPageWidget extends StatelessWidget {
  const SupporterReviewPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryText),
        title: Text('받은 감사글'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          SupportReviewPostListItem(),
        ],
      ),
    );
  }
}

class SupportReviewPostListItem extends StatelessWidget {
  const SupportReviewPostListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        width: MediaQuery.sizeOf(context).width * 0.96,
        decoration: BoxDecoration(
          color: secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
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
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '비빔밥',
                        style: titleLarge,
                      ),
                    ),
                    Text(
                      '계란, 나물 등으로 만들었어요!\n감사합니다~',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: secondaryText,
                          fontFamily: 'SUITE'),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '닉네임2',
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: ' | ',
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: '2023.07.17',
                                    style: TextStyle(),
                                  )
                                ],
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  color: secondaryText,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '후원상품',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: ' | ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: '계란',
                                  style: TextStyle(),
                                )
                              ],
                              style: TextStyle(
                                  fontFamily: 'SUITE',
                                  color: secondaryText,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://cdn.bonif.co.kr/cmdt/20220628_qRJ_1656371947942_631Kb.jpg',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
