// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:new_project_driving/colors/colors.dart';

class DashboardTextFontWidget extends StatelessWidget {
  DashboardTextFontWidget({
    required this.title,
    super.key,
  });
  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 16, color: cBlack.withOpacity(0.7)),
    );
  }
}
