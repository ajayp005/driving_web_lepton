import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_driving/colors/colors.dart';
import 'package:new_project_driving/controller/notice_controller/notice_controller.dart';
import 'package:new_project_driving/fonts/text_widget.dart';
import 'package:new_project_driving/model/notice_model/notice_model.dart';
import 'package:new_project_driving/view/users/admin/screens/notice/notice_edit.dart';
import 'package:new_project_driving/view/widget/custom_delete_showdialog/custom_delete_showdialog.dart';
import 'package:new_project_driving/view/widget/reusable_table_widgets/data_container.dart';

class AllNoticeDataList extends StatelessWidget {
  final NoticeModel data;
  final int index;
  AllNoticeDataList({
    required this.data,
    required this.index,
    super.key,
  });

  final NoticeController noticeController = Get.put(NoticeController());
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
              flex: 3,
              child: TextFontWidget(
                text: '  ${data.heading}',
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
              )), //................................................. heading
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TextFontWidget(
                text: '  ${data.subject}',
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ), //........................................... subject
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TextFontWidget(
                text: '  ${data.publishedDate}',
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ), //........................................... subject
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: TextFontWidget(
              text: '  ${data.signedBy}',
              fontsize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ), //........................................... signedBy
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  noticeController.noticeHeadingController.text = data.heading;
                  noticeController.noticePublishedDateController.text =
                      data.publishedDate;
                  noticeController.noticeSubjectController.text = data.subject;
                  noticeController.noticeSignedByController.text =
                      data.signedBy;
                  editFunctionOfNotice(context, data);
                },
                child: DataContainerWidget(
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    // width: 150,
                    index: index,
                    headerTitle: ' Update 🖋️'),
              ),
            ),
          ), //........................................... edit
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  customDeleteShowDialog(
                    context: context,
                    onTap: () {
                      noticeController.deleteNotice(
                        data.noticeId,
                        context,
                      );
                      Navigator.pop(context);
                    },
                  );
                },
                child: DataContainerWidget(
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    // width: 150,
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
