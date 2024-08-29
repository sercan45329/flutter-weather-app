import 'package:flutter/widgets.dart';

class PhysicalScreen {
  PhysicalScreen._privateConstructor();

  static final PhysicalScreen _instance = PhysicalScreen._privateConstructor();

  factory PhysicalScreen() {
    return _instance;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
