import 'package:flutter/material.dart';
import 'package:pandey_app/widget/main_screen_widget.dart';
import 'package:pandey_app/widget/stdin_screen_widget.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _pages = [
      {'page': MainScreen(), 'title': 'mainscreen'},
      {'page': StdinScreen(), 'title': 'Stdin'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _selectedPageIndex = newIndex;
          });
        },
        children: [
          MainScreen(),
          StdinScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: _pages[_selectedPageIndex]['title'] as String),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: 'Stdin'),
        ],
      ),
    );
  }
}
