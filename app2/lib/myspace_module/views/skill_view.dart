import 'package:app2/myspace_module/controller/skill_controller.dart';
import 'package:app2/myspace_module/model/skill_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

double mobilesize = 1100;

String pathtoasset = "assets/svg/";
String dots = ".svg";

List<String> _testpic = [
  "typescript1",
  "html1",
  "css1",
  "flutter1",
  "dart1",
  "nodejs1",
  "react1",
  "mongo1",
];

class MySkill extends GetWidget<SkillController> {
  const MySkill({super.key});

  @override
  Widget build(BuildContext context) {
    final skillController = Get.put(SkillController());

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Get.width < mobilesize
            ? _buildMobile(context, skillController)
            : _buildWeb(context, skillController));
  }

  Row _buildWeb(BuildContext context, SkillController skillController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAboutExp(skillController, CrossAxisAlignment.center,
            MainAxisAlignment.center, context),
        Padding(padding: EdgeInsets.all(20.0)),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              //color: Colors.blue,
              child: _buildGrid(skillController),
            ),
          ),
        ),
      ],
    );
  }

  Column _buildMobile(BuildContext context, SkillController skillController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAboutExp(skillController, CrossAxisAlignment.center,
            MainAxisAlignment.center, context),
        Padding(padding: EdgeInsets.all(20.0)),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              //color: Colors.blue,
              child: _buildGrid(skillController),
            ),
          ),
        ),
      ],
    );
  }

  StaggeredGrid _buildGrid(SkillController controller) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: controller.getListGrid(),
    );
  }

  List<Widget> _buildDetailsBackCard(List<String> list) {
    List<Widget> _list = [];

    for (var i = 0; i < list.length; i++) {
      _list.add(
        Container(
          alignment: Alignment.center,
          child: AutoSizeText(
            list[i],
            style: GoogleFonts.sarabun(),
          ),
        ),
      );
    }
    return _list;
  }

  Container _buildAboutExp(SkillController c, CrossAxisAlignment crossAx,
      MainAxisAlignment mainAx, BuildContext context) {
    return Container(
      width: Get.width < mobilesize
          ? MediaQuery.of(context).size.width * 0.85
          : MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: crossAx,
        mainAxisAlignment: mainAx,
        children: [
          Center(
            child: Container(
                //color: Colors.amber,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: AutoSizeText(
                  "Skill / Tools",
                  style: GoogleFonts.sarabun(
                    fontSize: Get.width < mobilesize ? 24 : 40,
                  ),
                  maxLines: 1,
                  minFontSize: 14,
                )),
          ),
          Padding(padding: EdgeInsets.all(Get.width < mobilesize ? 5 : 20)),
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            //color: Colors.amber,
            child: AutoSizeText(
              "",
              style: GoogleFonts.sarabun(
                fontSize: Get.width < mobilesize ? 20 : 26,
                fontWeight: FontWeight.w200,
              ),
              maxLines: 9,
              minFontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
