import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_project_driving/constant/const.dart';
import 'package:new_project_driving/controller/user_login_Controller/user_login_controller.dart';
import 'package:new_project_driving/view/home/home_page/home_screen/home_screen.dart';
import 'package:new_project_driving/view/home/main_screen.dart';
import 'package:new_project_driving/model/student_model/student_model.dart';
import 'package:new_project_driving/model/teacher_model/teacher_model.dart';
import 'package:new_project_driving/view/splash_screen/splash_screen.dart';
import 'package:new_project_driving/utils/firebase/firebase.dart';
import 'package:new_project_driving/utils/user_auth/user_credentials.dart';

class UserAuthController extends GetxController {
  RxBool loginAuthState = false.obs;
  Future<void> checkSavedLoginAuth() async {
    if (kDebugMode) {}
    FirebaseAuth auth = FirebaseAuth.instance;

    UserCredentialsController.userRole =
        SharedPreferencesHelper.getString(SharedPreferencesHelper.userRoleKey);
    UserCredentialsController.schoolName = SharedPreferencesHelper.getString(
        SharedPreferencesHelper.schoolNameKey);
    UserCredentialsController.userloginKey =
        SharedPreferencesHelper.getString(SharedPreferencesHelper.userloginKey);
    UserCredentialsController.currentUserDocid =
        SharedPreferencesHelper.getString(
            SharedPreferencesHelper.currentUserDocid);

    if (auth.currentUser == null) {
      if (kDebugMode) {
        print("Google Auth null");
      }
      Get.offAll(() => const MainScreen());
    } else {
      if (UserCredentialsController.userRole == 'admin') {
        log("userlogin ID :  ${FirebaseAuth.instance.currentUser?.uid}");
        log("userrole :  ${UserCredentialsController.userRole}");
        log("userloginKey :  ${UserCredentialsController.userloginKey}");
        log("currentUserDocid :  ${UserCredentialsController.currentUserDocid}");
        await checkAdmin();
        loginAuthState.value = true;
        if (Get.find<UserLoginController>().logined.value == true) {
          Get.find<UserLoginController>()
              .loginSaveData()
              .then((value) => Get.offAll(() => SplashScreen()));
        } else {
          log("Get.offAll(() =>  AdminHomeScreen());  GOING TO ROUTE /HomeScreen");
          Get.offAll(() => HomeScreen());
        }
      } else if (UserCredentialsController.userRole == 'student') {
        await checkStudent(auth);
      } else if (UserCredentialsController.userRole == 'teacher') {
        await checkTeacher(auth);
      } else {
        if (kDebugMode) {
          print("shared pref Auth null");
        }
        Get.offAll(() => const MainScreen());
      }
    }
  }
}

Future<void> checkAdmin() async {
  if (UserCredentialsController.userRole == "" &&
      UserCredentialsController.userloginKey == "" &&
      UserCredentialsController.currentUserDocid == '') {
    logoutUser();

    Get.offAll(() => SplashScreen());
  }
}

Future<void> checkStudent(FirebaseAuth auth) async {
  log("userlogin ID :  ${FirebaseAuth.instance.currentUser?.uid}");
  log("userrole :  ${UserCredentialsController.userRole}");
  final studentData = await server
      .collection('DrivingSchoolCollection')
      .doc(UserCredentialsController.schoolId)
      .collection('Students')
      .doc(auth.currentUser?.uid)
      .get();

  if (studentData.data() != null) {
    UserCredentialsController.studentModel =
        StudentModel.fromMap(studentData.data()!);
    if (Get.find<UserLoginController>().logined.value == true) {
      Get.find<UserLoginController>()
          .loginSaveData()
          .then((value) => Get.offAll(() => SplashScreen()));
    } else {
      log("Get.offAll(() => const StudentHomeScreen());");
      // Get.offAll(() => const StudentHomeScreen());
      Get.offAll(() => HomeScreen());
    }
  } else {
    showToast(msg: "Please login again");
    Get.offAll(() => const MainScreen());
    // Get.off(() => const DujoLoginScren());
  }
}

////////////////////////////////////////////////////////////////////////
Future<void> checkTeacher(FirebaseAuth auth) async {
  log("userlogin ID :  ${FirebaseAuth.instance.currentUser?.uid}");
  log("userrole :  ${UserCredentialsController.userRole}");
  final teacherModel = await server
      .collection('DrivingSchoolCollection')
      .doc(UserCredentialsController.schoolId)
      .collection('Teachers')
      .doc(auth.currentUser?.uid)
      .get();

  if (teacherModel.data() != null) {
    UserCredentialsController.teacherModel =
        TeacherModel.fromMap(teacherModel.data()!);
    if (Get.find<UserLoginController>().logined.value == true) {
      Get.find<UserLoginController>()
          .loginSaveData()
          .then((value) => Get.offAll(() => SplashScreen()));
    } else {
      log("Get.offAll(() => const TeachersHomeScreen());");
      // Get.offAll(() => const TeachersHomeScreen());
      Get.offAll(() => HomeScreen());
    }
  } else {
    showToast(msg: "Please login again");
    Get.offAll(() => const MainScreen());
  }
}
