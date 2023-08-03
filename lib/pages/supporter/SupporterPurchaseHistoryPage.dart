import 'package:flutter/material.dart';

import '../../etc/Colors.dart';

class SupporterPurchaseHistoryPageWidget extends StatefulWidget {
  const SupporterPurchaseHistoryPageWidget({super.key});

  @override
  State<SupporterPurchaseHistoryPageWidget> createState() =>
      _SupporterPurchaseHistoryPageWidgetState();
}

class _SupporterPurchaseHistoryPageWidgetState
    extends State<SupporterPurchaseHistoryPageWidget> {
  final List<String> images = [
    "https://img-cf.kurly.com/shop/data/goodsview/20191213/gv10000072801_1.jpg",
    "https://i.namu.wiki/i/hpNKO-WVGSNMmidWZP8FEr4pR8xOBS_itU4Y0qRjMSXjkizMhhqe2UkLobGIjevtQozkCmNuivfQrqlQgx2Jog.webp",
    "https://img.choroc.com/newshop/goods/009179/009179_1.jpg",
    "https://res.heraldm.com/phpwas/restmb_idxmake.php?idx=507&simg=/content/image/2019/10/14/20191014000235_0.jpg",
    "https://cdn2.thecatapi.com/images/aph.jpg",
    "https://cdn2.thecatapi.com/images/1rd.jpg",
    "https://cdn2.thecatapi.com/images/1rd.jpg",
    "https://cdn2.thecatapi.com/images/1rd.jpg",
    "https://cdn2.thecatapi.com/images/1rd.jpg",
    "https://cdn2.thecatapi.com/images/1rd.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('후원 내역'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final imageUrl = images[index];
          return SupporterProductPurchaseDetailsListItem(imageUrl: imageUrl);
        },
      ),
    );
  }
}

class SupporterProductPurchaseDetailsListItem extends StatelessWidget {
  const SupporterProductPurchaseDetailsListItem(
      {super.key, required this.imageUrl});

  final String imageUrl;

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
                        imageUrl,
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
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '스팸',
                                  style: TextStyle(
                                      fontFamily: 'SUITE',
                                      color: info,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  'CJ 제일제당 스팸 200g',
                                  style: TextStyle(
                                      fontFamily: 'SUITE',
                                      fontSize: 13.0,
                                      color: secondaryText),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  '4500원',
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    fontSize: 12.0,
                                    color: secondaryText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  '수혜자 : 닉네임 1',
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    fontSize: 12.0,
                                    color: secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.more,
                                  color: secondaryText,
                                  size: 24.0,
                                ),
                                onPressed: () {}, // TODO : [Suppt] 등록된 상품 제거 구현
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
