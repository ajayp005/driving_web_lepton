import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_project_driving/view/colors/colors.dart';
import 'package:new_project_driving/view/fonts/google_monstre.dart';
import 'package:new_project_driving/view/widget/responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

// const String _imageUrl =
//     "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/dujocolleges.jpeg?alt=media&token=0c3fa202-c59f-47bd-b997-88f3128e6871";

// const String _description = "Any schools from Kerala can register on\n"
//     "COSTECH DuJo. COSTECH Dujo is a mobile application\n"
//     "with student login,  parent login, teacher login";

// final Uri _faceBookUrl = Uri.parse('https://facebook.com');
// final Uri _twitterUrl = Uri.parse('https://twitter.com');
// final Uri _instaUrl = Uri.parse('https://www.instagram.com');
// final Uri _utubeUrl = Uri.parse('https://www.youtube.com');
// final Uri _leptonUrl = Uri.parse('http://www.leptoncommunications.com');

// Future<void> _launchFacebookUrl() async {
//   if (!await launchUrl(_faceBookUrl)) {
//     throw 'Could not launch $_faceBookUrl';
//   }
// }

// Future<void> _launchTwitterUrl() async {
//   if (!await launchUrl(_twitterUrl)) {
//     throw 'Could not launch $_twitterUrl';
//   }
// }

// Future<void> _launchyouTubeUrl() async {
//   if (!await launchUrl(_utubeUrl)) {
//     throw 'Could not launch $_utubeUrl';
//   }
// }

// Future<void> _launchInstaUrl() async {
//   if (!await launchUrl(_instaUrl)) {
//     throw 'Could not launch $_instaUrl';
//   }
// }

// Future<void> _launchleptonUrl() async {
//   if (!await launchUrl(_leptonUrl)) {
//     throw 'Could not launch $_leptonUrl';
//   }
// }

void _launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    launchUrl;
  } else {
    throw 'Could not launch $url';
  }
}

class ResponsiveMobileAppBar extends StatelessWidget {
  const ResponsiveMobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidthValue;
    return LayoutBuilder(builder: (context, constrain) {
      maxWidthValue = constrain.maxWidth;

      return Container(
        color: const Color.fromARGB(255, 20, 37, 59),
        height: 100,
        // ResponsiveWebSite.isMobile(context) ? 150 : 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/leptonlogo.png',
                        fit: BoxFit.contain,
                        height: ResponsiveWebSite.isMobile(context) ? 40 : 60,
                        width: ResponsiveWebSite.isMobile(context) ? 40 : 60,
                      ),
                    ],
                  ),

