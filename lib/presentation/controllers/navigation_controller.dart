import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  var currentPage = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void changePage(int page) {
    currentPage.value = page;
  }
}
