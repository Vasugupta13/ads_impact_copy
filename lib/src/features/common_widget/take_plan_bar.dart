import 'package:ads/src/features/common_widget/plan_details.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakePlanBar extends StatefulWidget {
  const TakePlanBar({super.key});

  @override
  State<TakePlanBar> createState() => _TakePlanBarState();
}

class _TakePlanBarState extends State<TakePlanBar> {
  bool isvisible = false;
  double screenWidth = Get.width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 1.6,
        ),
        height20,
        GestureDetector(
          onTap: () {
            setState(() {
              isvisible = !isvisible;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Stack(
              children: [
                Container(
                  height: 54,
                  padding: const EdgeInsets.only(left: 18, top: 18),
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xff615F5F),
                  ),
                  child: const Text(
                    "Take your plan and start your trial",
                    style: TextStyle(
                        fontSize: 13,
                        color: kwhite,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: 54,
                    width: screenWidth * 0.28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xffFF4444)),
                    child: const Center(
                      child: Text(
                        "Take Plan",
                        style: TextStyle(
                            fontSize: 14,
                            color: kwhite,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        height20,
        if (isvisible) const PlanDetails(),
      ],
    );
  }
}
