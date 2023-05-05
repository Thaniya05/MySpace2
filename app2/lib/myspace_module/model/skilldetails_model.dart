// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class SkillDetailsSchema {
  String topic;
  String location;
  String time;
  List<dynamic>? details;
  SkillDetailsSchema({
    required this.topic,
    required this.location,
    required this.time,
    this.details,
  });
}

class Detail {
  final String details;

  Detail(this.details);
}

class myPic {
  final String topic;
  final String src;
  List<Mytag>? mylist;

  myPic(this.topic, this.src, this.mylist);
}

class Mytag {
  String name;
  late Color color;

  Mytag({
    required this.name,
  }) {
    if (this.name == "C#")
      this.color = Colors.purple;
    else
      this.color = Colors.white;
  }
}
