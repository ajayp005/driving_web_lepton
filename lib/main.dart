import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_driving/firebase_options.dart';
import 'package:new_project_driving/view/controller/user_login_Controller/user_login_controller.dart';
import 'package:new_project_driving/view/splash_screen.dart';
import 'package:new_project_driving/view/utils/user_auth/user_credentials.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesHelper.initPrefs();

  runApp(const MyyApp());

  Get.put(UserLoginController());
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
