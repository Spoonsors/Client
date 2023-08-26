import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/pages/teenager/TeenagerWriteReviewPage.dart';

import '../../model/BMemberModel.dart';
import '../../model/PostModel.dart';
import '../../models/TeenagerViewSupportsPageModel.dart';
import '../../service/PostsService.dart';

class TeenagerVIewSupportsPageWidget extends StatefulWidget {
  const TeenagerVIewSupportsPageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerVIewSupportsPageWidgetState createState() =>
      _TeenagerVIewSupportsPageWidgetState();
}

class _TeenagerVIewSupportsPageWidgetState
    extends State<TeenagerVIewSupportsPageWidget> {
  late TeenagerVIewSupportsPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = TeenagerVIewSupportsPageModel();

    _model.searchBarController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BMember bMember = BMember(
        bMember_id: "cjw",
        bMember_pwd: "0102",
        bMember_nickname: "jinu",
        bMember_phoneNumber: "010",
        bMember_address: "인천",
        bMember_certificate: "");
    return Consumer<PostsService>(builder: (context, postsService, child) {
      postsService.getAllMyPosts(bMember.bMember_Id);
      List<Post> waitingPostList = [];
      List<Post> completedNoReviewPostList = [];
      List<Post> completedReviewedPostList = [];
      for (int i = 0; i < postsService.myPostList.length; i++) {
        if (postsService.myPostList[i].post_state == 0) {
          waitingPostList.add(postsService.myPostList[i]);
        } else {
          if (postsService.myPostList[i].has_review == 0) {
            completedNoReviewPostList.add(postsService.myPostList[i]);
          } else {
            completedReviewedPostList.add(postsService.myPostList[i]);
          }
        }
      }
      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xfff5f5f5),
          appBar: AppBar(
            backgroundColor: const Color(0xfff5f5f5),
            automaticallyImplyLeading: false,
            leading: Icon(
              Icons.arrow_back_rounded,
              color: const Color(0xff212121),
              size: 30,
            ),
            title: Text(
              '수혜 내역 ',
              style: TextStyle(
                  fontFamily: "SUITE",
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff212121)),
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(mainAxisSize: MainAxisSize.max, children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 8, 0),
                    child: TextFormField(
                      controller: _model.searchBarController,
                      textCapitalization: TextCapitalization.words,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: '제품을 검색하세요',
                        labelStyle: TextStyle(
                            fontFamily: 'SUITE',
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff212121)),
                        hintStyle: TextStyle(
                            fontFamily: 'SUITE',
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff212121)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xffe0e0e0),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xffFFB74D),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xfff44336),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xfff44336),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: const Color(0xffffffff),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                        prefixIcon: Icon(
                          Icons.search,
                          color: const Color(0xff757575),
                          size: 16,
                        ),
                      ),
                      style: TextStyle(
                          fontFamily: "SUITE",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff212121)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 12, 0),
                  child: Icon(
                    Icons.search_sharp,
                    color: const Color(0xff212121),
                    size: 30,
                  ),
                ),
              ]),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelStyle: TextStyle(
                                fontFamily: "SUITE",
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffffb74d)),
                            unselectedLabelStyle: TextStyle(
                                fontFamily: "SUITE",
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff757575)),
                            labelColor: const Color(0xffFFB74D),
                            unselectedLabelColor: const Color(0xff757575),
                            labelPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            indicatorColor: const Color(0xffFFB74D),
                            tabs: [
                              Tab(
                                text: '대기 중인 후원',
                              ),
                              Tab(
                                text: '완료된 후원',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 0, 0),
                                      child: Text(
                                        '대기 중인 후원',
                                        style: TextStyle(
                                            fontFamily: "SUITE",
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff212121)),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: waitingPostList.length,
                                          itemBuilder: (context, index) {
                                            return WaitingPostCard(
                                              bMember: bMember,
                                              idx: index,
                                              post: waitingPostList[index],
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 0, 0),
                                      child: Text(
                                        '완료된 후원',
                                        style: TextStyle(
                                            fontFamily: "SUITE",
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff212121)),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              completedNoReviewPostList.length,
                                          itemBuilder: (context, index) {
                                            return CompletedNoneReviewPostCard(
                                              bMember: bMember,
                                              idx: index,
                                              post: completedNoReviewPostList[
                                                  index],
                                            );
                                          }),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              completedReviewedPostList.length,
                                          itemBuilder: (context, index) {
                                            return CompletedNoneReviewPostCard(
                                              bMember: bMember,
                                              idx: index,
                                              post: completedReviewedPostList[
                                                  index],
                                            );
                                          }),
                                    )
                                  ],
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
        ),
      );
    });
  }
}

//모든 post들에 대해 post.postState가 0인지 1인지에 따른
//구분이 위에서 선행되어야함.
class WaitingPostCard extends StatelessWidget {
  const WaitingPostCard(
      {super.key,
      required this.post,
      required this.idx,
      required this.bMember});

