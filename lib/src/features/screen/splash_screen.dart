import 'package:ads/src/features/screen/opening_screen.dart';
import 'package:ads/src/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const routePath = '/SplashScreen';
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Get.off(() => const OpeningScreen());
      // context.push(OpeningScreen.routerPath);
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SvgPicture.asset(ImageAssets.splashlogo),
        ),
      ),
    );
  }
}
