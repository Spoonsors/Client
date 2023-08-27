import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/service/LoginService.dart';
import 'package:save_children_v01/service/ReviewsService.dart';

import '../../model/ReviewModel.dart';
import '../../models/TeenagerViewReviewsPageModel.dart';

//findMyReview

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
    return Consumer2<ReviewsService, LoginService>(
        builder: (context, reviewsService, loginservice, child) {
      reviewsService.getMyReviews(loginservice.loginB.bMember_id!);
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
                                '${reviewsService.reviewsList.length}',
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
                SingleChildScrollView(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: reviewsService.reviewsList.length,
                      itemBuilder: (context, index) {
                        final _review = reviewsService.reviewsList[index];
                        return ReviewCard(
                          idx: index,
                          review: _review,
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review, required this.idx});

  final Review review;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 24),
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Text(
                        review.review_txt!,
                        style: TextStyle(
                            color: const Color(0xff757575),
                            fontFamily: "SUITE",
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  review.review_img!,
                  width: 100,
                  height: 100,
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
