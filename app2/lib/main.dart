import 'package:app2/myspace_module/views/homepage_view.dart';
import 'package:app2/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MySpace',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      getPages: routes,
      initialRoute: '/',
    );
  }
}
