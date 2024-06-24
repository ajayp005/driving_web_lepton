// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:new_project_driving/colors/colors.dart';
import 'package:new_project_driving/fonts/text_widget.dart';

class BlueContainerWidget extends StatelessWidget {
  String title;
  double fontSize;
  FontWeight? fontWeight;
  Color color;
  double? width;

  BlueContainerWidget(
      {required this.title,
      required this.fontSize,
      required this.color,
      this.width,
      this.fontWeight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      width: width ?? MediaQuery.of(context).size.height * 0.16,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Center(
        child: TextFontWidgetRouter(
            text: title,
            fontsize: fontSize,
            color: cWhite,
            fontWeight: fontWeight),
      ),
    );
  }
}
