import 'dart:convert';

import 'package:app2/myspace_module/model/timelines_model.dart';
import 'package:get/get.dart';

class TimelineController extends GetxController {
  final model = MyTimeline();

  List<dynamic> getList() {
    return jsonDecode(model.TIMELINE_JSON);
  }
}
