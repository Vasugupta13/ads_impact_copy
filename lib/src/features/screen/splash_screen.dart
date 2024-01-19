import 'package:ads/src/features/screen/opening_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const OpeningScreen());
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SvgPicture.asset('assets/images/logo.svg'),
        ),
      ),
    );
  }
}
