import 'package:flutter/material.dart';
import 'package:new_project_driving/view/splash_screen.dart';

void main(List<String> args) {
  runApp(const MyyApp());
}

class MyyApp extends StatelessWidget {
  const MyyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
