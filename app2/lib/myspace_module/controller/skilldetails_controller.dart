import 'package:flutter/material.dart';
import "package:get/get.dart";

List testnaja = [
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

class SkillDetailsController extends GetxController {
  List test = [
    {'type': "topic", "details": "abcd"},
    {'type': "location", "location": "NewNN co,ltd", "time": "2022-2023"},
    {'type': "card", "details": testnaja},
    {'type': "blank", "size": 5.0}
  ];
}
