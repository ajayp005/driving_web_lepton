import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_driving/constant/constant.validate.dart';
import 'package:new_project_driving/controller/notice_controller/notice_controller.dart';
import 'package:new_project_driving/model/notice_model/notice_model.dart';
import 'package:new_project_driving/view/widget/custom_showdialouge/custom_showdialouge.dart';
import 'package:new_project_driving/view/widget/text_formfiled_container/textformfiled_blue_container.dart';

editFunctionOfNotice(BuildContext context, NoticeModel data) {
  final NoticeController noticeController = Get.put(NoticeController());
  customShowDilogBox(
      context: context,
      title: 'Edit',
      children: [
        Form(
          key: noticeController.formKey,
          child: Column(
            children: [
              TextFormFiledHeightnoColor(
                  validator: checkFieldEmpty,
                  controller: noticeController.noticeHeadingController,
                  hintText: data.heading,
                  title: 'Heading'),
              TextFormFiledHeightnoColor(
                  onTap: () async {
                    noticeController.noticePublishedDateController.text =
                        await dateTimePicker(context);
                  },
                  validator: checkFieldDateIsValid,
                  controller: noticeController.noticePublishedDateController,
                  hintText: data.publishedDate,
                  title: 'Published Date'),
              TextFormFiledHeightnoColor(
                  validator: checkFieldEmpty,
                  controller: noticeController.noticeSubjectController,
                  hintText: data.subject,
                  title: 'Subject'),
              TextFormFiledHeightnoColor(
                  validator: checkFieldEmpty,
                  controller: noticeController.noticeSignedByController,
                  hintText: data.signedBy,
                  title: 'Signed by'),
            ],
          ),
        ),
      ],
      doyouwantActionButton: true,
      actiononTapfuction: () {
        if (noticeController.formKey.currentState!.validate()) {
          noticeController.updateNotice(
            data.noticeId,
            context,
          );
        }
      },
      actiontext: 'Update');
}
