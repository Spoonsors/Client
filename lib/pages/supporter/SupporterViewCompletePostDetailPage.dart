import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/service/ViewPostingService.dart';

import '../../etc/Colors.dart';
import '../../etc/TextStyles.dart';

class SupporterViewCompletePostDetailPageWidget extends StatefulWidget {
  const SupporterViewCompletePostDetailPageWidget({super.key});

  @override
  State<SupporterViewCompletePostDetailPageWidget> createState() =>
      _SupporterViewCompletePostDetailPageWidgetState();
}

class _SupporterViewCompletePostDetailPageWidgetState
    extends State<SupporterViewCompletePostDetailPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ViewPostingService>(
        builder: (context, viewPostingService, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('후원 정보 및 후원 감사글 보기'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 4.0, 4.0, 4.0),
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: viewPostingService
                                                .nowView.bmember?.profilePath ==
                                            null
                                        ? Image.asset(
                                            'assets/images/user.png',
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            '${viewPostingService.nowView.bmember!.profilePath}',
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${viewPostingService.nowView.bmember!.bmemberNickname}',
                                          style: TextStyle(
                                            color: primaryText,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'SUITE',
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 0.0),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '${DateFormat('yyyy-mm-dd').format(new DateFormat('yyyy-mm-dd').parse(viewPostingService.nowView.postDate!))}',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: ' | ',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '${DateFormat('hh:mm a').format(new DateFormat('yyyy-mm-dd').parse(viewPostingService.nowView.postDate!))}',
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style: labelMedium,
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                '${viewPostingService.nowView.postTitle}',
                                style: headlineSmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                '${viewPostingService.nowView.postTxt}',
                                style: bodyLarge,
                              ),
                            ),
                            Divider(
                              height: 32.0,
                              thickness: 1.0,
                              color: alternate,
                            ),
                          ],
                        ),
                      ),
                      viewPostingService.nowView.hasReview == 1
                          ? Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      '${viewPostingService.nowView.bmember!.bmemberNickname}로부터의 후기가 도착했어요!',
                                      style: TextStyle(
                                          color: primary,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'SUITE',
                                          fontSize: 18.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        '${viewPostingService.review!.reviewImg}',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 230.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: Text(
                                      '${viewPostingService.review!.reviewTxt}',
                                      style: bodyLarge,
                                    ),
                                  ),
                                  Text(
                                    '${DateFormat('yyyy-mm-dd').format(new DateFormat('yyyy-mm-dd').parse(viewPostingService.review!.reviewDate!))}',
                                    style: bodySmall,
                                  ),
                                  Divider(
                                    height: 32.0,
                                    thickness: 1.0,
                                    color: alternate,
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 230,
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: alternate,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "아직 작성된 리뷰가 없습니다.",
                                        style: labelLarge,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 32.0,
                                    thickness: 1.0,
                                    color: alternate,
                                  ),
                                ],
                              ),
                            ),

                      // Generated code for this Column Widget...
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Thanks to',
                              textAlign: TextAlign.center,
                              style: bodyLarge,
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      viewPostingService.nowView.spon!.length,
                                  itemBuilder: (context, index) {
                                    if (viewPostingService
                                            .nowView.spon?[index].smember !=
                                        null) {
                                      return supporterViewCompleltePostListItem(
                                          spon: viewPostingService
                                              .nowView.spon![index]);
                                    }
                                  }),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: alternate,
                    fixedSize: Size(double.infinity, 55.0),
                  ),
                  child: Text(
                    '이미 완료된 후원입니다.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      fontFamily: 'SUITE',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class supporterViewCompleltePostListItem extends StatelessWidget {
  const supporterViewCompleltePostListItem({super.key, required this.spon});

  final Spon spon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 6.0, 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: primary,
                width: 1.0,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                  child: Container(
                    width: 70.0,
                    height: 70.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: (spon.smember?.profilePath != null)
                        ? Image.asset(
                            '${spon.smember!.profilePath}',
                            fit: BoxFit.cover,
                          )
                        : Container(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Text('${spon.smember!.smemberNickname}',
                textAlign: TextAlign.center, style: bodySmall),
          ),
        ],
      ),
    );
  }
}
