import 'package:flutter/material.dart';
import 'package:save_children_v01/etc/Colors.dart';
import 'package:save_children_v01/pages/supporter/SupporterProfilePage.dart';
import 'package:save_children_v01/pages/supporter/SupporterReviewPage.dart';
import 'package:save_children_v01/pages/supporter/SupporterViewPostsPage.dart';

class SupporterMainPageWidget extends StatefulWidget {
  const SupporterMainPageWidget({super.key});

  @override
  State<SupporterMainPageWidget> createState() =>
      _SupporterMainPageWidgetState();
}

class _SupporterMainPageWidgetState extends State<SupporterMainPageWidget> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    SupporterViewPostsPageWidget(),
    SupporterReviewPageWidget(),
    SupporterProfilePageWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryBackground,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32,
              ),
              label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 32,
              ),
              label: '감사글'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 32,
              ),
              label: '프로필'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primary,
        unselectedItemColor: Color(0xff8A000000),
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void initState() {
    // 해당 클래스가 호출될때
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
