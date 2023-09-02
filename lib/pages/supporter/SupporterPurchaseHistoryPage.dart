import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/service/SupporterSponListService.dart';

import '../../etc/Colors.dart';

class SupporterPurchaseHistoryPageWidget extends StatefulWidget {
  const SupporterPurchaseHistoryPageWidget({super.key});

  @override
  State<SupporterPurchaseHistoryPageWidget> createState() =>
      _SupporterPurchaseHistoryPageWidgetState();
}

class _SupporterPurchaseHistoryPageWidgetState
    extends State<SupporterPurchaseHistoryPageWidget> {

  @override
  Widget build(BuildContext context) {
    return Consumer<SupporterSponListService>(
        builder: (context, supporterSponListService, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('후원 내역'),
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: supporterSponListService.items.length,
          itemBuilder: (context, index) {
            final item = supporterSponListService.items[index];
            return SupporterProductPurchaseDetailsListItem(
                supporterSponListModel: item);
          },
        ),
      );
    });
  }
}

class SupporterProductPurchaseDetailsListItem extends StatelessWidget {
  const SupporterProductPurchaseDetailsListItem(
      {super.key, required this.supporterSponListModel});

  final SupporterSponListModel supporterSponListModel;

  @override
  Widget build(BuildContext context) {
    return // Generated code for this UserList9 Widget...
        Padding(
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        supporterSponListModel.ingredientsImage,
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '${supporterSponListModel.ingredientsName}',
                                  style: TextStyle(
                                      fontFamily: 'SUITE',
                                      color: info,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 2.0, 0.0, 0.0),
                                child: Container(
                                  width: 200,
                                  child: RichText(
                                    maxLines: 3,
                                    text: TextSpan(
                                      text:
                                          '${supporterSponListModel.productName}',
                                      style: TextStyle(
                                          fontFamily: 'SUITE',
                                          fontSize: 13.0,
                                          color: secondaryText),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  '${supporterSponListModel.price}원',
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    fontSize: 12.0,
                                    color: secondaryText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  '수혜자 : ${supporterSponListModel.writerNickname}',
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    fontSize: 12.0,
                                    color: secondaryText,
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
            ));
  }
}
