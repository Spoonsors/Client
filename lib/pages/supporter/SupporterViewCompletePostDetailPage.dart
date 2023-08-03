import 'package:flutter/material.dart';

import '../../etc/Colors.dart';
import '../../etc/TextStyles.dart';

class SupporterViewCompletePostDetailPageWidget extends StatelessWidget {
  const SupporterViewCompletePostDetailPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('후원 정보 및 후원 감사글 보기'),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '닉네임1',
                                        style: TextStyle(
                                          color: primaryText,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'SUITE',
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                              ),
                                              TextSpan(
                                                text: ' | ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: '닉네임',
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
                              '이번에는 김치찌개를 만들거에요~',
                              style: headlineSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              '안녕하세요, 다음주에 김치찌개를 끓일려는데 , 제일 중요한 김치가 다 떨어졌어요.. 이번에도 잘 부탁드리겠습니다 ㅠㅠ',
                              style: bodyLarge,
                            ),
                          ),
                          Divider(
                            height: 32.0,
                            thickness: 1.0,
                            color: alternate,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              '닉네임1로부터의 후기가 도착했어요!',
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'SUITE',
                                  fontSize: 18.0),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Text(
                              '보내주신 스팸과 김치, 식용유로 만들었어요! 후원 감사합니다!',
                              style: bodyLarge,
                            ),
                          ),
                          Text(
                            '2023.07.17',
                            style: bodySmall,
                          ),
                          Divider(
                            height: 32.0,
                            thickness: 1.0,
                            color: alternate,
                          ),
                        ],
                      ),
                    ),

                    // Generated code for this Column Widget...
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 0.0, 0.0),
                          child: Text(
                            'Thanks to',
                            textAlign: TextAlign.center,
                            style: bodyLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                supporterViewCompleltePostListItem(),
                                supporterViewCompleltePostListItem(),
                                supporterViewCompleltePostListItem(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: alternate,
                  fixedSize: Size(double.infinity, 55.0),
                ),
                child: Text(
                  '이미 완료된 후원입니다.',
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
  }
}

class supporterViewCompleltePostListItem extends StatelessWidget {
  const supporterViewCompleltePostListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 6.0, 12.0),
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
                      'https://i.namu.wiki/i/y1vEkfKabfcqbF-qZ79SHA1UTT8j4V2VHltkcy5zXhz_bXaTYm_z3JRJikOf616oLd8ldnjQTYTV2wYneZabsg.webp',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Text('후원자1', textAlign: TextAlign.center, style: bodySmall),
          ),
        ],
      ),
    );
  }
}
