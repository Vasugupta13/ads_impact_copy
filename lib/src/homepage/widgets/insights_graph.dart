import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonGraph extends StatelessWidget {
  final String imagepath;
  const CommonGraph({super.key, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.3,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 4,
              color: kblack.withOpacity(0.25),
              offset: const Offset(0, 4),
              spreadRadius: 1),
        ],
        color: kwhite,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: SvgPicture.asset(imagepath, fit: BoxFit.cover),
    );
  }
}
