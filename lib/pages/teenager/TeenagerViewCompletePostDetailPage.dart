import 'package:flutter/material.dart';
import 'package:save_children_v01/model/PostModel.dart';

import '../../etc/Colors.dart';
import '../../etc/TextStyles.dart';
import '../../model/ReviewModel.dart';
import '../../model/SponModel.dart';

class TeenagerViewCompletePostDetailPageWidget extends StatelessWidget {
  const TeenagerViewCompletePostDetailPageWidget(
      {super.key, required this.post, required this.review});
  final Post post;
  final Review review;
  @override
  Widget build(BuildContext context) {
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                                  child: Image.network(
                                    post.menuImg!,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        post.bmember!.bMember_nickname!,
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
                                          child: Text(
                                            post.postDate!,
                                            style: labelMedium,
                                          )),
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
                              post.postTitle!,
                              style: headlineSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              post.postTxt!,
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
                    post.hasReview == 0
                        ? Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                '후기가 존재하지 않습니다.',
                                style: TextStyle(
                                    color: primary,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'SUITE',
                                    fontSize: 18.0),
                              ),
                            ),
                          )
                        : Padding(
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
                                    '${post.bmember!.bMember_nickname!}로부터의 후기가 도착했어요!',
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
                                      review.review_img!,
                                      width: MediaQuery.sizeOf(context).width *
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
                                    review.review_txt!,
                                    style: bodyLarge,
                                  ),
                                ),
                                Text(
                                  review.review_date!,
                                  style: bodySmall,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: post.spon!.length != 0
                                  ? ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: post.spon!.length,
                                      itemBuilder: (context, index) {
                                        return TeenagerViewCompleltePostListItem(
                                            spon: post.spon![index]);
                                      },
                                    )
                                  : Container(child: Text("후원이 없습니다."))),
                        ),
                      ],
                    )
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

class TeenagerViewCompleltePostListItem extends StatelessWidget {
  const TeenagerViewCompleltePostListItem({super.key, required this.spon});
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
                    child: Image.network(
                      'https://i.namu.wiki/i/y1vEkfKabfcqbF-qZ79SHA1UTT8j4V2VHltkcy5zXhz_bXaTYm_z3JRJikOf616oLd8ldnjQTYTV2wYneZabsg.webp',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Text('후원자1', textAlign: TextAlign.center, style: bodySmall),
          ),
        ],
      ),
    );
  }
}
