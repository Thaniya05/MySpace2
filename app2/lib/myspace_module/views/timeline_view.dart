import 'package:app2/myspace_module/controller/timeline_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';

import '../model/timelines_model.dart';

double mobilesize = 820;

class Timelines extends GetWidget<TimelineController> {
  const Timelines({super.key});

  @override
  Widget build(BuildContext context) {
    final timelineController = Get.put(TimelineController());

    final list = timelineController.getList();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        margin: EdgeInsets.fromLTRB(30, 50, 30, 30),
        //color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: Get.width <= mobilesize ? 2 : 1,
              child: Container(
                // color: Colors.blue[100],
                child: AutoSizeText(
                  "Timeline",
                  maxLines: 1,
                  style: GoogleFonts.sarabun(
                      fontSize: Get.width <= mobilesize ? 32 : 40,
                      color: Colors.amber,
                      fontWeight: FontWeight.w400),
                  minFontSize: 12,
                ),
              ),
            ),
            Expanded(
              flex: Get.width <= mobilesize ? 8 : 9,
              child: Container(
                child: _DetectDevice(list),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _DetectDevice(List<dynamic> list) {
    if (Get.width <= mobilesize) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: _buildTimelinetest(list, true),
        ),
      );
    } else
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(120.0),
        child: Container(
          color: Color.fromARGB(255, 63, 61, 61),
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Center(
            child: _buildTimelinetest(list, false),
          ),
        ),
      );
  }

  Timeline _buildTimelinetest(List<dynamic> list, bool ismobile) {
    myindex(bool ismobile, int index) {
      if (ismobile)
        return index;
      else {
        return list.length - index - 1;
      }
    }

    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        direction: Axis.vertical,
        connectorTheme: ConnectorThemeData(
          color: Colors.yellow[200],
        ),
        indicatorTheme: IndicatorThemeData(color: Colors.amber),
      ),
      builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.alternating,
        oppositeContentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${Timelineitem.fromJson(list[myindex(ismobile, index)]).month} ${Timelineitem.fromJson(list[myindex(ismobile, index)]).year}',
                style: GoogleFonts.sarabun(
                  color: myindex(ismobile, index) == 0
                      ? Colors.amber
                      : Colors.blue[400],
                  fontSize: 16,
                  fontWeight: myindex(ismobile, index) == 0
                      ? FontWeight.w400
                      : FontWeight.w300,
                ),
              ),
              Center(
                child: Text(
                  '${Timelineitem.fromJson(list[myindex(ismobile, index)]).details}',
                  style: GoogleFonts.sarabun(
                    color: myindex(ismobile, index) == 0
                        ? Colors.amber
                        : Colors.white,
                    fontSize: 16,
                    fontWeight: myindex(ismobile, index) == 0
                        ? FontWeight.w400
                        : FontWeight.w200,
                  ),
                ),
              ),
            ],
          ),
        ),
        itemCount: list.length,
      ),
    );
  }
}
