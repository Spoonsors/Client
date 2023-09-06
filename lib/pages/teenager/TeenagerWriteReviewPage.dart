import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/pages/teenager/TeenagerViewSupportsPage.dart';

import '../../model/PostModel.dart';
import '../../models/TeenagerWriteReviewPageModel.dart';
import '../../service/LoginService.dart';
import '../../service/ReviewsService.dart';

class TeenagerWriteReviewPageWidget extends StatefulWidget {
  const TeenagerWriteReviewPageWidget({super.key, required this.post});

  final Post post;

  @override
  _TeenagerWriteReviewPageWidgetState createState() =>
      _TeenagerWriteReviewPageWidgetState();
}

class _TeenagerWriteReviewPageWidgetState
    extends State<TeenagerWriteReviewPageWidget> with TickerProviderStateMixin {
  late TeenagerWriteReviewPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Post _post;

  String? item_img;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        item_img = pickedFile.path;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _model = TeenagerWriteReviewPageModel();
    _post = widget.post;
    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _titleTextController = TextEditingController();
    final _contentTextController = TextEditingController();
    return Consumer2<ReviewsService, LoginService>(
        builder: (context, reviewsSerice, loginservice, child) {
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
              '감사글 작성',
              style: TextStyle(
                fontFamily: 'SUITE',
                color: const Color(0xff212121),
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        _post.menuName!,
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: const Color(0xff212121),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: item_img == null
                          ? Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: 500,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xfff5f5f5),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xffe0e0e0),
                                  width: 2,
                                ),
                              ),
                              child: Container(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        getImage(ImageSource.gallery);
                                      },
                                      icon: Icon(Icons.add_a_photo_rounded),
                                      color: const Color(0xffffb74d),
                                      iconSize: 32,
                                    ),
                                    Container(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: Text(
                                        '사진 업로드',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'SUITE',
                                          color: const Color(0xff757575),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                getImage(ImageSource.gallery);
                              },
                              child: Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: 500,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff5f5f5),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color(0xffe0e0e0),
                                      width: 2,
                                    ),
                                  ),
                                  child: Image.file(
                                      width: 120,
                                      height: 200,
                                      File(item_img!)))),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _contentTextController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontFamily: 'SUITE',
                              color: const Color(0xff757575),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText:
                                '개인정보 및 신상을 작성할 경우 서비스 사용에 제한이 있을 수 있습니다.',
                            hintStyle: TextStyle(
                              fontFamily: 'SUITE',
                              color: const Color(0xff757575),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xffe0e0e0),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xffffb74d),
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
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 24, 16, 12),
                          ),
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff757575),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 24,
                          minLines: 9,
                          cursorColor: const Color(0xffffb74d),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 170,
                        decoration: BoxDecoration(
                          color: const Color(0xfff5f5f5),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xfff5f5f5),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  '후원해주신 분들',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 140,
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _post.spon!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 100,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 0, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 64,
                                            height: 64,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: const Color(0xffffb74d),
                                                width: 2,
                                              ),
                                            ),
                                            child: Container(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 4, 4, 4),
                                              child: Container(
                                                width: 70,
                                                height: 70,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  _post.spon![index].smember!
                                                              .profilePath ==
                                                          ""
                                                      ? "assets/images/children.png"
                                                      : "assets/images/employee.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Text(
                                              _post.spon![index].smember!
                                                  .smemberNickname!,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: const Color(0xff757575),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: ElevatedButton.icon(
                            icon: Icon(Icons.receipt_long,
                                color: const Color(0xffffffff)),
                            onPressed: () async {
                              PostReview _review = PostReview(
                                post: _post,
                                review_date: DateTime.now(),
                                review_id: 1,
                                review_img: item_img,
                                review_txt: _contentTextController.text,
                              );
                              reviewsSerice.writeReview(
                                  loginservice.loginB.bMember_id!, _review);
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      title: Column(
                                        children: <Widget>[
                                          Text("등록 완료!"),
                                        ],
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "감사글이 등록되었습니다",
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.all(20.0),
                                            foregroundColor: Color(0xffFFB74D),
                                            textStyle:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          child: Text("확인"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TeenagerVIewSupportsPageWidget()));
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            label: Text("감사글 올리기",
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFFB74D),
                              side: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ))),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
