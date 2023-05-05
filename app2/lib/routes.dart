import 'package:app2/myspace_module/views/homepage_view.dart';
import 'package:app2/myspace_module/views/mainpage_view.dart';
import 'package:app2/myspace_module/views/WorkHistory.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

List<GetPage> routes = [
  GetPage(name: '/', page: () => HomePage()),
  GetPage(name: '/main', page: () => MainPage()),
];
