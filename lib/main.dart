import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_children_v01/etc/Routes.dart';
import 'package:save_children_v01/etc/ThemeData.dart';
import 'package:save_children_v01/pages/admin/AdminViewAllProductPage.dart';
import 'package:save_children_v01/service/IngredientsService.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => IngredientsService()),
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
      home: AdminViewAllProductPageWidget(),
    );
    //routes: {"/login": (context) => AdminViewAllProductPageWidget()});
    //routes: {"/login": (context) => AllLoginPageWidget()});
  }
}
