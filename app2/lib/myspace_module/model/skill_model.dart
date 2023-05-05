// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ItemSchema {
  String name;
  String src;
  Color color;
  int crossAx;
  int mainAx;
  List<String> lists;
  ItemSchema(
      {required this.name,
      required this.src,
      required this.color,
      required this.crossAx,
      required this.mainAx,
      this.lists = const []});
}
