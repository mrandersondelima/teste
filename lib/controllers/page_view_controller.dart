import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {
  final _pageViewController = PageController(initialPage: 0).obs;  
  var _currentPageIndex = 0.obs;

  set currentPageIndex(int index) {
    _currentPageIndex = index.obs;
    update();
  }

  int get currentPageIndex => _currentPageIndex.value;

  PageController get pageViewController => _pageViewController.value;
}
