import 'package:app2/myspace_module/model/skill_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:get/get.dart";
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillController extends GetxController {
  List<ItemSchema> mylist = [
    //dummy API
    ItemSchema(
      name: "Typescript",
      src: "assets/svg/typescript1.svg",
      color: Color.fromARGB(255, 62, 173, 127),
      lists: ["2 project", "1 year"],
      crossAx: 2,
      mainAx: 2,
    ),
    ItemSchema(
      name: "React",
      src: "assets/svg/react1.svg",
      color: Color.fromARGB(255, 17, 57, 65),
      lists: ["1 Project", "6 month"],
      crossAx: 2,
      mainAx: 1,
    ),
    ItemSchema(
      name: "Css",
      src: "assets/svg/css1.svg",
      color: Color.fromARGB(255, 228, 147, 217),
      lists: ["2 Project", ""],
      crossAx: 1,
      mainAx: 1,
    ),
    ItemSchema(
      name: "Flutter",
      src: "assets/svg/flutter1.svg",
      color: Color.fromARGB(255, 93, 103, 112),
      lists: ["1 mini project", ""],
      crossAx: 1,
      mainAx: 1,
    ),
    ItemSchema(
      name: "Dart",
      src: "assets/svg/dart1.svg",
      color: Color.fromARGB(255, 173, 240, 206),
      lists: ["", ""],
      crossAx: 1,
      mainAx: 1,
    ),
    ItemSchema(
        name: "NodeJS",
        src: "assets/svg/nodejs1.svg",
        color: Color.fromARGB(255, 203, 221, 236),
        lists: ["2 Project", "1 year"],
        crossAx: 1,
        mainAx: 1),
    ItemSchema(
      name: "Html",
      src: "assets/svg/html1.svg",
      color: Color.fromARGB(255, 191, 216, 121),
      lists: ["2 project", ""],
      crossAx: 2,
      mainAx: 2,
    ),
    ItemSchema(
      name: "Mongo",
      src: "assets/svg/mongo1.svg",
      color: Color.fromARGB(255, 236, 169, 186),
      lists: ["1 project", ""],
      crossAx: 2,
      mainAx: 1,
    ),
  ];

  List<Widget> getListGrid() {
    AnimationController controller;
    List<Widget> _list = [];
    bool itfirst = true;

    for (var item in mylist) {
      if (itfirst) {
        _list.add(
          StaggeredGridTile.count(
            crossAxisCellCount: item.crossAx,
            mainAxisCellCount: item.mainAx,
            child: FlipCard(
              front: Card(
                elevation: 10,
                color: item.color,
                //color: Colors.amber,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    item.src,
                  ),
                ),
              )
                  .animate(onPlay: (controller) => controller.loop())
                  .shake(delay: 1000.ms),
              back: Card(
                elevation: 10,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.name,
                        style: GoogleFonts.sarabun(color: Colors.amber),
                      ),
                      Text(item.lists[0]),
                      Text(item.lists[1]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        itfirst = false;
      } else {
        _list.add(
          StaggeredGridTile.count(
            crossAxisCellCount: item.crossAx,
            mainAxisCellCount: item.mainAx,
            child: FlipCard(
              front: Card(
                elevation: 10,
                color: item.color,
                //color: Colors.amber,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    item.src,
                  ),
                ),
              ),
              back: Card(
                elevation: 10,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.name,
                        style: GoogleFonts.sarabun(color: Colors.amber),
                      ),
                      Text(item.lists[0]),
                      Text(item.lists[1]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    return _list;
  }
}
