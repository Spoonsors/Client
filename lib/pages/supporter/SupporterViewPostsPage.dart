import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/service/ViewPostingService.dart';

import '../../etc/Colors.dart';
import '../../etc/TextStyles.dart';

class SupporterViewPostsPageWidget extends StatefulWidget {
  const SupporterViewPostsPageWidget({super.key});

  @override
  State<SupporterViewPostsPageWidget> createState() =>
      _SupporterViewPostsPageWidgetState();
}

class _SupporterViewPostsPageWidgetState
    extends State<SupporterViewPostsPageWidget> {
  List<String> items = [
    "최신 순",
    "가격 순",
  ];
  String selectedItem = "최신 순";

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewPostingService>(
        builder: (context, viewPostService, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('후원 게시판'),
        ),
        body: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                labelColor: primaryText,
                unselectedLabelColor: secondaryText,
                labelStyle: titleMedium,
                indicatorColor: primary,
                tabs: [
                  Tab(
                    text: '후원 요청 게시글',
                  ),
                  Tab(
                    text: '후원 완료된 게시글',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              viewPostService.getAllSuppViewPosts();
                            },
                            color: primary,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  viewPostService.allPostInCompleteList.length,
                              itemBuilder: (context, index) {
                                final suppPost = viewPostService
                                    .allPostInCompleteList[index];
                                return PostListItem(
                                  suppPost: suppPost,
                                  check: 1,
                                  spon_idx: index,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              viewPostService.getAllSuppViewPosts();
                            },
                            color: primary,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  viewPostService.allPostCompleteList.length,
                              itemBuilder: (context, index) {
                                final suppPost =
                                    viewPostService.allPostCompleteList[index];
                                return PostListItem(
                                  suppPost: suppPost,
                                  check: 2,
                                  spon_idx: index,
                                );
                              },
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
      );
    });
  }
}

class PostListItem extends StatefulWidget {
  const PostListItem(
      {super.key,
      required this.check,
      required this.suppPost,
      required this.spon_idx});

  final ViewPosting suppPost;
  final int check;
  final int spon_idx;

  @override
  State<PostListItem> createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  @override
  Widget build(BuildContext context) {
    int EstimatedTotalSupporterMoney = 0;
    for (Spon sgd in widget.suppPost.spon!) {
      // 총 후원 예상 금액
      EstimatedTotalSupporterMoney += sgd.ingredients!.price!;
    }
    var _visible = (widget.check == 1);
    DateTime dt = new DateFormat('yyyy-mm-dd').parse(widget.suppPost.postDate!);

    String d1 = DateFormat('yyyy-mm-dd').format(dt);
    String d2 = DateFormat('hh:mm a').format(dt);
    int cnt = 0;

    return Consumer<ViewPostingService>(
        builder: (context, viewPostingService, child) {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
        child: GestureDetector(
          onTap: () async {
            if (widget.check == 1) {
              await viewPostingService.selectNowView(widget.spon_idx);
              Navigator.pushNamed(context, '/SupporterViewPostDetailPage');
            } else {
              await viewPostingService.selectComNowView(widget.spon_idx);
              await viewPostingService.getReview(widget.suppPost.postId);
              Navigator.pushNamed(
                  context, '/SupporterViewCompletePostDetailPage');
            }
            ;
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '${widget.suppPost.postTitle}',
                                style: TextStyle(
                                    fontFamily: 'SUITE',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    color: primaryText),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              '${widget.suppPost.postTxt}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: secondaryText,
                                fontFamily: 'SUITE',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 6.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Visibility(
                      visible: _visible,
                      replacement: Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '       ',
                            style: TextStyle(
                              fontFamily: 'SUITE',
                              color: primary,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '필요한 식재료',
                            style: TextStyle(
                              fontFamily: 'SUITE',
                              color: primary,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${d1}', // TODO : 날짜 포멧
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: ' | ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '${d2}',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: ' | ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '${widget.suppPost.bmember!.bmemberNickname}',
                            style: TextStyle(),
                          )
                        ],
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: secondaryText,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.check == 1)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150.0,
                        child: Stack(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          children: [
                            for (var item in widget.suppPost.spon!)
                              PostIngredientListItem(
                                  image: item.ingredients!.ingredientsImage,
                                  idx: cnt++),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '예상 후원액 : ${EstimatedTotalSupporterMoney}원',
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            color: secondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Divider(
                thickness: 1.0,
                color: alternate,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class PostIngredientListItem extends StatefulWidget {
  const PostIngredientListItem(
      {super.key, required this.image, required this.idx});

  final String? image;
  final int idx;

  @override
  State<PostIngredientListItem> createState() => _PostIngredientListItemState();
}

class _PostIngredientListItemState extends State<PostIngredientListItem> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-0.9 + (0.3 * widget.idx), 0.0),
      child: Container(
        width: 30.0,
        height: 30.0,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.network(
          '${widget.image}',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
