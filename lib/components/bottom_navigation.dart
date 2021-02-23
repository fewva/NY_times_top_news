import 'package:flutter/material.dart';
import 'package:nt_top_news/pages/archive_page/archive_page.dart';
import 'package:nt_top_news/pages/news_page/news_page.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    List _pages = [
      NewsPage(),
      ArchivePage(),
    ];
    return Scaffold(
      body: _pages[_activeIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 4
          )]
        ),
        child: BottomNavigationBar(
          currentIndex: _activeIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'main'),
            BottomNavigationBarItem(icon: Icon(Icons.archive_outlined), label: 'archive'),
          ],
          onTap: (index) => setState(() {
            _activeIndex = index;
          }),
        ),
      ),
    );
  }
}