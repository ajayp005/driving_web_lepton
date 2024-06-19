import 'dart:developer';

import 'package:flutter/material.dart';

var selectedUserType;

class UserTypeDropDownButton extends StatefulWidget {
  const UserTypeDropDownButton({super.key});

  @override
  State<UserTypeDropDownButton> createState() => _UserTypeDropDownButtonState();
}

class _UserTypeDropDownButtonState extends State<UserTypeDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedUserType,
      hint: const Text('Select user type'),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
      ),
      items: const [
        DropdownMenuItem(
          value: 'teacher',
          child: Text('Teacher'),
        ),
        DropdownMenuItem(
          value: 'student',
          child: Text('Student'),
        ),
      ],
      onChanged: (val) {
        log('Selected user type: $val');
        // Handle the selected user type as needed
        setState(() {
          selectedUserType = val;
        });
      },
    );
  }
}
