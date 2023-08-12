import 'package:flutter/material.dart';
import 'package:save_children_v01/pages/teenager/TeenagerViewProfilePage.dart';
import 'package:save_children_v01/pages/teenager/TeenagerViewRefrigeratorPage.dart';
import 'package:save_children_v01/pages/teenager/TeenagerViewRequestsPage.dart';
import 'package:save_children_v01/pages/teenager/TeenagerViewReviewsPage.dart';

import 'TeenagerViewHomePage.dart';

class TeenagerViewMainPageWidget extends StatefulWidget {
  const TeenagerViewMainPageWidget({Key? key}) : super(key: key);

  @override
  _TeenagerViewMainPageWidgetState createState() =>
      _TeenagerViewMainPageWidgetState();
}

class _TeenagerViewMainPageWidgetState
    extends State<TeenagerViewMainPageWidget> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    TeenagerViewHomePageWidget(),
    TeenagerViewRefrigeratorPageWidget(),
    TeenagerViewProfilePageWidget(),
    TeenagerViewRequestsPageWidget(),
    TeenagerViewReviewsPageWidget()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "냉장고",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "프로필",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_rounded),
            label: "내 리뷰",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review_rounded),
            label: "후원 게시판",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffFFB74D),
        unselectedItemColor: const Color(0xff757575),
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(fontFamily: "SUITE"),
      ),
    );
  }
}
