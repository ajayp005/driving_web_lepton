import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:new_project_driving/view/colors/colors.dart';

class SignUpTextFormFieldWidget extends StatelessWidget {
  const SignUpTextFormFieldWidget({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.function,
    required this.icon,
    this.obscureText,
    this.hintText,
    this.maxLength,
    this.keyboardType,
    this.onTapFunction,
  });

  final TextEditingController textEditingController;
  final String labelText;
  final String? Function(String? fieldContent) function;
  final IconData icon;
  final bool? obscureText;
  final String? hintText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.w, left: 15.w, right: 15.w, top: 15.w),
      child: TextFormField(
        onTap: onTapFunction,
        // obscureText: obscureText,
        keyboardType: keyboardType,
        maxLength: maxLength,
        validator: function,
        controller: textEditingController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            icon: Icon(
              icon,
              color: const Color.fromARGB(221, 28, 9, 110),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: const TextStyle(color: cBlack)),
      ),
    );
  }
}
