import 'package:flutter/material.dart';

class SupporterViewInfoPopWidget extends StatefulWidget {
  const SupporterViewInfoPopWidget({Key? key}) : super(key: key);

  @override
  _SupporterViewInfoPopWidgetState createState() =>
      _SupporterViewInfoPopWidgetState();
}

class _SupporterViewInfoPopWidgetState
    extends State<SupporterViewInfoPopWidget> {
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
                        Icons.info_outline_rounded,
                        color: const Color(0xff212121),
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Text(
                          '모두의 한끼는 여러분들의 힘이 필요한 서비스입니다. 자립준비청년들에게 후원하세요! \n 여러분들의 작은 후원이\n자립준비청년들에게 큰 힘이 됩니다.',
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
                            Navigator.of(context).pop();
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
