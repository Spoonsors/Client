import 'package:flutter/material.dart';

import '../../etc/Colors.dart';
import '../../etc/TextStyles.dart';

class SupporterNotificationPageWidget extends StatefulWidget {
  const SupporterNotificationPageWidget({super.key});

  @override
  State<SupporterNotificationPageWidget> createState() =>
      _SupporterNotificationPageWidgetState();
}

class _SupporterNotificationPageWidgetState
    extends State<SupporterNotificationPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('후원 알람'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          supporterNotificationListItem(),
          supporterNotificationListItem(),
        ],
      ),
    );
  }
}

class supporterNotificationListItem extends StatefulWidget {
  const supporterNotificationListItem({super.key});

  @override
  State<supporterNotificationListItem> createState() =>
      _supporterNotificationListItemState();
}

class _supporterNotificationListItemState
    extends State<supporterNotificationListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: alternate,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: accent1,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: primary,
                    width: 2.0,
                  ),
                ),
                child: Icon(
                  Icons.lightbulb_rounded,
                  color: primaryText,
                  size: 16.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '후원 완료!',
                        maxLines: 1,
                        style: bodyLarge,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          '[김김김] 님이 후원자님의 후원에 감사글을 올렸어요!',
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: 'SUITE',
                            color: primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 44.0,
                              height: 44.0,
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: alternate,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 2.0, 2.0, 2.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    'https://source.unsplash.com/random/1280x720?profile&5',
                                    width: 44.0,
                                    height: 44.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '김김김',
                                    style: bodyLarge,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      '@kakaka',
                                      style: labelSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                        child: Text(
                          '2 hours ago',
                          style: labelSmall,
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
    );
  }
}
