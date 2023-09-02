import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/service/CheckMyReviewService.dart';
import 'package:save_children_v01/service/LoginService.dart';

import '../../etc/Colors.dart';

class SupporterReviewPageWidget extends StatelessWidget {
  const SupporterReviewPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var sId = context.read<LoginService>().loginS.smemberId;
    context.read<CheckMyReviewService>().getAllServicesInfo(sId!);

    return Consumer<CheckMyReviewService>(
        builder: (context, checkMyReviewService, child) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: primaryText),
          title: Text('받은 감사글'),
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: checkMyReviewService.items.length,
          itemBuilder: (BuildContext context, int index) {
            return SupportReviewPostListItem(
              checkMyReviewModel: checkMyReviewService.items[index],
            );
          },
        ),
      );
    });
  }
}

class SupportReviewPostListItem extends StatelessWidget {
  const SupportReviewPostListItem(
      {super.key, required this.checkMyReviewModel});

  final CheckMyReviewModel checkMyReviewModel;

  @override
  Widget build(BuildContext context) {
    DateTime dt =
        new DateFormat('yyyy-mm-dd').parse(checkMyReviewModel.writeDate!);

    String d1 = DateFormat('yyyy-mm-dd').format(dt);
    String d2 = DateFormat('hh:mm a').format(dt);

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
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
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 10.0),
                      child: Text(
                        '${checkMyReviewModel.reviewTxt}',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: secondaryText,
                            fontFamily: 'SUITE'),
                      ),
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
                                    text:
                                        '${checkMyReviewModel.writerNickname}',
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: ' | ',
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: '${d1}',
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
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  '${checkMyReviewModel.reviewImg}',
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
