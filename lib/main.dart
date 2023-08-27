import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/etc/Routes.dart';
import 'package:save_children_v01/etc/ThemeData.dart';
import 'package:save_children_v01/pages/auth/AllLoginPage.dart';
import 'package:save_children_v01/service/FridgesService.dart';
import 'package:save_children_v01/service/IngredientsService.dart';
import 'package:save_children_v01/service/LoginService.dart';
import 'package:save_children_v01/service/MealPlannerService.dart';
import 'package:save_children_v01/service/PostsService.dart';
import 'package:save_children_v01/service/RecipeService.dart';
import 'package:save_children_v01/service/ReviewsService.dart';
import 'package:save_children_v01/service/SMSService.dart';
import 'package:save_children_v01/service/SignupService.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'b1c6065783d0a3451d239c15e0a28da3');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginService()),
      ChangeNotifierProvider(create: (context) => RecipeService()),
      ChangeNotifierProvider(create: (context) => IngredientsService()),
      ChangeNotifierProvider(create: (context) => PostsService()),
      ChangeNotifierProvider(create: (context) => MealPlannerService()),
      ChangeNotifierProvider(create: (context) => SignupService()),
      ChangeNotifierProvider(create: (context) => FridgesService()),
      ChangeNotifierProvider(create: (context) => ReviewsService()),
      ChangeNotifierProvider(create: (context) => SMSService()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routes: namedRoutes,
      // initialRoute: "/login",
      home: AllLoginPageWidget(),
    );
    //routes: {"/login": (context) => AdminViewAllProductPageWidget()});
    //routes: {"/login": (context) => AllLoginPageWidget()});
  }
}
