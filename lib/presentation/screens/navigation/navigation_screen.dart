import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minelibs2/old/screens/HomeScreen.dart';
import 'package:minelibs2/presentation/controllers/navigation_controller.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              HomeScreen(),
              /* ReadingScreen(),
          BookmarkScreen(),
          AccountScreen(), */
            ],
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changePage,
            backgroundColor: Colors.transparent,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Book'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), label: 'Livraison'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Compte'),
            ],
          )),
      /* bottomNavigationBar: Obx(() => FluBottomNavBar(
              onItemTap: (int p0) {
                controller.changePage(p0);
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
              ])), */
    );
  }
}
