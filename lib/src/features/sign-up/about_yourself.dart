import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'company_name.dart';

class AboutYourself extends StatefulWidget {
  const AboutYourself({super.key});

  @override
  State<AboutYourself> createState() => _AboutYourselfState();
}

class _AboutYourselfState extends State<AboutYourself> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/icon.svg"),
                    height20,
                    const Text(
                      "About Yourself",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                    ),
                    height30,
                    const DetailsField(
                      name: "Enter your First Name",
                    ),
                    height20,
                    const DetailsField(name: "Enter your Last Name"),
                    height20,
                    const DetailsField(name: "Enter your Mobile Number"),
                    height30,
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => const CompanyName(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        elevation: 0,
                        fixedSize:
                            Size(screenHeight * 0.26, screenHeight * 0.06),
                        backgroundColor: const Color(0xffFF4848),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: kwhite,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60, left: 34, right: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Step 2",
                  style: TextStyle(
                      fontSize: 14, color: kblack, fontWeight: FontWeight.w600),
                ),
                height5,
                LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(18),
                  minHeight: 10,
                  backgroundColor: Colors.black.withOpacity(0.7),
                  value: 0.4,
                  valueColor: const AlwaysStoppedAnimation(Color(0xffFF4848)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
