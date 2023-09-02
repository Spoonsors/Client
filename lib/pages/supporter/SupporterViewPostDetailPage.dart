import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/etc/Colors.dart';
import 'package:save_children_v01/etc/TextStyles.dart';
import 'package:save_children_v01/service/ViewPostingService.dart';

class SupporterViewPostDetailPageWidget extends StatefulWidget {
  const SupporterViewPostDetailPageWidget({super.key});

  @override
  State<SupporterViewPostDetailPageWidget> createState() =>
      _SupporterViewPostDetailPageWidgetState();
}

class _SupporterViewPostDetailPageWidgetState
    extends State<SupporterViewPostDetailPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ViewPostingService>(
        builder: (context, viewPostingService, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('후원 정보'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 4.0, 4.0, 4.0),
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      '${viewPostingService.nowView.bmember!.profilePath}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${viewPostingService.nowView.bmember!.bmemberNickname}',
                                          style: TextStyle(
                                            color: primaryText,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'SUITE',
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 0.0),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '${DateFormat('yyyy-mm-dd').format(new DateFormat('yyyy-mm-dd').parse(viewPostingService.nowView.postDate!))}',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: ' | ',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '${DateFormat('hh:mm a').format(new DateFormat('yyyy-mm-dd').parse(viewPostingService.nowView.postDate!))}',
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style: labelMedium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                '${viewPostingService.nowView.postTitle}',
                                style: headlineSmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                '${viewPostingService.nowView.postTxt}',
                                style: bodyLarge,
                              ),
                            ),
                            Divider(
                              height: 32.0,
                              thickness: 1.0,
                              color: alternate,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                '필요한 식재료 (체크 표시는 이미 후원이 완료된 상품입니다)',
                                style: labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal, //TODO : 수정
                              itemCount:
                                  viewPostingService.nowView.spon!.length,
                              itemBuilder: (context, index) {
                                return NeededIngredientsListItem(
                                  sponItem:
                                      viewPostingService.nowView.spon![index],
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 32.0,
                              thickness: 1.0,
                              color: alternate,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                '만들 음식 (${viewPostingService.nowView.menuName})',
                                style: labelMedium,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  '${viewPostingService.nowView.menuImg}',
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 230.0,
                                  fit: BoxFit.cover,
                                ),
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
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                child: ElevatedButton(
                  onPressed: () async {
                    viewPostingService
                        .putCart(); // TODO : index 넘겨주서 장바구니 업데이트하기
                    Navigator.pushNamed(context, '/SupporterPurchasePage');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.infinity, 55.0),
                  ),
                  child: Text(
                    '${viewPostingService.nowView.remainSpon}개 상품 후원',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      fontFamily: 'SUITE',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class NeededIngredientsListItem extends StatefulWidget {
  const NeededIngredientsListItem({super.key, required this.sponItem});

  final Spon sponItem;

  @override
  State<NeededIngredientsListItem> createState() =>
      _NeededIngredientsListItemState();
}

class _NeededIngredientsListItemState extends State<NeededIngredientsListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: primary,
                width: 1.0,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                  child: Container(
                    width: 70.0,
                    height: 70.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      '${widget.sponItem.ingredients!.ingredientsImage}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (widget.sponItem.sponState == 1)
                  Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: overlay,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: success,
                      size: 50.0,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Text(
              '${widget.sponItem.ingredients!.ingredientsName}',
              textAlign: TextAlign.center,
              style: bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
