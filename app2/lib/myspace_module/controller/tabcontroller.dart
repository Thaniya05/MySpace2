import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPageTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(
      icon: Icon(
        Icons.person,
        color: Color(0xff53f6aa),
      ),
    ),
    const Tab(
      icon: Icon(
        Icons.home,
        color: Color(0xff53f6aa),
      ),
    ),
    const Tab(
      icon: Icon(
        Icons.work_outline,
        color: Color(0xff53f6aa),
      ),
    ),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
    controller.animateTo(1);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
