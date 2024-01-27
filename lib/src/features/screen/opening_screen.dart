import 'package:ads/src/features/screen/login_page.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({super.key});

  static const routerPath = '/OpeningScreen';

  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  final _controller = PageController();
  int currentPage = 0;
  double progressValue = 0.3;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (currentPage < 2) {
      _controller.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // context.push(LoginPage.routerPath);
      Get.to(() => const LoginPage(),
          transition: Transition.rightToLeftWithFade);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: -(screenHeight / 2.2),
              left: -130,
              child: Container(
                height: screenHeight + 100,
                width: screenHeight + 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff1A377D).withOpacity(0.1),
                ),
              ),
            ),
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                  progressValue = (page + 1) / 3;
                });
              },
              children: const [
                OpeningPage(
                  showTextSpan: false,
                  imagepath: ImageAssets.openingscreen1,
                  title: "Unleash Advertising Potential",
                  subtitle:
                      "Transform Your Business: Unlock Growth\nOpportunities with Powerful Advertising\nStrategies",
                ),
                OpeningPage(
                  showTextSpan: false,
                  imagepath: ImageAssets.openingscreen2,
                  title: "Innovative Ad Campaigns",
                  subtitle:
                      "Break Through the Noise: Engage, Inspire,\nand Convert with Cutting-Edge\nAdvertising Approaches",
                ),
                OpeningPage(
                  showTextSpan: false,
                  imagepath: ImageAssets.openingscreen3,
                  title: "Elevate Your Brand Reach",
                  subtitle:
                      "Strategic Advertising Solutions:\nCaptivate Audiences and Amplify Brand\nRecognition",
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeAlign: 10,
                    value: progressValue,
                    strokeWidth: 4,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xffFF4848),
                    ),
                  ),
                  GestureDetector(
                    onTap: goToNextPage,
                    child: Container(
                      height: 62,
                      width: 62,
                      decoration: const BoxDecoration(
                          color: Color(0xffFF4848), shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_forward_rounded,
                          color: kwhite, size: 28),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: screenHeight / 3,
              left: 20,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                    dotColor: Color(0xff1A377D),
                    activeDotColor: Color(0xff1A377D),
                    dotHeight: 8,
                    dotWidth: 8),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: TextButton(
                onPressed: () {
                  // context.push(LoginPage.routerPath);
                  Get.to(() => const LoginPage(),
                      transition: Transition.rightToLeftWithFade);
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      fontFamily: FontAssets.Poppins,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: grey77),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//   Widget _buildContainerImage(String imagepath, {bool? showTextSpan}) {
//     return Column(
//       children: [
//         Image.asset(imagepath, width: scrennwidth, fit: BoxFit.cover),
//         if (showTextSpan!)
//           Column(
//             children: [
//               RichText(
//                 textAlign: TextAlign.center,
//                 maxLines: 2,
//                 text: const TextSpan(
//                   style: TextStyle(
//                     fontSize: 24,
//                     height: 1.4,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xff000000),
//                   ),
//                   children: [
//                     TextSpan(
//                       text: 'W',
//                       style: TextStyle(color: kblue77D),
//                     ),
//                     TextSpan(text: 'elcome to the '),
//                     TextSpan(
//                       text: 'Ads Impact',
//                       style: TextStyle(color: kblue77D),
//                     ),
//                     TextSpan(text: '\nmobile app!'),
//                   ],
//                 ),
//               ),
//               height40,
//             ],
//           )
//         else
//           const SizedBox(),
//       ],
//     );
//   }
}

class OpeningPage extends StatefulWidget {
  final String imagepath;
  final String title;
  final String subtitle;
  final bool showTextSpan;

  const OpeningPage(
      {super.key,
      required this.imagepath,
      required this.title,
      required this.subtitle,
      required this.showTextSpan});

  @override
  _OpeningPageState createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SvgPicture.asset(widget.imagepath,
            height: screenHeight * 0.5, width: screenWidth, fit: BoxFit.cover),
        // if (widget.showTextSpan)
        //   Column(
        //     children: [
        //       RichText(
        //         textAlign: TextAlign.center,
        //         maxLines: 2,
        //         text: const TextSpan(
        //           style: TextStyle(
        //             fontSize: 24,
        //             height: 1.4,
        //             fontWeight: FontWeight.w600,
        //             color: Color(0xff000000),
        //           ),
        //           children: [
        //             TextSpan(
        //               text: 'W',
        //               style: TextStyle(color: kblue77D),
        //             ),
        //             TextSpan(text: 'elcome to the '),
        //             TextSpan(
        //               text: 'Ads Impact',
        //               style: TextStyle(color: kblue77D),
        //             ),
        //             TextSpan(text: '\nmobile app!'),
        //           ],
        //         ),
        //       ),
        //       SizedBox(height: screenHeight * 0.1),
        //     ],
        //   )
        // else
        //   height30,
        SizedBox(height: screenHeight * 0.18 + 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                  fontFamily: FontAssets.Poppins,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            height15,
            Text(
              widget.subtitle,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: FontAssets.Poppins,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: grey77),
            ),
            height10,
          ],
        ),
      ],
    );
  }
}
