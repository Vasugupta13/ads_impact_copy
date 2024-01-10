import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/login_page.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/page2.png",
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
                ],
              ),
              height25,
              const Text(
                "Innovative Ad Campaigns",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              height30,
              Text(
                "Break Through the Noise: Engage, Inspire,\nand Convert with Cutting-Edge\nAdvertising Approaches",
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
