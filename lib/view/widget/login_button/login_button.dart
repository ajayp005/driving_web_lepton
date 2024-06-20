import 'package:flutter/material.dart';
import 'package:new_project_driving/colors/colors.dart';
import 'package:new_project_driving/fonts/google_monstre.dart';
import 'package:new_project_driving/fonts/google_poppins_widget.dart';
import 'package:new_project_driving/view/widget/back_button/back_button.dart';
import 'package:new_project_driving/view/widget/responsive/responsive.dart';
import 'package:new_project_driving/view/widget/text_formfiled_container/text_formfled_container.dart';
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60),
      child: SizedBox(
        height: ResponsiveWebSite.isMobile(context)?20:30,
        width: ResponsiveWebSite.isMobile(context)?60:100,
        //  color: cBlue,
        child: InkWell(
            onTap: () {
              loginshowDilogueBox(context);
            },
            child: Container(
                height: ResponsiveWebSite.isMobile(context)?15:25,
                width: ResponsiveWebSite.isMobile(context)?45:65,
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: cWhite,
                    border: Border.all(color: cWhite)),
                child: Center(
                  child: GoogleMonstserratWidgets(
                    text: "Login",
                    fontsize: ResponsiveWebSite.isMobile(context)?12:15,
                    fontWeight: FontWeight.w600,
                    color: cBlack,
                  ),
                ))),
      ),
    );
  }
}

loginshowDilogueBox(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      final GlobalKey<FormState> formKey = GlobalKey<FormState>();
      TextEditingController emailController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
      return Form(
        key: formKey,
        child: AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GooglePoppinsWidgets(
                  text: 'LOGIN   TO     A D M I N P A N E L',
                  fontsize: 13,
                  fontWeight: FontWeight.w600),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: BackButtonContainerWidget(),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  height: 250,
                  width: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormFiledContainerWidget(
                        controller: emailController,
                        hintText: 'Enter your email',
                        title: 'EMAIL ID',
                        width: 250,
                      ),
                      TextFormFiledContainerWidget(
                        controller: passwordController,
                        hintText: 'Enter your password',
                        title: 'PASSWORD',
                        width: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80, top: 20),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 150,
                            decoration: const BoxDecoration(
                              color: themeColorBlue,
                            ),
                            child: Center(
                              child: GooglePoppinsWidgets(
                                  text: 'LOGIN',
                                  color: cWhite,
                                  fontsize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                              onTap: () async {
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (context) {
                                //     return const ForgotPasswordScreen();
                                //   },
                                // ));
                              },
                              child: GooglePoppinsWidgets(text: "ForgetPassword ?", fontsize: 11)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
