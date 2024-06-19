import 'package:flutter/material.dart';
import 'package:new_project_driving/view/colors/colors.dart';
import 'package:new_project_driving/view/fonts/google_poppins_widget.dart';
import 'package:new_project_driving/view/widget/responsive/responsive.dart';
class AboutWidget extends StatelessWidget {
  const AboutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: const Color.fromARGB(255, 19, 19, 19),
      height: ResponsiveWebSite.isMobile(context)
          ? 180
          : ResponsiveWebSite.isTablet(context)
              ? 200
              : 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: ResponsiveWebSite.isTablet(context)
                  ? 200
                  : ResponsiveWebSite.isMobile(context)
                      ? 100
                      : 250,
              width: ResponsiveWebSite.isTablet(context)
                  ? 200
                  : ResponsiveWebSite.isMobile(context)
                      ? 100
                      : 250,
              child: Image.asset(
                'assets/images/car_drive.jpg',
                fit: ResponsiveWebSite.isMobile(context) ? BoxFit.fitHeight : BoxFit.fitWidth,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: ResponsiveWebSite.isMobile(context) ? 100 : 80,
                width: size.width / 1.9,
                child: Center(
                  child: Padding(
                    padding: ResponsiveWebSite.isDesktop(context)
                        ? const EdgeInsets.only()
                        : const EdgeInsets.only(left: 05),
                    child: GooglePoppinsWidgets(
                        text:
                            'Turn Your Driving Dreams Into Reality With Our Trusted Lessons',
                        fontsize: ResponsiveWebSite.isTablet(context)
                            ? 13
                            : ResponsiveWebSite.isMobile(context)
                                ? 11
                                : 18,
                        color: cWhite),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
