import 'package:app2/myspace_module/controller/tabcontroller.dart';
import 'package:app2/myspace_module/views/skilldetails_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';

import 'myproject_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirstPageTabController _mytab = Get.put(FirstPageTabController());
    final _theme = Theme.of(context);
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    title: const Text(''),
                    floating: true,
                    expandedHeight: 150.0,
                    forceElevated: true,
                    bottom: TabBar(
                      controller: _mytab.controller,
                      unselectedLabelColor:
                          _theme.tabBarTheme.unselectedLabelColor,
                      indicatorColor: _theme.tabBarTheme.indicatorColor,
                      tabs: _mytab.myTabs,
                    ),
                  ),
                )
              ];
            },
            body: SafeArea(
                child: TabBarView(
              controller: _mytab.controller,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
                SkillDetails(),
                MyProject(),
              ],
            )),
          ),
        ));
  }
}
