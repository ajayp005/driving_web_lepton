import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_driving/colors/colors.dart';
import 'package:new_project_driving/controller/fees_N_bills_Controller/fees_bills_controller.dart';
import 'package:new_project_driving/fonts/text_widget.dart';
import 'package:new_project_driving/utils/firebase/firebase.dart';
import 'package:new_project_driving/utils/user_auth/user_credentials.dart';
import 'package:new_project_driving/view/users/admin/screens/fess_and_bills/fees_data_list.dart';
import 'package:new_project_driving/view/widget/button_container_widget/button_container_widget.dart';
import 'package:new_project_driving/view/widget/loading_widget/loading_widget.dart';
import 'package:new_project_driving/view/widget/responsive/responsive.dart';
import 'package:new_project_driving/view/widget/reusable_table_widgets/category_table_header.dart';
import 'package:new_project_driving/view/widget/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class FeesAndBillsList extends StatelessWidget {
  const FeesAndBillsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection:
          ResponsiveWebSite.isMobile(context) ? Axis.horizontal : Axis.vertical,
      child: Container(
        color: screenContainerbackgroundColor,
        height: 1000,
        width: ResponsiveWebSite.isDesktop(context) ? double.infinity : 1200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: TextFontWidget(
                text: 'Fee Details',
                fontsize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  const RouteSelectedTextContainer(
                      width: 140, title: 'Fees Deatils'),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      Get.find<FeesAndBillsController>()
                          .sendMessageForUnPaidStudentandParentsbool
                          .value = true;
                      await Get.find<FeesAndBillsController>()
                          .sendMessageForUnPaidStudents();
                    },
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Get.find<FeesAndBillsController>()
                                    .sendMessageForUnPaidStudentandParentsbool
                                    .value ==
                                true
                            ? const SizedBox(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : ButtonContainerWidget(
                                curving: 0,
                                colorindex: 6,
                                height: 35,
                                width: 220,
                                child: const Center(
                                  child: TextFontWidgetRouter(
                                    text: 'Send Message For Unpaid Students',
                                    fontsize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: cWhite,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: cWhite,
                width: double.infinity,
                height: ResponsiveWebSite.isMobile(context) ? 800 : 500,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Container(
                        color: cWhite,
                        height: 40,
                        child: const Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: CatrgoryTableHeaderWidget(
                                    headerTitle: 'No')),
                            SizedBox(
                              width: 02,
                            ),
                            Expanded(
                                flex: 4,
                                child: CatrgoryTableHeaderWidget(
                                    headerTitle: 'Student Name')),
                            SizedBox(
                              width: 02,
                            ),
                            Expanded(
                                flex: 2,
                                child: CatrgoryTableHeaderWidget(
                                    headerTitle: 'Class')),
                            SizedBox(
                              width: 02,
                            ),
                            Expanded(
                                flex: 2,
                                child: CatrgoryTableHeaderWidget(
                                    headerTitle: 'Fee')),
                            SizedBox(
                              width: 02,
                            ),
                            Expanded(
                                flex: 2,
                                child: CatrgoryTableHeaderWidget(
                                    headerTitle: 'status')),
                            SizedBox(
                              width: 02,
                            ),
                            Expanded(
                                flex: 2,
                                child: CatrgoryTableHeaderWidget(
                                    headerTitle: 'Paid')),
                            SizedBox(
                              width: 02,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: StreamBuilder(
                            stream: server
                                .collection('SchoolListCollection')
                                .doc(UserCredentialsController.schoolId)
                                .collection('FeesCollection')
                                .orderBy(
                                  'feepaid',
                                )
                                .snapshots(),
                            builder: (context, snaps) {
                              if (snaps.hasData) {
                                return ListView.separated(
                                    itemBuilder: (context, index) {
                                      final data =
                                          snaps.data!.docs[index].data();
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: ClassWiseFeesDataListContainer(
                                            studentFee: data['fee'],
                                            studentdata: data,
                                            index: index),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 02,
                                      );
                                    },
                                    itemCount: snaps.data!.docs.length);
                              } else {
                                return const LoadingWidget();
                              }
                            }))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
