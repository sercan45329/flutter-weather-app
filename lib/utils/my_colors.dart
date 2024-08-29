import 'package:flutter/material.dart';

class MyColors {
  static final MyColors _singleton = MyColors._internal();
  factory MyColors() {
    return _singleton;
  }

  MyColors._internal();

  Color myLightGray = Colors.grey.shade200;
  Color myGray = Colors.grey.shade400;
  Color myDarkGray = Colors.grey.shade600;
}
