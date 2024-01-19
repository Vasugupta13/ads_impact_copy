import 'package:ads/src/features/common_widget/plan_details.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakePlanBar extends StatefulWidget {
  final VoidCallback toggle;
  final bool isvisible;

  const TakePlanBar({super.key, required this.toggle, required this.isvisible});

  @override
  State<TakePlanBar> createState() => _TakePlanBarState();
}

class _TakePlanBarState extends State<TakePlanBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height20,
        GestureDetector(
          onTap: widget.toggle,
          child: Stack(
            children: [
              Container(
                height: Get.height * 0.1 - 15,
                width: Get.width * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color(0xff615F5F),
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Take your plan and start your trial",
                    style: TextStyle(fontSize: 13, color: kwhite),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: Get.height * 0.1 - 15,
                  width: Get.width * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), color: kred),
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
        height20,
        if (widget.isvisible) const PlanDetails(),
      ],
    );
  }
}
