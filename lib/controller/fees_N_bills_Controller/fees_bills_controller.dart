import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_project_driving/constant/const.dart';
import 'package:new_project_driving/constant/constant.validate.dart';
import 'package:new_project_driving/controller/notification_controller/notification_Controller.dart';
import 'package:new_project_driving/model/fees_model/fees_model_controller.dart';
import 'package:new_project_driving/model/student_model/student_model.dart';
import 'package:new_project_driving/utils/firebase/firebase.dart';
import 'package:new_project_driving/utils/user_auth/user_credentials.dart';
import 'package:new_project_driving/view/widget/notification_color/notification_color_widget.dart';
import 'package:progress_state_button/progress_button.dart';

class FeesAndBillsController extends GetxController {
  RxBool selectAllClass = false.obs;
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  RxBool ontapCreateFees = false.obs;
  RxBool ontapviewclasswiseFees = false.obs;
  RxInt classinitalFee = 0.obs;
  RxInt studentClassWiseCount = 0.obs;
  List<StudentModel> studentData = [];

  TextEditingController feestypeNameContoller = TextEditingController();
  TextEditingController feesContoller = TextEditingController();
  TextEditingController feesDueContoller = TextEditingController();

  TextEditingController seletedFeeDateContoller = TextEditingController();
  TextEditingController selectedFeeMonthContoller = TextEditingController();
  final Rxn<DateTime> _selectedFeeDate = Rxn<DateTime>();
  final Rxn<DateTime> _selectedMonth = Rxn<DateTime>();
  selectMonth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedMonth.value ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
      // builder: (context, child) {},
    );
    if (picked != null) {
      _selectedMonth.value = picked;
      DateTime parseDate = DateTime.parse(_selectedMonth.value.toString());
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      String formatted = formatter.format(parseDate);

      selectedFeeMonthContoller.text = formatted.toString();
    }
  }

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedFeeDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _selectedFeeDate.value = picked;
      DateTime parseDate = DateTime.parse(_selectedFeeDate.value.toString());
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      String formatted = formatter.format(parseDate);

      seletedFeeDateContoller.text = formatted.toString();
    }
  }

  Future<void> feesCollection(
      {required ClassFeesModel data,
      required String docid,
      required String feeDocid}) async {
    await server
        .collection('DrivingSchoolCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('FeesCollection')
        .doc(docid)
        .set({'docid': docid}, SetOptions(merge: true));
    await server
        .collection('DrivingSchoolCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('FeesCollection')
        .doc(docid)
        .collection(docid)
        .doc(feeDocid)
        .set(data.toMap(), SetOptions(merge: true));
  }

  Future<void> getStudentClassWiseCount(String classDocID,
      String feeCollectionID, int fee, String dataDocID) async {
    studentData.clear();

    await server
        .collection('DrivingSchoolCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('classes')
        .doc(classDocID)
        .collection('Students')
        .get()
        .then((value) async {
      final list =
          value.docs.map((e) => StudentModel.fromMap(e.data())).toList();
      studentData.addAll(list);
      for (var i = 0; i < value.docs.length; i++) {
        print('Student names ${value.docs[i].data()['studentemail']}');

        await server
            .collection('DrivingSchoolCollection')
            .doc(UserCredentialsController.schoolId)
            .collection('FeesCollection')
            .doc(feeCollectionID)
            .collection(feeCollectionID)
            .doc(dataDocID)
            .collection('Students')
            .doc(studentData[i].docid)
            .set({
          'docid': studentData[i].docid,
          'StudentName': studentData[i].studentName,
          'fee': fee,
          'feepaid': false,
          'paid': 0,
          'editFee': false,
        }, SetOptions(merge: true));
      }
    }).then((value) async {
      await getFeeTotalAmount(feeCollectionID, fee, dataDocID);
    });
  }

  Future<void> getFeeTotalAmount(
    String feeCollectionID,
    int fee,
    String dateDocID,
  ) async {
    await server
        .collection('DrivingSchoolCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('FeesCollection')
        .doc(feeCollectionID)
        .collection(feeCollectionID)
        .doc(dateDocID)
        .collection('Students')
        .get()
        .then((value) async {
      await server
          .collection('DrivingSchoolCollection')
          .doc(UserCredentialsController.schoolId)
          .collection('FeesCollection')
          .doc(feeCollectionID)
          .collection(feeCollectionID)
          .doc(dateDocID)
          .set({
        'totalStudents': value.docs.length,
        'totalAmount': fee * value.docs.length,
        'collectedAmount': 0,
        'pendingAmount': 0,
      }, SetOptions(merge: true));
    });
  }

  RxList feeMonthList = [].obs;
  RxList feeDateList = [].obs;

  RxString feeMonthDatadowpdown = 'd'.obs;
  RxString feeMonthData = 'd'.obs;
  RxString feeDateData = 'd'.obs;
  RxString feetypeName = ''.obs;
  RxString feeDueDateName = ''.obs;
  RxBool feessendingMessage = false.obs;

  Future<List> fetchFeeMonthData() async {
    await server
        .collection('DrivingSchoolCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('FeesCollection')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        feeMonthList.add(value.docs[i]['docid']);
      }
    });
    return feeMonthList;
  }

  Future<List> fetchFeeDateData() async {
    await server
        .collection('DrivingSchoolCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('FeesCollection')
        .doc(feeMonthData.value)
        .collection(feeMonthData.value)
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        feeDateList.add(value.docs[i]['docid']);
      }
    });
    return feeDateList;
  }

  pendingAmountCalculate(String dateDocID) async {
    int paidFee = 0;

    int studenttotalAmount = 0;

    await server
        .collection('DrivingSchoolCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('FeesCollection')
        .doc(feeMonthData.value)
        .collection(feeMonthData.value)
        .doc(dateDocID)
        .collection('Students')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        final int totaladdesult = value.docs[i].data()['paid'];

        studenttotalAmount = studenttotalAmount + totaladdesult;
      }

      paidFee = studenttotalAmount;
      await server
          .collection('DrivingSchoolCollection')
          .doc(UserCredentialsController.schoolId)
          .collection('FeesCollection')
          .doc(feeMonthData.value)
          .collection(feeMonthData.value)
          .doc(dateDocID)
          .get()
          .then((value) async {
        int totalAmount = value.data()?['totalAmount'] ?? 0;
        int result = totalAmount - paidFee;

        await server
            .collection('DrivingSchoolCollection')
            .doc(UserCredentialsController.schoolId)
            .collection('FeesCollection')
            .doc(feeMonthData.value)
            .collection(feeMonthData.value)
            .doc(dateDocID)
            .update({'pendingAmount': result});
      });

      // .update({'totalAmount': totalResult.value});
    });
  }

  int initialFeeResult = 0;
  int totalResult = 0;

  bugCalculateTotalamount(String dateDocID, int totalStudent) async {
    int totalAmount = 0;
    await server
        .collection('DrivingSchoolCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('FeesCollection')
        .doc(feeMonthData.value)
        .collection(feeMonthData.value)
        .doc(dateDocID)
        .collection('Students')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        final int totaladdesult = value.docs[i].data()['fee'];

        totalAmount = totalAmount + totaladdesult;
      }

      totalResult = totalAmount;

      await server
          .collection('DrivingSchoolCollection')
          .doc(UserCredentialsController.schoolId)
          .collection('FeesCollection')
          .doc(feeMonthData.value)
          .collection(feeMonthData.value)
          .doc(dateDocID)
          .update({'totalAmount': totalResult});
    });
  }

  collectedAmountCalculate(String dateDocID) async {
    int collectedFee = 0;

    int totalAmount = 0;

    await server
        .collection('DrivingSchoolCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('FeesCollection')
        .doc(feeMonthData.value)
        .collection(feeMonthData.value)
        .doc(dateDocID)
        .collection('Students')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        final int totaladdesult = value.docs[i].data()['paid'];

        totalAmount = totalAmount + totaladdesult;
      }

      collectedFee = totalAmount;
      await server
          .collection('DrivingSchoolCollection')
          .doc(UserCredentialsController.schoolId)
          .collection('FeesCollection')
          .doc(feeMonthData.value)
          .collection(feeMonthData.value)
          .doc(dateDocID)
          .get()
          .then((value) async {
        await server
            .collection('DrivingSchoolCollection')
            .doc(UserCredentialsController.schoolId)
            .collection('FeesCollection')
            .doc(feeMonthData.value)
            .collection(feeMonthData.value)
            .doc(dateDocID)
            .update({'collectedAmount': collectedFee});
      });

      // .update({'totalAmount': totalResult.value});
    });
  }

  RxString currentStudentFee = ''.obs;
  RxBool sendMessageForUnPaidStudentandParentsbool = false.obs;
  Future<void> sendMessageForUnPaidStudents() async {
    await server
        .collection('DrivingSchoolCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('FeesCollection')
        .doc(feeMonthData.value)
        .collection(feeMonthData.value)
        .doc(feeDateData.value)
        .collection('Students')
        .get()
        .then((value) async {
      showToast(msg: "Please wait while a sec ...");
      for (var i = 0; i < value.docs.length; i++) {
        int studentFee = value.docs[i]['fee'];
        if (value.docs[i]['feepaid'] == false) {
          server
              .collection('DrivingSchoolCollection')
              .doc(UserCredentialsController.schoolId)
              .collection('AllStudents')
              .doc(value.docs[i]['docid'])
              .get()
              .then((value) async {
            Get.find<NotificationController>().userStudentNotification(
                studentID: value['docid'],
                icon: WarningNotifierSetup().icon,
                messageText:
                    'Your ${Get.find<FeesAndBillsController>().feetypeName.value} rupees $studentFee /- is due on ${stringTimeToDateConvert(Get.find<FeesAndBillsController>().feeDueDateName.value)} ,Please pay on or before the due date.\nനിങ്ങളുടെ ${Get.find<FeesAndBillsController>().feetypeName.value} ആയ $studentFee /- രൂപ, ദയവായി ${stringTimeToDateConvert(Get.find<FeesAndBillsController>().feeDueDateName.value)} തിയതിക്കുള്ളിൽ അടക്കേണ്ടതാണ്',
                headerText:
                    "${Get.find<FeesAndBillsController>().feetypeName.value} Due Fee",
                whiteshadeColor: WarningNotifierSetup().whiteshadeColor,
                containerColor: WarningNotifierSetup().containerColor);
          });
        }
      }
    }).then((value) {
      showToast(msg: "Notification Sended !!");
      sendMessageForUnPaidStudentandParentsbool.value = false;
    });
  }
}
