import 'dart:ui';

import 'package:flutter/material.dart';

import '../etc/Colors.dart';
import '../models/allChooseImageModel.dart';

class AllChooseImagePopWidget extends StatefulWidget {
  const AllChooseImagePopWidget({
    super.key,
  });

  _AllChooseImagePopWidgetState createState() =>
      _AllChooseImagePopWidgetState();
}

class _AllChooseImagePopWidgetState extends State<AllChooseImagePopWidget> {
  late AllChooseImagePopModel _model;
  late String _profile_path;
  late bool _isSMember;
  late String _email;
  late String _pw;

  Future<void> _selectImage(String path) async {
    String selectedImagePath = path;
    Navigator.pop(context, selectedImagePath);
  }

  @override
  void initState() {
    super.initState();
    _model = AllChooseImagePopModel();
    // _profile_path = widget.profile_path;
    // _isSMember = widget.isSMember;
    // _email = widget.email;
    // _pw = widget.pw;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: 400,
            height: 450,
            decoration: BoxDecoration(
              color: secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    '사용할 프로필을 선택하세요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SUITE',
                      color: primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Container(
                        width: 160,
                        height: 140,
                        decoration: BoxDecoration(
                          color: secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: IconButton(
                              onPressed: () {
                                _profile_path =
                                    'assets/images/profiles/학생1.png';
                                _selectImage(_profile_path);
                              },
                              icon: Image.asset(
                                'assets/images/profiles/학생1.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Container(
                        width: 160,
                        height: 140,
                        decoration: BoxDecoration(
                          color: secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: IconButton(
                              onPressed: () {
                                _profile_path =
                                    'assets/images/profiles/학생2.png';
                                _selectImage(_profile_path);
                              },
                              icon: Image.asset(
                                'assets/images/profiles/학생2.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Container(
                        width: 160,
                        height: 140,
                        decoration: BoxDecoration(
                          color: secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: IconButton(
                              onPressed: () {
                                _profile_path =
                                    'assets/images/profiles/후원자1.png';
                                _selectImage(_profile_path);
                              },
                              icon: Image.asset(
                                'assets/images/profiles/후원자1.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Container(
                        width: 160,
                        height: 140,
                        decoration: BoxDecoration(
                          color: secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: IconButton(
                            onPressed: () {
                              _profile_path = 'assets/images/profiles/후원자2.png';
                              _selectImage(_profile_path);
                            },
                            icon: Image.asset(
                              'assets/images/profiles/후원자2.png',
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
