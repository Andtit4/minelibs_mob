import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minelibs2/domain/entities/book_info.dart';
import 'package:minelibs2/domain/repositories/book_info_repository.dart';

class HomeController extends GetxController {
  final BookInfoRepository _bookInfoRepository;
  final books = <BookInfo>[].obs;
  final bookHeader = <BookInfo>[].obs;
  final greeting = ''.obs;

  final isSearchBarVisible = false.obs;

  HomeController(this._bookInfoRepository);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    bookHeader.value = _bookInfoRepository.getBookInfoForHome();
    books.value = _bookInfoRepository.getBooksForHome();
    updateGreeting();
  }

  void changeSearchBarState() {
    // print("jnjn ${isSearchBarVisible.value}");
    isSearchBarVisible.value = !isSearchBarVisible.value;
    // print("after ${isSearchBarVisible.value}");
  }

  void updateGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      greeting.value = 'Bonjour';
    } else if (hour >= 12 && hour < 18) {
      greeting.value = 'Bon Midi';
    } else {
      greeting.value = 'Bonsoir';
    }
  }
}
