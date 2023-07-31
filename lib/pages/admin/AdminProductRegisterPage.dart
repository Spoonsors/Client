import 'package:flutter/material.dart';
import 'package:save_children_v01/etc/Colors.dart';
import 'package:save_children_v01/etc/TextStyles.dart';

class AdminProductRegisterPageWidget extends StatefulWidget {
  const AdminProductRegisterPageWidget({Key? key}) : super(key: key);

  @override
  State<AdminProductRegisterPageWidget> createState() =>
      _AdminProductRegisterPageWidgetState();
}

class _AdminProductRegisterPageWidgetState
    extends State<AdminProductRegisterPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBackground,
        iconTheme: IconThemeData(color: primaryText),
        automaticallyImplyLeading: true,
        title: Text(
          '상품 등록',
          style: TextStyle(
            fontFamily: 'SUITE',
            color: primaryText,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: alternate,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_a_photo_outlined,
                                  color: secondaryText,
                                  size: 72.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    '사진 등록',
                                    style: TextStyle(
                                      fontFamily: 'SUITE',
                                      color: primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    '재료 사진을 등록하세요',
                                    style: TextStyle(
                                      fontFamily: 'SUITE',
                                      color: secondaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {},
                              // TODO : [admin] 사진 등록 기능 구현
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 0.0),
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: '재료명',
                        labelStyle: TextStyle(
                          fontFamily: 'SUITE',
                          color: primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: '재료 이름을 입력하세요.',
                        hintStyle: TextStyle(
                          fontFamily: 'SUITE',
                          color: secondaryText,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 20.0, 24.0),
                      ),
                      style: TextStyle(
                        fontFamily: 'SUITE',
                        color: primary,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 0.0),
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: '상품명',
                        labelStyle: TextStyle(
                          fontFamily: 'SUITE',
                          color: primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: '상품명을 입력하세요.',
                        hintStyle: bodyLarge,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 20.0, 24.0),
                      ),
                      style: bodyMedium,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 0.0),
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: '가격',
                        labelStyle: TextStyle(
                          fontFamily: 'SUITE',
                          color: primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: '가격을 입력하세요.',
                        hintStyle: bodyLarge,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 20.0, 24.0),
                      ),
                      style: bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
              child: ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                child: Text(
                  '상품 등록',
                  style: titleMedium,
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fixedSize: Size(double.infinity, 55.0),
                  backgroundColor: primary,
                  elevation: 2.0,
                  shadowColor: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
