import 'package:flutter/material.dart';

class TeenagerViewInfoPopWidget extends StatefulWidget {
  const TeenagerViewInfoPopWidget({Key? key}) : super(key: key);

  @override
  _TeenagerViewInfoPopWidgetState createState() =>
      _TeenagerViewInfoPopWidgetState();
}

class _TeenagerViewInfoPopWidgetState extends State<TeenagerViewInfoPopWidget> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
        child: Container(
          height: 280,
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 530,
          ),
          decoration: BoxDecoration(
            color: const Color(0xfff5f5f5),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x33000000),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xffffffff),
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.help_outline_outlined,
                        color: const Color(0xff212121),
                        size: 36,
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          '도움말',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            color: const Color(0xff212121),
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Text(
                          '모두의 한끼는 여러분을 위한 서비스입니다! 먹고 싶은 메뉴를 선택하고 필요한 재료를 후원받으세요!\n후원에 대한 감사글도 잊지 말고 작성해주세요!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("확인",
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFFB74D),
                            side: BorderSide(
                              color: Colors.transparent,
                              width: 0,
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
