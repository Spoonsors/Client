import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/etc/Routes.dart';
import 'package:save_children_v01/etc/ThemeData.dart';
import 'package:save_children_v01/pages/supporter/SupporterMainPage.dart';
import 'package:save_children_v01/service/IngredientsService.dart';
import 'package:save_children_v01/service/MealPlannerService.dart';
import 'package:save_children_v01/service/RecipeService.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RecipeService()),
      ChangeNotifierProvider(create: (context) => IngredientsService()),
      ChangeNotifierProvider(create: (context) => MealPlannerService()),
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
      home: SupporterMainPageWidget(),
    );
    //routes: {"/login": (context) => AdminViewAllProductPageWidget()});
    //routes: {"/login": (context) => AllLoginPageWidget()});
  }
}
