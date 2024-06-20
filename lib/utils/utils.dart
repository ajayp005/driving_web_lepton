import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<String> dateTimePicker(BuildContext context) async {
  DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2025));
  if (dateTime != null) {
    return DateFormat("dd-M-yyyy").format(dateTime);
  } else {
    return '';
  }
}