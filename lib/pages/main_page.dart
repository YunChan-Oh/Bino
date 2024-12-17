import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart';
import 'analysis_page.dart';
import 'support_page.dart';
import 'stock_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AnalysisPage(),
    SupportPage(),
    StockPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        iconSize: 30, // 아이콘 크기 조정
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home), // 기본 Flutter 아이콘
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chartBar), // FontAwesome 아이콘
            label: '상권 분석',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.handHoldingUsd), // FontAwesome 아이콘
            label: '정부 지원',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cogs), // FontAwesome 아이콘
            label: '재고 관리',
          ),
        ],
      ),
    );
  }
}
