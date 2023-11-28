import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String name;
  final String imagepath;
  const CustomAppBar({super.key, required this.name, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
        Expanded(
          child: Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            child: Stack(
              children: [
                Positioned(
                  right: 10,
                  left: 0,
                  child: SizedBox(
                      height: 52,
                      width: 52,
                      // decoration: const BoxDecoration(
                      //   shape: BoxShape.circle,
                      //   color: Color(0xff212121),
                      // ),
                      child: SvgPicture.asset(imagepath)),
                ),
                Positioned(
                  top: 24,
                  left: 24,
                  right: 30,
                  child: Container(
                    height: 70,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xff1A377D).withOpacity(0.10),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kblack),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
