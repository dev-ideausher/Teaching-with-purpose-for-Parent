import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selctedTabIndex = 0.obs;

  void selectDay(int index) {
    selctedTabIndex.value = index;
  }

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    tabController
        .addListener(() => selctedTabIndex.value = tabController.index);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
