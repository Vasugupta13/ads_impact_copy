import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BasicPlan extends StatefulWidget {
  const BasicPlan({super.key});

  @override
  State<BasicPlan> createState() => _BasicPlanState();
}

class _BasicPlanState extends State<BasicPlan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 52,
                width: Get.width * 0.55,
                decoration: const BoxDecoration(
                  color: Color(0xffFF4848),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/person_icon.svg"),
                      kwidth15,
                      const Text(
                        "Basic Plan User",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: kwhite),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SvgPicture.asset("assets/images/basic_plan.svg"),
            ),
          ],
        ),
        const Divider(endIndent: 16, indent: 16, thickness: 1.0),
      ],
    );
  }
}
