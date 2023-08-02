import '../pages/supporter/SupporterMainPage.dart';
import '../pages/supporter/SupporterNotificationPage.dart';
import '../pages/supporter/SupporterPurchaseHistoryPage.dart';
import '../pages/supporter/SupporterPurchasePage.dart';
import '../pages/supporter/SupporterViewCompletePostDetailPage.dart';
import '../pages/supporter/SupporterViewPostDetailPage.dart';

// route를 등록하고, Navigator.pushNamed(context, '/SupporterPurchaseHistoryPage'); 형식으로 화면전환이 가능합니다.
// dart.js가 import 될 수 있으니 이 import는 삭제해야합니다.

var namedRoutes = {
  '/SupporterMainPage': (context) => SupporterMainPageWidget(),
  '/SupporterPurchaseHistoryPage': (context) =>
      SupporterPurchaseHistoryPageWidget(),
  '/SupporterNotificationPage': (context) => SupporterNotificationPageWidget(),
  '/SupporterViewPostDetailPage': (context) =>
      SupporterViewPostDetailPageWidget(),
  '/SupporterPurchasePage': (context) => SupporterPurchasePageWidget(),
  '/SupporterViewCompletePostDetailPage': (context) =>
      SupporterViewCompletePostDetailPageWidget(),
};