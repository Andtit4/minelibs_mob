import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:minelibs2/screens/HomeScreen.dart';
import 'package:minelibs2/screens/account/index.dart';
import 'package:minelibs2/screens/bookmark/index.dart';
import 'package:minelibs2/screens/reading/index.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedItemPosition = 0;

  final int _index = 0;
  PageController _controller = PageController();
  late int currentpage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentpage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            currentpage = index;
          });
        },
        children: const [
          HomeScreen(),
          ReadingScreen(),
          BookMarkScreen(),
          AccountScreen()
        ],
      ),
      bottomNavigationBar: FluBottomNavBar(
          index: _selectedItemPosition,
          onItemTap: (p0) {
            print('bottom $p0');
            setState(() => _selectedItemPosition = p0);
            setState(() => currentpage = p0);
            _controller.animateToPage(currentpage,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          style: FluBottomNavBarStyle(
            iconStyle: FluIconStyles.bulk,
            type: FluBottomNavBarTypes.flat,
            unSelectedForegroundColor: Colors.white,
          ),
          items: [
            FluBottomNavBarItem(FluIcons.home, 'Home'),
            FluBottomNavBarItem(FluIcons.book, 'Book'),
            FluBottomNavBarItem(FluIcons.bookmark, 'Livraison'),
            FluBottomNavBarItem(FluIcons.user, 'compte'),
          ]),
    );
  }
}
