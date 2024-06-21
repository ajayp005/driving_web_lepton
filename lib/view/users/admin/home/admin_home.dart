import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project_driving/colors/colors.dart';
import 'package:new_project_driving/fonts/google_poppins_widget.dart';
import 'package:new_project_driving/fonts/text_widget.dart';
import 'package:new_project_driving/info/info.dart';
import 'package:new_project_driving/utils/firebase/firebase.dart';
import 'package:new_project_driving/utils/user_auth/user_credentials.dart';
import 'package:new_project_driving/view/users/admin/app_bar/admin_appBar.dart';
import 'package:new_project_driving/view/users/admin/drawer/drawer_pages.dart';
import 'package:new_project_driving/view/users/admin/screens/registration/teachers_regi_container.dart';
import 'package:new_project_driving/view/widget/loading_widget/loading_widget.dart';
import 'package:new_project_driving/view/widget/responsive/responsive.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: UserCredentialsController.schoolId != FirebaseAuth.instance.currentUser!.uid
            ? server
                .collection('DrivingSchoolCollection')
                .doc(UserCredentialsController.schoolId)
                .collection('Admins')
                .doc(serverAuth.currentUser!.uid)
                .snapshots()
            : null,
        builder: (context, snap) {
          if (snap.hasData) {
            return snap.data?.data()?['active'] == false
                ? const Scaffold(
                    body: SafeArea(
                        child: Center(
                      child: TextFontWidget(
                          text: "Waiting for superadmin response.....", fontsize: 20),
                    )),
                  )
                : Scaffold(
                    backgroundColor: cWhite,
                    body: SafeArea(
                      child: SidebarDrawer(
                          body: ListView(
                            children: [
                              AppBarAdminPanel(),
                              pages[selectedIndex],
                            ],
                          ),
                          drawer: Container(
                            color: Colors.white,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 60,
                                            child: Image.asset(
                                              logoImage,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          GooglePoppinsWidgets(
                                            text: institutionName,
                                            fontsize: ResponsiveWebSite.isMobile(context) ? 18 : 20,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, top: 12),
                                      child: GestureDetector(
                                        child: Text(
                                          "Main Menu",
                                          style: TextStyle(
                                              color: cBlack.withOpacity(
                                                0.4,
                                              ),
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    DrawerSelectedPagesSection(
                                      selectedIndex: selectedIndex,
                                      onTap: (index) {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  );
          } else if (UserCredentialsController.schoolId == FirebaseAuth.instance.currentUser!.uid) {
            return Scaffold(
              backgroundColor: cWhite,
              body: SafeArea(
                child: SidebarDrawer(
                    body: ListView(
                      children: [
                        AppBarAdminPanel(),
                        pages[selectedIndex],
                      ],
                    ),
                    drawer: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      child: Image.asset(
                                        logoImage,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    GooglePoppinsWidgets(
                                      text: institutionName,
                                      fontsize: ResponsiveWebSite.isMobile(context) ? 18 : 20,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 12),
                                child: Text(
                                  "Main Menu",
                                  style: TextStyle(
                                      color: cBlack.withOpacity(
                                        0.4,
                                      ),
                                      fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DrawerSelectedPagesSection(
                                selectedIndex: selectedIndex,
                                onTap: (index) {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            );
          } else {
            return const Scaffold(body: LoadingWidget());
          }
        });
  }
}

List<Widget> pages = [
  // AdminDashBoardSections(),

  // AllClassListContainer(),
  const AllTeacherRegistrationList(),
  // AllNonTeachStaffListContainer(),

  // AllStudentListContainer(),
  // AllTeacherListContainer(),
  // AllParentsListContainer(),

  // AllClassListView(),

  // CreatedFeesStatus(),

  // PeriodWiseStudentsAttendance(),
  // AllTeachersAttendance(),

  // AllExamNotificationListView(),

  // NoticeEditRemove(),

  // const AllEventsList(),

  // AllMeetingsListPage(),

  // AdminNotificationCreate(),

  // AllAdminListPage(),

  // GeneralInsructions(),

  // const Achievements(),

  // BatchHistroyListPage(),
  // // const TimeTableMainScreen(),
  // // LoginHistroyContainer(),
  // // const Scaffold(body: LoginDashBoard())
  // const TimeTableMainScreen(),
  // LoginHistroyContainer(),
  // TherapyHomePage()
];
