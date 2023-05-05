import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'myproject_view.dart';
import 'WorkHistory.dart';

double mobilesize = 820;

List lists = [
  test,
  test,
];
List test = [
  {'type': "topic", "details": "abcd"},
  {'type': "location", "location": "NewNN co,ltd", "time": "2022-2023"},
  {'type': "card", "details": test1},
  {'type': "blank", "size": 5.0}
];

List test1 = [
  {'type': 'details', "detail": "asdasdasdasd"},
  {'type': 'picture', "topicpic": "abc", "src": ""},
  {
    'type': 'chip',
    "topic": "test",
    "chips": [
      {"topichip": "a", "color": Colors.white},
      {"topichip": "b", "color": Colors.amber},
      {"topichip": "a", "color": Colors.white},
      {"topichip": "b", "color": Colors.amber},
      {"topichip": "a", "color": Colors.white},
      {"topichip": "b", "color": Colors.amber},
      {"topichip": "a", "color": Colors.white},
      {"topichip": "b", "color": Colors.amber},
      {"topichip": "a", "color": Colors.white},
      {"topichip": "b", "color": Colors.amber},
      {"topichip": "a", "color": Colors.white},
      {"topichip": "b", "color": Colors.amber},
      {"topichip": "a", "color": Colors.white},
      {"topichip": "b", "color": Colors.amber},
    ]
  },
];

class SkillDetails extends StatelessWidget {
  const SkillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //color: Colors.red,
        child: Column(
          children: [
            _buildBlank(20.0),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: test.map((e) {
                      switch (e["type"]) {
                        case "topic":
                          {
                            //return _buildtopic();
                            return Column(
                              children: [
                                _buildtopic(),
                                _buildBlank(5.0),
                              ],
                            );
                          }

                        case "location":
                          {
                            return Column(
                              children: [
                                _buildLocation(),
                                _buildBlank(5.0),
                              ],
                            );
                          }

                        case "card":
                          {
                            return _buildCard(context, e["details"]);
                          }
                        case "blank":
                          {
                            return _buildBlank(e["size"]);
                          }

                        default:
                          {
                            return Container();
                          }
                      }
                    }).toList()),
              ),
            )
          ],
        ),
      ),
    );
    //return WorkHistory();
  }

  Center _buildCard(BuildContext context, List<dynamic> mylist) {
    return Center(
      child: Card(
        elevation: 10,
        child: Container(
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: mylist.map((item) {
                if (item["type"] == "details") {
                  return Column(
                    children: [
                      _builddetails(str: item["detail"]),
                      _buildBlank(5.0),
                    ],
                  );
                } else if (item["type"] == "picture") {
                  return _buildPicture(context);
                } else if (item["type"] == "chip") {
                  return Column(
                    children: [
                      _buildRowSkillChip(
                        topic: item["topic"],
                        listchip: item["chips"],
                      ),
                      _buildBlank(),
                    ],
                  );
                }
                return Container();
              }).toList()),
        ),
      ),
    );
  }

  Column _buildPicture(BuildContext context) {
    return Column(
      children: [
        _buildBlank(),
        Center(
          child: Container(
            width: Get.width <= mobilesize
                ? MediaQuery.of(context).size.width * 0.8
                : MediaQuery.of(context).size.width * 0.4,
            child: AspectRatio(
              aspectRatio: 3 / 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/pic/webapp.jpg"),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: AutoSizeText(
            "TopicPic",
            style: GoogleFonts.sarabun(
              fontSize: Get.width <= mobilesize ? 18 : 24,
              fontWeight: FontWeight.w300,
            ),
            minFontSize: 10,
          ),
        ),
        _buildBlank(8.0),
      ],
    );
  }

  Column _buildRowSkillChip({String topic = "", List<dynamic>? listchip}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "${topic}",
          style: GoogleFonts.sarabun(
            fontSize: Get.width < mobilesize ? 20 : 24,
            fontWeight: FontWeight.w400,
            color: Colors.amber,
          ),
          minFontSize: 10,
        ),
        _buildBlank(3.0),
        Wrap(
          direction: Axis.horizontal,
          spacing: 3.0,
          children: listchip!.map((item) {
            // print(e);
            return Chip(
              label: Text(
                item["topichip"],
                style: GoogleFonts.sarabun(
                  fontSize: Get.width < mobilesize ? 14 : 18,
                ),
              ),
              elevation: 7.0,
              backgroundColor: item["color"],
              padding: EdgeInsets.all(5.0),
            );
          }).toList(),
        )
      ],
    );
  }

  AutoSizeText _builddetails({String str = ""}) {
    return AutoSizeText(
      str,
      style: GoogleFonts.sarabun(
        fontSize: Get.width <= mobilesize ? 18 : 28,
        fontWeight: FontWeight.w200,
      ),
      minFontSize: 10,
    );
  }

  Row _buildLocation() {
    return Row(
      children: [
        Icon(
          Icons.work_outline,
          color: Colors.blueAccent,
          size: 24,
        ),
        _buildBlank(2.0),
        AutoSizeText(
          "NewNN Co,LTD",
          style:
              GoogleFonts.sarabun(fontSize: Get.width < mobilesize ? 14 : 18),
        ),
        _buildBlank(),
        FaIcon(
          FontAwesomeIcons.clock,
          color: Colors.amber,
        ),
        _buildBlank(2.0),
        AutoSizeText(
          "NewNN Co,LTD",
          style:
              GoogleFonts.sarabun(fontSize: Get.width < mobilesize ? 14 : 18),
        ),
      ],
    );
  }

  AutoSizeText _buildtopic() {
    return AutoSizeText(
      "Topic",
      style: GoogleFonts.sarabun(
        fontSize: Get.width <= mobilesize ? 28 : 42, // web 42
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Padding _buildBlank([double d = 5.0]) => Padding(padding: EdgeInsets.all(d));
}
