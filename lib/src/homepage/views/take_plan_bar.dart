import 'package:ads/src/homepage/views/plan_details.dart';
import 'package:ads/src/res/assets.dart';
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        height20,
        GestureDetector(
          onTap: widget.toggle,
          child: Stack(
            children: [
              Container(
                height: screenHeight * 0.1 - 15,
                width: screenWidth * 0.9,
                padding: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xff615F5F),
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Take your plan and start your trial",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: kwhite),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: screenHeight * 0.1 - 15,
                  width: screenWidth * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), color: kred),
                  child: const Center(
                    child: Text("Take Plan", style: tileStyle),
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

const TextStyle tileStyle =
    TextStyle(fontSize: 14, color: kwhite, fontWeight: FontWeight.w600);
