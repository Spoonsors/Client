import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/service/SupporterPostService.dart';

import '../../etc/Colors.dart';
import '../../etc/TextStyles.dart';
import '../../model/GetPostDTOModel.dart';

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
    return Consumer<SupporterPostService>(
        builder: (context, supporterPostService, child) {
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 5.0, 5.0),
                              child: DropdownButton(
                                underline: SizedBox.shrink(),
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  color: primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                value: selectedItem,
                                items: items.map(
                                  (value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) => {
                                  setState(() {
                                    selectedItem = value!;
                                  })
                                },
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: supporterPostService
                                .allPostInCompleteList.length,
                            itemBuilder: (context, index) {
                              final suppPost = supporterPostService
                                  .allPostInCompleteList[index];
                              return PostListItem(
                                suppPost: suppPost,
                                check: 1,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 5.0, 5.0),
                              child: DropdownButton(
                                underline: SizedBox.shrink(),
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  color: primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                value: selectedItem,
                                items: items.map(
                                  (value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) => {
                                  setState(() {
                                    selectedItem = value!;
                                  })
                                },
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                supporterPostService.allPostCompleteList.length,
                            itemBuilder: (context, index) {
                              final suppPost = supporterPostService
                                  .allPostCompleteList[index];
                              return PostListItem(
                                suppPost: suppPost,
                                check: 2,
                              );
                            },
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
  const PostListItem({super.key, required this.check, required this.suppPost});

  final GetPostDTO suppPost;
  final int check;

  @override
  State<PostListItem> createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  @override
  Widget build(BuildContext context) {
    int EstimatedTotalSupporterMoney = 0;
    for (SponGetDTO sgd in widget.suppPost.spon) {
      EstimatedTotalSupporterMoney += sgd.ingredients.price;
    }

    DateTime dt = new DateFormat('yyyy-mm-dd').parse(widget.suppPost.post_date);

    String d1 = DateFormat('yyyy-mm-dd').format(dt);
    String d2 = DateFormat('hh:mm a').format(dt);
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: GestureDetector(
        onTap: () {
          context
              .read<SupporterPostService>()
              .viewSuppPost(widget.suppPost.post_id);

          (widget.check == 1)
              ? Navigator.pushNamed(context, '/SupporterViewPostDetailPage')
              : Navigator.pushNamed(
                  context, '/SupporterViewCompletePostDetailPage');
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
                              '${widget.suppPost.post_title}',
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
                            '${widget.suppPost.post_txt}',
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
                  Expanded(
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
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
                          text: '${widget.suppPost.bMember.bMember_nickname}',
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
                        Align(
                          alignment: AlignmentDirectional(-0.91, 0.0),
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://img.danawa.com/prod_img/500000/406/197/img/4197406_1.jpg?_v=20161103141854',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.62, 0.0),
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://i.namu.wiki/i/y1vEkfKabfcqbF-qZ79SHA1UTT8j4V2VHltkcy5zXhz_bXaTYm_z3JRJikOf616oLd8ldnjQTYTV2wYneZabsg.webp',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.35, 0.0),
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://healingfactory.co.kr/data/files/cc7a540d5846dbbfa238bfdf499c2d2b.jpg',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
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
  }
}