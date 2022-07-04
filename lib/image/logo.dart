import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import '../../../image/app_images.dart';

@override
Widget logo() {
  return Container(
    margin: const EdgeInsets.all(10),
    width: 100,
    height: 100,
    child: Image.asset(AppImages.logo),
  );
}