  final Post post;
  final int idx;
  final BMember bMember;

  @override
  Widget build(BuildContext context) {
    PostsService _postService = PostsService(bMember: bMember);
    _postService.getIngredientsOfPost(post);
    List<String> _parts = _postService.post_Recipe.rcp_PARTS_DTLS.split(",");
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {},
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
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
                                  post.post_title,
                                  style: TextStyle(
                                      fontFamily: "SUITE",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff212121)),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                post.post_txt,
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  fontSize: 12,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Text(
                            '필요한 식재료 개수',
                            style: TextStyle(
                              fontFamily: 'SUITE',
                              color: const Color(0xffffb74d),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: DateFormat("yyyy.MM.dd")
                                  .format(post.post_date),
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: ' | ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: DateFormat("hh:mm").format(post.post_date),
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: ' | ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: post.bMember.bMember_Nickname,
                              style: TextStyle(),
                            )
                          ],
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff757575),
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 150, child: Text("${_parts.length}")
                          // child: Stack(
                          //   alignment: AlignmentDirectional(-1, 0),
                          //   children: [
                          //     Align(
                          //       alignment: AlignmentDirectional(-0.91, 0),
                          //       child: Container(
                          //         width: 30,
                          //         height: 30,
                          //         clipBehavior: Clip.antiAlias,
                          //         decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //         ),
                          //         child: Image.asset(
                          //           'assets/images/배추김치_비비고.jpg',
                          //           fit: BoxFit.fitWidth,
                          //         ),
                          //       ),
                          //     ),
                          //     Align(
                          //       alignment: AlignmentDirectional(-0.62, 0),
                          //       child: Container(
                          //         width: 30,
                          //         height: 30,
                          //         clipBehavior: Clip.antiAlias,
                          //         decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //         ),
                          //         child: Image.asset(
                          //           'assets/images/햄_스팸.jpg',
                          //           fit: BoxFit.fitWidth,
                          //         ),
                          //       ),
                          //     ),
                          //     Align(
                          //       alignment: AlignmentDirectional(-0.35, 0),
                          //       child: Container(
                          //         width: 30,
                          //         height: 30,
                          //         clipBehavior: Clip.antiAlias,
                          //         decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //         ),
                          //         child: Image.asset(
                          //           'assets/images/대파.jpeg',
                          //           fit: BoxFit.fitHeight,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text("후원 완료",
                              style: TextStyle(
                                fontFamily: 'SUITE',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                            backgroundColor: Color(0xffFFB74D),
                            side: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompletedNoneReviewPostCard extends StatelessWidget {
  const CompletedNoneReviewPostCard(
      {super.key,
      required this.post,
      required this.idx,
      required this.bMember});

  final Post post;
  final int idx;
  final BMember bMember;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {},
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
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
                                  post.post_title,
                                  style: TextStyle(
                                      fontFamily: "SUITE",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff212121)),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                post.post_txt,
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  fontSize: 12,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Text(
                            '모든 후원 완료!',
                            style: TextStyle(
                              fontFamily: 'SUITE',
                              color: const Color(0xffffb74d),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: DateFormat("yyyy.MM.dd")
                                  .format(post.post_date),
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: ' | ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: DateFormat("hh:mm").format(post.post_date),
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: ' | ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: post.bMember.bMember_Nickname,
                              style: TextStyle(),
                            )
                          ],
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff757575),
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.message,
                        color: const Color(0xff757575),
                        size: 20,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TeenagerWriteReviewPageWidget(
                                          post: post)));
                        },
                        child: Text(
                          ' 리뷰 쓰기',
                          style: TextStyle(
                              fontFamily: "SUITE",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff212121)),
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
    );
  }
}

class CompletedReviewedPostCard extends StatelessWidget {
  const CompletedReviewedPostCard(
      {super.key,
      required this.post,
      required this.idx,
      required this.bMember});

  final PostPosts post;
  final int idx;
  final BMember bMember;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {},
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
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
                                  post.menu_name,
                                  style: TextStyle(
                                      fontFamily: "SUITE",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff212121)),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                post.post_txt,
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  fontSize: 12,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Text(
                            '모든 후원 완료!',
                            style: TextStyle(
                              fontFamily: 'SUITE',
                              color: const Color(0xffffb74d),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: DateFormat("yyyy.MM.dd")
                                  .format(post.post_date),
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: ' | ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: DateFormat("hh:mm").format(post.post_date),
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: ' | ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: post.bMember.bMember_Nickname,
                              style: TextStyle(),
                            )
                          ],
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff757575),
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        ' 리뷰 작성 완료',
                        style: TextStyle(
                            fontFamily: "SUITE",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff212121)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
