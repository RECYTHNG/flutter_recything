import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  PageController pageController = PageController();

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void updateIndex(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }
}
