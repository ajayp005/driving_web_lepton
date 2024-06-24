import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_driving/colors/colors.dart';
import 'package:new_project_driving/controller/course_controller/course_controller.dart';
import 'package:new_project_driving/fonts/text_widget.dart';
import 'package:new_project_driving/model/course_model/course_model.dart';
import 'package:new_project_driving/view/widget/custom_delete_showdialog/custom_delete_showdialog.dart';
import 'package:new_project_driving/view/widget/reusable_table_widgets/data_container.dart';

class AllCoursesDataList extends StatelessWidget {
  final CourseModel data;
  final int index;
  AllCoursesDataList({
    required this.data,
    required this.index,
    super.key,
  });

  final CourseController courseController = Get.put(CourseController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: index % 2 == 0
            ? const Color.fromARGB(255, 246, 246, 246)
            : Colors.blue[50],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: '  ${index + 1}'), //....................No
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
              flex: 2,
              child: TextFontWidget(
                text: '  ${data.courseType}',
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
              )), //................................................. courseType
          const SizedBox(
            width: 02,
          ),
          Expanded(
              flex: 2,
              child: TextFontWidget(
                text: '  ${data.tutor}',
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
              )), //................................................. tutor
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TextFontWidget(
                text: '  ${data.duration}',
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ), //........................................... duration
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: TextFontWidget(
              text: '  ${data.rate}',
              fontsize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ), //........................................... rate

          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // noticeController.noticeHeadingController.text = data.heading;
                  // noticeController.editnoticePublishedDateController.text =
                  //     data.publishedDate;
                  // noticeController.noticeSubjectController.text = data.subject;
                  // noticeController.editnoticeDateofoccationController.text =
                  //     data.dateofoccation;
                  // noticeController.noticevenueController.text = data.venue;
                  // noticeController.editnoticeDateofSubmissionController.text =
                  //     data.dateOfSubmission;
                  // noticeController.noticeGuestController.text = data.chiefGuest;
                  // noticeController.noticeSignedByController.text =
                  //     data.signedBy;
                  // editFunctionOfNotice(context, data);
                },
                child: DataContainerWidget(
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    index: index,
                    headerTitle: ' Update 🖋️'),
              ),
            ),
          ), //........................................... edit
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  customDeleteShowDialog(
                    context: context,
                    onTap: () {
                      courseController.deleteCourse(
                        data.courseId,
                      );
                      Navigator.pop(context);
                    },
                  );
                },
                child: DataContainerWidget(
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    index: index,
                    headerTitle: ' Remove 🗑️'),
              ),
            ),
          ), //........................................... delete
        ],
      ),
    );
  }
}