import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChartNameContainer extends StatelessWidget {
  final String name;
  final String imagepath;
  const ChartNameContainer(
      {super.key, required this.name, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 46,
        width: Get.width * 0.80 - 10,
        padding: const EdgeInsets.only(left: 16, right: 8),
        decoration: const BoxDecoration(
          color: Color(0xffFF4848),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(imagepath),
            kwidth15,
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 13, color: kwhite),
              ),
            )
          ],
        ),
      ),
    );
  }
}
