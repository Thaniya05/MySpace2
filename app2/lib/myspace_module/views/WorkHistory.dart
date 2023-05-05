import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../constant.dart' as constant;

import 'package:google_fonts/google_fonts.dart';

class WorkHistory extends StatelessWidget {
  const WorkHistory({super.key});

  @override
  Widget build(BuildContext context) {
    double widthsize = 0.6;
    double detailsize = 20.0;
    if (context.isPhone) {
      widthsize = 0.8;
      detailsize = 16.0;
    } else {
      widthsize = 0.6;
      detailsize = 20.0;
    }
    return Container(
      //color: Color(0xff1C4B5F),
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildBlank(),
            Container(
              padding: EdgeInsets.all(20.0),
              child: AutoSizeText(
                "Work History",
                minFontSize: 12,
                maxLines: 1,
                style: GoogleFonts.sarabun(
                  fontSize: context.isPhone ? 34 : 40,
                  color: Colors.amber,
                ),
              ),
            ),
            _buildBlank(),
            _buildHistoryWork(
              context,
              widthsize,
              detailsize,
              details: constant.MYPROJECT_MYSPACE,
              topic: 'MySpace',
              alpha: true,
              mini: true,
              isfpic: false,
              pathpic: '',
            ),
            _buildBlank(),
            _buildHistoryWork(context, widthsize, detailsize,
                details: constant.MYPROJECT_WEBAPP,
                topic: 'Web Application',
                work: true,
                success: true,
                progress: true,
                isfpic: true,
                pathpic: 'assets/pic/webapp.jpg',
                width: 500,
                height: 350),
            _buildBlank(),
            _buildHistoryWork(
              context,
              widthsize,
              detailsize,
              details: constant.MYPROJECT_DEMOGAME,
              topic: 'Game Demo',
              mini: true,
              success: true,
              isfpic: true,
              pathpic: 'assets/pic/gamedemo.jpg',
            ),
            _buildBlank(),
            _buildHistoryWork(
              context,
              widthsize,
              detailsize,
              details: constant.MYPROJECT_GAME24,
              topic: 'Game 24',
              alpha: true,
              coming: true,
              isfpic: false,
              pathpic: '',
            ),
            _buildBlank(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildHistorys(
    List<String> _lists,
    BuildContext context,
    double widthsize,
    double detailsize,
  ) {
    List<Widget> _smt = [];

    return _smt;
  }

  Container _buildHistoryWork(
    BuildContext context,
    double widthsize,
    double detailsize, {
    required String topic,
    required String details,
    bool success = false,
    bool progress = false,
    bool coming = false,
    bool alpha = false,
    bool mini = false,
    bool work = false,
    bool isfpic = false,
    String pathpic = "",
    double height = 200,
    double width = 200,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * widthsize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                topic,
                style:
                    GoogleFonts.sarabun(fontSize: 30, color: Color(0xff53f6aa)),
              ),
              Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
            ],
          ),
          _buildBlank(5),
          _buildChips(
            success: success,
            progress: progress,
            comingsoon: coming,
            alpha: alpha,
            miniproject: mini,
            work: work,
          ),
          _buildBlank(5),
          Card(
            color: Color.fromARGB(255, 63, 113, 134),
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildBlank(10),
                  AutoSizeText(
                    details,
                    style: GoogleFonts.sarabun(
                      color: Colors.white,
                      fontSize: detailsize,
                      fontWeight: FontWeight.w300,
                    ),
                    minFontSize: 16,
                  ),
                  _buildBlank(10),
                  _buildImg(
                    ispic: isfpic,
                    path: pathpic,
                    height: height,
                    width: width,
                  ),
                  _buildBlank(15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildImg(
      {bool ispic = false,
      String path = '',
      double height = 200,
      double width = 200}) {
    if (ispic) {
      return Container(
        child: Image.asset(path),
        height: height,
        width: width,
      );
    } else {
      return Container();
    }
  }

  Row _buildChips({
    bool success = false,
    bool progress = false,
    bool comingsoon = false,
    bool alpha = false,
    bool miniproject = false,
    bool work = false,
  }) {
    List<Widget> _list = [];
    if (success) {
      _list.add(_buildSuccessChip());
      _list.add(_buildBlank(2));
    }
    if (progress) {
      _list.add(_buildinProgressChip());
      _list.add(_buildBlank(2));
    }
    if (comingsoon) {
      _list.add(_buildinCommingSoonChip());
      _list.add(_buildBlank(2));
    }
    if (alpha) {
      _list.add(_buildAlphaChip());
      _list.add(_buildBlank(2));
    }
    if (miniproject) {
      _list.add(_buildminiProjectChip());
      _list.add(_buildBlank(2));
    }
    if (work) {
      _list.add(_buildWorkChip());
      _list.add(_buildBlank(2));
    }

    return Row(
      children: _list,
    );
  }

  Chip _buildSuccessChip() {
    return Chip(
      label: Text(
        "Success",
        style: GoogleFonts.sarabun(fontSize: 14, color: Colors.black),
      ),
      elevation: 7.0,
      backgroundColor: Colors.greenAccent,
      padding: EdgeInsets.all(5.0),
    );
  }

  Chip _buildinProgressChip() {
    return Chip(
      label: Text(
        "In progress",
        style: GoogleFonts.sarabun(fontSize: 14, color: Colors.black),
      ),
      elevation: 7.0,
      backgroundColor: Colors.amber,
      padding: EdgeInsets.all(5.0),
    );
  }

  Chip _buildinCommingSoonChip() {
    return Chip(
      label: Text(
        "Coming soon",
        style: GoogleFonts.sarabun(fontSize: 14, color: Colors.black),
      ),
      elevation: 7.0,
      backgroundColor: Colors.lightBlueAccent,
      padding: EdgeInsets.all(5.0),
    );
  }

  Chip _buildAlphaChip() {
    return Chip(
      label: Text(
        "Alpha",
        style: GoogleFonts.sarabun(fontSize: 14, color: Colors.black),
      ),
      elevation: 7.0,
      backgroundColor: Colors.redAccent,
      padding: EdgeInsets.all(5.0),
    );
  }

  Chip _buildminiProjectChip() {
    return Chip(
      label: Text(
        "Mini Project",
        style: GoogleFonts.sarabun(fontSize: 14, color: Colors.black),
      ),
      elevation: 7.0,
      backgroundColor: Colors.orange,
      padding: EdgeInsets.all(5.0),
    );
  }

  Chip _buildWorkChip() {
    return Chip(
      label: Text(
        "Work",
        style: GoogleFonts.sarabun(fontSize: 14, color: Colors.black),
      ),
      elevation: 7.0,
      backgroundColor: Colors.limeAccent,
      padding: EdgeInsets.all(5.0),
    );
  }

  Padding _buildBlank([double d = 20.0]) {
    return Padding(padding: EdgeInsets.all(d));
  }
}

class HistoryJSON {
  late final String topic;
  late final String details;
  bool ispic = false;
  late final String pathpic;
  bool success = false;
  bool progress = false;
  bool coming = false;
  bool alpha = false;
  bool mini = false;
  bool work = false;

  HistoryJSON(this.topic, this.details, this.pathpic, this.ispic, this.success,
      this.progress, this.coming, this.alpha, this.mini, this.work);

  HistoryJSON.fromJson(Map<String, dynamic> json)
      : topic = json['topic'],
        details = json['details'],
        ispic = json['ispic'],
        pathpic = json['pathpic'],
        success = json['success'],
        progress = json['progress'],
        coming = json['coming'],
        alpha = json['alpha'],
        mini = json['mini'],
        work = json['work'];
}
