import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/pages/supporter/SupporterSuccessPaymentPage.dart';
import 'package:save_children_v01/service/LoginService.dart';
import 'package:save_children_v01/service/ViewPostingService.dart';

import '../../etc/Colors.dart';
import '../../etc/TextStyles.dart';

class SupporterPurchasePageWidget extends StatefulWidget {
  const SupporterPurchasePageWidget({super.key});

  @override
  State<SupporterPurchasePageWidget> createState() =>
      _SupporterPurchasePageWidgetState();
}

class _SupporterPurchasePageWidgetState
    extends State<SupporterPurchasePageWidget> {
  List<String> items = ['카카오페이'];
  String selectedItem = '카카오페이';

  @override
  Widget build(BuildContext context) {
    return Consumer2<ViewPostingService, LoginService>(
        builder: (context, viewPostingService, loginService, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('후원 상품 확인 및 결제'),
        ),
        body: // Generated code for this Column Widget...
            Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 750.0,
                        ),
                        decoration: BoxDecoration(
                          color: secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '후원 상품',
                                style: titleLarge,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 12.0),
                                child: Text(
                                  '후원 물품 수량과 후원에서 제외하려는 물품을 선택해주세요. (최소 1개 이상의 상품을 선택해야합니다.)',
                                  style: labelLarge,
                                ),
                              ),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: viewPostingService.cart!.length,
                                  itemBuilder: (context, index) {
                                    return SupporterPurchaseListItem(
                                      spon: viewPostingService.cart[index]!,
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 750.0,
                        ),
                        decoration: BoxDecoration(
                          color: secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '결제 방식 선택',
                                style: titleLarge,
                              ),
                              ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0.0,
                                            color: alternate,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: DropdownButton(
                                                        underline:
                                                            SizedBox.shrink(),
                                                        style: bodyMedium,
                                                        value: selectedItem,
                                                        items: items.map(
                                                          (value) {
                                                            return DropdownMenuItem(
                                                              value: value,
                                                              child:
                                                                  Text(value),
                                                            );
                                                          },
                                                        ).toList(),
                                                        onChanged: (value) => {
                                                          setState(() {
                                                            selectedItem =
                                                                value!;
                                                          })
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: secondaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
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
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 430.0,
                        ),
                        decoration: BoxDecoration(
                          color: secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '결제 금액',
                                style: titleLarge,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 12.0),
                                child: Text(
                                  '후원하려는 상품을 확인하고, 결제를 진행해주세요. 결제 완료 시, 수혜자에게 알람이 갑니다.',
                                  style: labelLarge,
                                ),
                              ),
                              Divider(
                                height: 32.0,
                                thickness: 2.0,
                                color: alternate,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '총 결제 금액',
                                                style: bodyLarge,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '${viewPostingService.TotalSupporterMoney}원',
                                            style: displaySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (viewPostingService.cart == null) {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return AlertDialog(
                                              content: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "후원할 상품이 없습니다. 확인해주세요.",
                                                  style: TextStyle(
                                                    fontFamily: 'SUITE',
                                                    color: primaryText,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              backgroundColor: Colors.white,
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    '확인',
                                                    style: TextStyle(
                                                        fontFamily: 'SUITE',
                                                        color:
                                                            primaryBackground,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    minimumSize:
                                                        const Size.fromHeight(
                                                            50),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    } else {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: primary,
                                            ), // Display a loading indicator
                                          );
                                        },
                                      );

                                      bool chk = await viewPostingService
                                          .payCartProduct(loginService
                                              .loginS.smemberId); // 결제
                                      if (chk) {
                                        Navigator.of(context)
                                            .pop(); // Close the loading dialog
                                        Navigator.of(context)
                                            .push(_goToSuccess()); // 화면전환
                                      } else {
                                        Navigator.of(context)
                                            .pop(); // Close the loading dialog
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return AlertDialog(
                                                content: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "결제에 실패했습니다. 다시 확인해주세요.",
                                                    style: TextStyle(
                                                      fontFamily: 'SUITE',
                                                      color: primaryText,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                                backgroundColor: Colors.white,
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      '확인',
                                                      style: TextStyle(
                                                          fontFamily: 'SUITE',
                                                          color:
                                                              primaryBackground,
                                                          fontSize: 20,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      minimumSize:
                                                          const Size.fromHeight(
                                                              50),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      }
                                    }
                                  },
                                  child: Text(
                                    '결제하기',
                                    style: TextStyle(
                                        fontFamily: 'SUITE',
                                        color: primaryBackground,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(double.infinity, 50),
                                  ),
                                ),
                              ),
                            ],
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
      );
    });
  }
}

Route _goToSuccess() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const SupporterSuccessPaymentPageWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class SupporterPurchaseListItem extends StatefulWidget {
  const SupporterPurchaseListItem({super.key, required this.spon});

  final Spon spon;

  @override
  State<SupporterPurchaseListItem> createState() =>
      _SupporterPurchaseListItemState();
}

class _SupporterPurchaseListItemState extends State<SupporterPurchaseListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: alternate,
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 1.0, 1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        '${widget.spon.ingredients!.ingredientsImage}',
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${widget.spon.ingredients!.ingredientsName} ',
                                  style: titleSmall),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                                child: SizedBox(
                                  width: 170,
                                  child: Text(
                                    '${widget.spon.ingredients!.productName}',
                                    style: labelSmall,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              Text('${widget.spon.ingredients!.price}원',
                                  textAlign: TextAlign.end, style: titleLarge),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                bool chk = context
                    .read<ViewPostingService>()
                    .deleteCartItem(widget.spon.sponId);
                print(chk);
                if (chk == false) {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "최소 1개 이상의 상품을 선택해야합니다.",
                              style: TextStyle(
                                fontFamily: 'SUITE',
                                color: primaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                '확인',
                                style: TextStyle(
                                    fontFamily: 'SUITE',
                                    color: primaryBackground,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                              ),
                            ),
                          ],
                        );
                      });
                }
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: error,
                      size: 24.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        '제외',
                        style: TextStyle(
                          fontFamily: 'SUITE',
                          color: error,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
