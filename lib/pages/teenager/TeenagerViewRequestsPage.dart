import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/service/PostsService.dart';

import '../../model/PostModel.dart';
import '../../models/TeenagerViewRequestsPageModel.dart';
import '../../service/LoginService.dart';
import 'TeenagerViewRequestDetailPage.dart';

//viewAllPosts

//viewMyPosts
//changePostState?

class TeenagerViewRequestsPageWidget extends StatefulWidget {
  const TeenagerViewRequestsPageWidget({super.key});
  @override
  _TeenagerViewRequestsPageWidgetState createState() =>
      _TeenagerViewRequestsPageWidgetState();
}

class _TeenagerViewRequestsPageWidgetState
    extends State<TeenagerViewRequestsPageWidget> {
  final _sortList = ['최신 순', '가격 순', '후원이 완료된 게시글', '후원이 완료되지 않은 게시글'];
  var _selectedSort = '최신 순';
  late TeenagerViewRequestsPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _model = TeenagerViewRequestsPageModel();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<PostsService, LoginService>(
        builder: (context, postsService, loginservice, child) {
      postsService.getAllMyPosts(loginservice.loginB.bMember_id!);
      postsService.getAllPosts();
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          automaticallyImplyLeading: false,
          title: Text(
            '후원 게시판',
            style: TextStyle(
              fontFamily: 'SUITE',
              color: const Color(0xff212121),
              fontSize: 22,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0, 0),
                      child: TabBar(
                        labelColor: const Color(0xff212121),
                        unselectedLabelColor: const Color(0xff757575),
                        labelStyle: TextStyle(
                          fontFamily: "SUITE",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        indicatorColor: const Color(0xffFFB74D),
                        tabs: [
                          Tab(
                            text: '내가 쓴 글 보기',
                          ),
                          Tab(
                            text: '모든 후원 게시글',
                          ),
                        ],
                      ),
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
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: postsService.myPostList.length,
                                  itemBuilder: (context, index) {
                                    final _request =
                                        postsService.myPostList[index];
                                    return RequestCard(
                                        request: _request, idx: index);
                                  },
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
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: postsService.allPostList.length,
                                    itemBuilder: (context, index) {
                                      final _request =
                                          postsService.allPostList[index];
                                      return RequestCard(
                                          request: _request, idx: index);
                                    }),
                              ),
                            ],
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
      );
    });
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({super.key, required this.request, required this.idx});

  final Post request;
  final int idx;

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
    for (int i = 0; i < request.spon!.length; i++) {
      totalPrice += request.spon![i].ingredients!.price;
    }
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TeenagerViewRequestDetailPageWidget(request: request)));
        },
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
                              request.postTitle!,
                              style: TextStyle(
                                fontFamily: 'SUITE',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            request.postTxt!,
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
                        '필요한 식재료',
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: const Color(0xffFFB74D),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: DateFormat('yyyy/MM/dd')
                              .format(DateTime.parse(request.postDate!)),
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: ' | ',
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: DateFormat('hh:mm')
                              .format(DateTime.parse(request.postDate!)),
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: ' | ',
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: request.bmember!.bMember_nickname,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: request.spon!.length > 3
                          ? 3
                          : request.spon!.length, // 생성할 아이템 개수
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          alignment: AlignmentDirectional(-1, 0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.62, 0),
                              child: Container(
                                width: 30,
                                height: 30,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  request.spon![index].ingredients!
                                      .ingredients_image,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    child: Text(
                      '예상 후원액 : ${totalPrice}원',
                      style: TextStyle(
                        fontFamily: 'SUITE',
                        color: const Color(0xff81D4FA),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: const Color(0xffE0E0E0),
            ),
          ],
        ),
      ),
    );
  }
}
