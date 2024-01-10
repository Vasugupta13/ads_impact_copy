import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CommonContainerPlanDetals extends StatelessWidget {
  final double containerheight;
  final String titleword;
  final String titlename;
  final String name1;
  final String name2;
  final String name3;
  final String name4;
  final String name5;
  final String imageurl;

  const CommonContainerPlanDetals(
      {super.key,
      required this.name1,
      required this.name2,
      required this.name3,
      required this.name4,
      required this.name5,
      required this.imageurl,
      required this.titleword,
      required this.titlename,
      required this.containerheight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerheight,
      width: Get.width,
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 16,
              color: kblack.withOpacity(0.25),
              offset: const Offset(0, 4),
              spreadRadius: 0),
        ],
      ),
      child: Column(
        children: [
          SvgPicture.asset(imageurl, fit: BoxFit.contain),
          height2,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: titleword,
              style: const TextStyle(
                  color: Color(0xff1A377D),
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                  text: titlename,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600, color: kblack),
                ),
              ],
            ),
          ),
          height10,
          Divider(color: kblack.withOpacity(0.2), endIndent: 60, indent: 60),
          height10,
          Text(
            name1,
            style: TextStyle(
              fontSize: 14,

              color: kblack.withOpacity(0.4),
            ),
          ),
          height5,
          Text(
            name2,
            style: TextStyle(
              fontSize: 14,

              color: kblack.withOpacity(0.4),
            ),
          ),
          height5,
          Text(
            name3,
            style: TextStyle(
              fontSize: 14,

              color: kblack.withOpacity(0.4),
            ),
          ),
          height5,
          Text(
            name4,
            style: TextStyle(
              fontSize: 14,

              color: kblack.withOpacity(0.4),
            ),
          ),
          height5,
          Text(
            name5,
            style: TextStyle(
              fontSize: 14,
              
              color: kblack.withOpacity(0.4),
            ),
          )
        ],
      ),
    );
  }
}
