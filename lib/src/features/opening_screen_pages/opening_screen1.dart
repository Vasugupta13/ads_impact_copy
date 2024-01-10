import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/login_page.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/people.png",
                    height: screenHeight * 0.6 / 1.0,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => const LoginPage(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff777777),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 44,
                    child: RichText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 24,
                          height: 1.4,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: 'W',
                            style: TextStyle(
                              color: Color(0xff1A377D),
                            ),
                          ),
                          TextSpan(
                            text: 'elcome to the ',
                          ),
                          TextSpan(
                            text: 'Ads Impact',
                            style: TextStyle(
                              color: Color(0xff1A377D),
                            ),
                          ),
                          TextSpan(
                            text: '\nmobile app!',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              height25,
              const Text(
                "Unleash Advertising Potential",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              height30,
              Text(
                "Transform Your Business: Unlock Growth\nOpportunities with Powerful Advertising\nStrategies",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.3,
                  fontSize: screenHeight * 0.02,

                  color: const Color(0xff777777),
                ),
              ),
              height30,
            ],
          ),
        ),
      ),
    );
  }
}
