import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String name;
  final String imagepath;
  final VoidCallback? onTapBack;
  const CustomAppBar(
      {super.key, required this.name, required this.imagepath, this.onTapBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 42),
          child: Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
            height: Get.height * 0.13,
            width: Get.width,
            decoration: const BoxDecoration(color: kwhite),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: onTapBack,
                      icon: const Icon(Icons.arrow_back_ios,
                          color: kblack, size: 20)),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 70,
                            width: Get.width * 0.6,
                            decoration: BoxDecoration(
                              color: kblue77D.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                height20,
                                Text(
                                  name,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff212121),
                            ),
                            padding: const EdgeInsets.all(12),
                            // ignore: deprecated_member_use
                            child: SvgPicture.asset(imagepath, color: kwhite),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        height25,
        dividerind16,
      ],
    );
  }
}
