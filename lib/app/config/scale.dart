import 'package:flutter/material.dart';

Size size = WidgetsBinding.instance.window.physicalSize;
double width = size.width;
double height = size.height;

double scale(double size) {
  double guidelineBaseRatio = 2.165;
  return size / (guidelineBaseRatio / (height / width));
}
