import 'package:ads/const.dart';
import 'package:ads/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../opening_screen_pages/opening_screen1.dart';
import '../opening_screen_pages/opening_screen2.dart';
import '../opening_screen_pages/opening_screen3.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);

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
      Get.to(() => const LoginPage(), transition: Transition.rightToLeft);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                  progressValue = (page + 1) / 3;
                });
              },
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          height10,
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const ExpandingDotsEffect(
              dotColor: Color(0xff1A377D),
              activeDotColor: Color(0xff1A377D),
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
          height20,
          Stack(
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
                    color: Color(0xffFF4848),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: kwhite,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
          height20,
        ],
      ),
    );
  }
}
