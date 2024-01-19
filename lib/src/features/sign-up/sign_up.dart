import 'package:ads/src/features/connect_account/connect_your_account.dart';
import 'package:ads/src/features/sign-up/widget/sign_up_view.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final PageController _pageController = PageController();
  int _currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(backgroundColor: kwhite, elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentpage = index;
                });
              },
              children: [
                CustomSignupPage(
                    onTap: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    iconimage: "assets/images/person_icon_black.svg",
                    title: "Sign-up",
                    istextfield1: true,
                    hinttext1: "Enter your E-mail",
                    istextfield2: true,
                    hinttext2: "Enter your Username",
                    istextfield3: true,
                    hinttext3: "Password",
                    istextfield4: true,
                    hinttext4: "Confirm Password"),
                CustomSignupPage(
                    onTap: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    iconimage: "assets/images/person_icon_black.svg",
                    title: "About Yourself",
                    hinttext1: "Enter your First Name",
                    hinttext2: "Enter your Last Name",
                    hinttext3: "Enter your Mobile Number",
                    istextfield1: true,
                    istextfield2: true,
                    istextfield3: true),
                CustomSignupPage(
                    onTap: () {
                      Get.to(
                        () => const ConnectYourAccounts(),
                      );
                    },
                    iscompanyvisible: true,
                    hinttext1: "Enter your Company Name",
                    hinttext2: "Enter your Company Website",
                    istextfield1: true,
                    istextfield2: true),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Step ${_currentpage + 1}",
                style: const TextStyle(
                    fontSize: 14, color: kblack, fontWeight: FontWeight.w600),
              ),
              height5,
              SizedBox(
                width: Get.width * 0.8,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(12),
                  minHeight: 10,
                  backgroundColor: Colors.black.withOpacity(0.7),
                  value: _calculateLinearProgress(),
                  valueColor: const AlwaysStoppedAnimation(kred),
                ),
              ),
            ],
          ),
          height50,
        ],
      ),
    );
  }

  double _calculateLinearProgress() {
    if (_currentpage == 0) {
      return 0.2;
    } else if (_currentpage == 1) {
      return 0.4;
    } else {
      return 0.6;
    }
  }
}
