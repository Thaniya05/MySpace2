import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';

class Aboutme {
  String aboutme =
      "มีความถนัดทางด้านการใช้ภาษา Javascript , Typescript โดยทำในส่วนของการแสดงผลโดยใช้ HTML, React และทำในส่วนของการสร้าง API ที่ใช้ในการติดต่อแลกเปลี่ยนข้อมูลระหว่างส่วนของผู้ใช้งานกับ Database โดยใช้ NodeJS เป็นหลัก ซึ่งพร้อมจะเรียนรู้และศึกษาเครื่องมือใหม่ๆอยู่เสมอ ปัจจุบันสนใจและกำลังศึกษาการทำ Mobile Application รวมไปถึงการสร้าง Web Application โดยใช้ Flutter";

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Colors.pinkAccent,
      Colors.deepPurpleAccent,
      Colors.red,
    ],
  ).createShader(
    Rect.fromLTWH(0.0, 0.0, 200.0, 5.0),
  );
}
