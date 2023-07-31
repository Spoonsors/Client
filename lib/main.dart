import 'package:flutter/material.dart';
import 'package:save_children_v01/pages/admin/AdminViewAllProductPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialRoute: "/login",
      home: AdminViewAllProductPageWidget(), //TODO : 지워야할것
    );
    //routes: {"/login": (context) => AdminViewAllProductPageWidget()});
    //routes: {"/login": (context) => AllLoginPageWidget()});
  }
}