                  // ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppBarPhoneNumber(maxWidthValue),
                  Visibility(
                    visible: maxWidthValue > 220,
                    child: Expanded(
                      child: Row(
                        children: [
                          ResponsiveWebSite.isMobile(context)
                              ? Row(
                                  children: [
                                    Container(
                                        height: 25,
                                        width: 65,
                                        margin: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(Radius.circular(10)),
                                            color: cWhite,
                                            border: Border.all(color: cred)),
                                        child: Center(
                                          child: GoogleMonstserratWidgets(
                                            text: "Login",
                                            fontsize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: cred,
                                          ),
                                        )),
                                    IconButton(
                                      icon: const FaIcon(
                                        size: 15,
                                        FontAwesomeIcons.facebook,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => _launchURL('https://www.facebook.com'),
                                    ),
                                    IconButton(
                                      icon: const FaIcon(
                                        size: 15,
                                        FontAwesomeIcons.instagram,
                                        color: Color.fromARGB(255, 217, 83, 128),
                                      ),
                                      onPressed: () => _launchURL('https://www.instagram.com'),
                                    ),
                                    IconButton(
                                      focusColor: Colors.black,
                                      icon: const FaIcon(
                                        size: 15,
                                        FontAwesomeIcons.xTwitter,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => _launchURL('https://www.twitter.com'),
                                    ),
                                    IconButton(
                                      icon: const FaIcon(
                                        size: 15,
                                        FontAwesomeIcons.youtube,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => _launchURL('https://www.youtube.com'),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: InkWell(onTap: () {
                                        
                                      },
                                        child: Container(
                                            height: 25,
                                            width: 65,
                                            margin: EdgeInsets.zero,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(Radius.circular(10)),
                                                color: cWhite,
                                                border: Border.all(color: cred)),
                                            child: Center(
                                              child: GoogleMonstserratWidgets(
                                                text: "Login",
                                                fontsize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: cred,
                                              ),
                                            )),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const FaIcon(
                                        size: 20,
                                        FontAwesomeIcons.facebook,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => _launchURL('https://www.facebook.com'),
                                    ),
                                    IconButton(
                                      icon: const FaIcon(
                                        size: 20,
                                        FontAwesomeIcons.instagram,
                                        color: Color.fromARGB(255, 217, 83, 128),
                                      ),
                                      onPressed: () => _launchURL('https://www.instagram.com'),
                                    ),
                                    IconButton(
                                      focusColor: Colors.black,
                                      icon: const FaIcon(
                                        size: 20,
                                        FontAwesomeIcons.xTwitter,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => _launchURL('https://www.twitter.com'),
                                    ),
                                    IconButton(
                                      icon: const FaIcon(
                                        size: 20,
                                        FontAwesomeIcons.youtube,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => _launchURL('https://www.youtube.com'),
                                    ),
                                  ],
                                )

                          // ResponsiveWebSite.isDesktop(context)
                          //     ? const SocaiMedaAtAppbar()

                          //     : ResponsiveWebSite.isTablet(context)
                          //     ? const SocaiMedaAtAppbar():
                          //     const SocaiMedaAtAppbar()

                          // ListView(
                          //     shrinkWrap: true,
                          //     scrollDirection: Axis.horizontal,
                          //     physics: const NeverScrollableScrollPhysics(),
                          //     children: socailMediaList
                          //         .map((data) => Row(
                          //               children: [
                          //                 Padding(
                          //                   padding: const EdgeInsets.all(10),
                          //                   child: InkWell(
                          //                       onTap: data.tilteFunExecution,
                          //                       // child: data.assetImage!,
                          //                       child: Image.asset(
                          //                         data.imageString!,
                          //                         height: 20,
                          //                         width: 20,
                          //                         color: cBlack,
                          //                       )

                          //                       // data.assetImage!,
                          //                       ),
                          //                 ),
                          //               ],
                          //             ))
                          //         .toList()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

// class SocaiMedaAtAppbar extends StatelessWidget {
//   const SocaiMedaAtAppbar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.transparent,
//       height: ResponsiveWebSite.isMobile(context)?40:60,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           const LoginButton(), // Login Button
//           InkWell(
//             onTap: () {
//               _launchFacebookUrl();
//             },
//             child: Image.asset(
//               'assets/images/fb.png',
//               height: ResponsiveWebSite.isMobile(context)?15:20,
//               width: ResponsiveWebSite.isMobile(context)?15:20,
//               color: cWhite,
//               //Color(0xFF17BDB5),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               _launchInstaUrl();
//             },
//             child: Image.asset(
//               'assets/images/insta.png',
//               height: ResponsiveWebSite.isMobile(context)?15:30,
//               width: ResponsiveWebSite.isMobile(context)?15:30,
//               color: Colors.pink,
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               _launchTwitterUrl();
//             },
//             child: Image.asset(
//               'assets/images/x.png',
//               height: ResponsiveWebSite.isMobile(context)?15:20,
//               width: ResponsiveWebSite.isMobile(context)?15:20,
//               color: cWhite,
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               _launchyouTubeUrl();
//             },
//             child: Image.asset(
//               'assets/images/utbe.png',
//               height: ResponsiveWebSite.isMobile(context)?15:30,
//               width: ResponsiveWebSite.isMobile(context)?15:30,

//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class AppBarPhoneNumber extends StatelessWidget {
  final double maxWidthValue;
  const AppBarPhoneNumber(
    this.maxWidthValue, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color(0xFFCE230C),
      // height: 60,
      // width: MediaQuery.of(context).size.width,
      child: maxWidthValue < 430
          ? const Padding(
              padding: EdgeInsets.all(7),
              child: Column(
                children: [
                  MobNumber01(),
                  MobNumber02(),
                ],
              ),
            )
          : const Padding(
              padding: EdgeInsets.all(7),
              child: Row(
                children: [
                  MobNumber01(),
                  MobNumber02(),
                ],
              ),
            ),
    );
  }
}

class MobNumber02 extends StatelessWidget {
  const MobNumber02({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '✉️ info@drivingschool.com ',
      style: GoogleFonts.poppins(
          // themeColorBlue,
          color: cWhite,
          fontSize: ResponsiveWebSite.isMobile(context) ? 09 : 12,
          fontWeight: FontWeight.w400),
    );
  }
}

class MobNumber01 extends StatelessWidget {
  const MobNumber01({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '📞 +91 9562776043     ',
      style: GoogleFonts.poppins(
          color: cWhite,
          //Color(0xFF17BDB5),
          fontSize: ResponsiveWebSite.isMobile(context) ? 09 : 12,
          fontWeight: FontWeight.w500),
    );
  }
}
