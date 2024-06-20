import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_driving/model/class_model/class_model.dart';
import 'package:new_project_driving/model/student_model/student_model.dart';
import 'package:progress_state_button/progress_button.dart';

class ClassController extends GetxController {
  final TextEditingController classTeacherController = TextEditingController();
  final TextEditingController classNameController = TextEditingController();
  final TextEditingController classNameEditController = TextEditingController();
  // final TextEditingController classIdController = TextEditingController();
  // final TextEditingController classIdEditController = TextEditingController();
  final TextEditingController classFeeController = TextEditingController();
  final TextEditingController classFeeEditController = TextEditingController();
  Rx<String> lastClassStatus = '......'.obs;
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  List<StudentModel> allstudentList = [];
  List<ClassModel> allclassList = [];
  List<ClassModel> classwiseSubjectList = [];
  Rxn<ClassModel> classModelData = Rxn<ClassModel>();
  RxBool ontapLeaveApplication = false.obs;

  int boysCount = 0;
  int girlsCount = 0;

  RxString className = ''.obs;
  // RxString classId = ''.obs;
  RxString classDocID = 'dd'.obs;
  RxString studentName = ''.obs;
  RxString studentDocID = ''.obs;

  // Register UI Part
  RxBool ontapClass = false.obs;
  RxBool ontapClassStudents = false.obs;
  RxString ontapClassDocID = 'dd'.obs;
  RxString ontapClassName = 'dd'.obs;
  RxString ontapClassWiseStudentDocID = 'dd'.obs;
  RxBool ontapStudentsDetail = false.obs;
  RxBool ontapStudentCreation = false.obs;
}
