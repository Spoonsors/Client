import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/etc/Colors.dart';
import 'package:save_children_v01/etc/TextStyles.dart';
import 'package:save_children_v01/service/SupporterPostService.dart';

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
    return Consumer<SupporterPostService>(
        builder: (context, supporterPostService, child) {
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
                                    child: Image.network(
                                      'https://mvp.microsoft.com/ko-kr/PublicProfile/Photo/4025200',
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
                                          '${supporterPostService.post.post.bMember.bMember_nickname}',
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
                                                  text: '2023.07.16',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: ' | ',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: '4:20pm',
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
                                '${supporterPostService.post.post.post_title}',
                                style: headlineSmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                '${supporterPostService.post.post.post_txt}',
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 0.0, 12.0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 4.0, 4.0, 4.0),
                                            child: Container(
                                              width: 70.0,
                                              height: 70.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://i.namu.wiki/i/y1vEkfKabfcqbF-qZ79SHA1UTT8j4V2VHltkcy5zXhz_bXaTYm_z3JRJikOf616oLd8ldnjQTYTV2wYneZabsg.webp',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        '스팸',
                                        textAlign: TextAlign.center,
                                        style: bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 0.0, 12.0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 4.0, 4.0, 4.0),
                                            child: Container(
                                              width: 70.0,
                                              height: 70.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://img.danawa.com/prod_img/500000/406/197/img/4197406_1.jpg?_v=20161103141854',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        '김치',
                                        textAlign: TextAlign.center,
                                        style: bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 0.0, 12.0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 4.0, 4.0, 4.0),
                                            child: Container(
                                              width: 70.0,
                                              height: 70.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://healingfactory.co.kr/data/files/cc7a540d5846dbbfa238bfdf499c2d2b.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        '대파',
                                        textAlign: TextAlign.center,
                                        style: bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                                '만들 음식 (스팸김치찌개)',
                                style: labelMedium,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  'https://i.ytimg.com/vi/PH_-nGRatgo/maxresdefault.jpg',
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
                    Navigator.pushNamed(context, '/SupporterPurchasePage');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.infinity, 55.0),
                  ),
                  child: Text(
                    '1개 상품 후원',
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
