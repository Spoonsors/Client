import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/etc/Colors.dart';
import 'package:save_children_v01/model/AdminCertificatedItemModel.dart';
import 'package:save_children_v01/service/AdminCertificatedItemsService.dart';

class AdminCertificateConfirmPageWidget extends StatefulWidget {
  const AdminCertificateConfirmPageWidget({super.key});

  @override
  State<AdminCertificateConfirmPageWidget> createState() =>
      _AdminCertificateConfirmPageWidgetState();
}

class _AdminCertificateConfirmPageWidgetState
    extends State<AdminCertificateConfirmPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminCertificateInfoService>(
        builder: (context, adminCertificateInfoService, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '수혜자 회원 자격문서 확인',
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                      child: Container(
                        height: 32.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: secondaryText,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: secondaryText,
                              size: 24.0,
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Text(
                                  '이미지 클릭 시 다운로드 할 수 있습니다.',
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    color: secondaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
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
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: adminCertificateInfoService.items.length,
                  itemBuilder: (context, index) {
                    final item = adminCertificateInfoService.items[index];
                    return AdminCertificateListItem(
                      adminCertificatedItemModel: item,
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}

class AdminCertificateListItem extends StatefulWidget {
  const AdminCertificateListItem(
      {super.key, required this.adminCertificatedItemModel});

  final AdminCertificatedItemModel adminCertificatedItemModel;

  @override
  State<AdminCertificateListItem> createState() =>
      _AdminCertificateListItemState();
}

class _AdminCertificateListItemState extends State<AdminCertificateListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: primaryBackground,
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              '${widget.adminCertificatedItemModel.bmemberCertificate}',
                              width: 500.0,
                              height: 500.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '${widget.adminCertificatedItemModel.bmemberName}',
                                    style: TextStyle(
                                      fontFamily: 'SUITE',
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: info,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 2.0, 0.0, 0.0),
                                  child: Text(
                                    '${widget.adminCertificatedItemModel.bmemberPhoneNumber}',
                                    style: TextStyle(
                                      color: secondaryText,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'SUITE',
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 2.0, 0.0, 0.0),
                                  child: Text(
                                    '${widget.adminCertificatedItemModel.bmemberAddress}',
                                    style: TextStyle(
                                      color: secondaryText,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'SUITE',
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 2.5, 5.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      // TODO : 거부버튼 구현
                                    },
                                    child: Text(
                                      '거부',
                                      style: TextStyle(
                                          color: secondaryText,
                                          fontFamily: 'SUITE',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: secondaryText),
                                      fixedSize: Size.fromHeight(35.0),
                                      backgroundColor: primaryBackground,
                                      elevation: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.5, 0.0, 5.0, 5.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      context
                                          .read<AdminCertificateInfoService>()
                                          .putCerticiateInfo(widget
                                              .adminCertificatedItemModel
                                              .bmemberId);
                                    },
                                    child: Text('인가',
                                        style: TextStyle(
                                            color: secondaryText,
                                            fontFamily: 'SUITE',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: secondaryText),
                                      fixedSize: Size.fromHeight(35.0),
                                      backgroundColor: primary,
                                      textStyle: TextStyle(
                                        fontFamily: 'SUITE',
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: primaryBackground,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
