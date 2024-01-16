import 'package:ads/src/features/common_widget/elevatedbutton.dart';
import 'package:ads/src/features/common_widget/plan_deatils_conatiner_image.dart';
import 'package:ads/src/features/common_widget/branding_partners_sliding.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'need_help_chat.dart';

class PlanDetails extends StatefulWidget {
  const PlanDetails({super.key});

  @override
  State<PlanDetails> createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<PlanDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const Divider(
            endIndent: 8,
            indent: 8,
          ),
          SvgPicture.asset("assets/images/plandetails.svg",
              fit: BoxFit.contain),
          height10,
          RichText(
            textAlign: TextAlign.center,
            maxLines: 3,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 24,
                height: 1.4,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000),
              ),
              children: [
                TextSpan(
                  text: 'Unlock',
                  style: TextStyle(
                      color: Color(0xffFF4848),
                      fontWeight: FontWeight.w600,
                      fontSize: 36),
                ),
                TextSpan(
                  text: ' the Perfect\nSolution for your\n"Ads"',
                  style: TextStyle(fontSize: 36),
                ),
              ],
            ),
          ),
          const Divider(
            endIndent: 18,
            indent: 18,
            thickness: 1.6,
          ),
          height20,
          const Text(
            "Our Plans",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          height20,
          CommonContainerPlanDetals(
            containerheight: Get.height * 0.48,
            containerwidth: Get.width * 0.75,
            imageurl: "assets/images/bro.svg",
            titleword: "B",
            titlename: 'asic Plan',
          ),
          height20,
          CommonElevatedButton(
              ontap: () {},
              name: "Buy Now",
              textStyle: const TextStyle(
                color: kwhite,
                fontSize: 14,
              ),
              buttonwidth: 0.24,
              buttonheight: 0.06),
          height20,
          CommonContainerPlanDetals(
            containerheight: Get.height * 0.48,
            containerwidth: Get.width * 0.75,
            imageurl: "assets/images/pana.svg",
            titleword: "A",
            titlename: 'dvance Plan',
          ),
          height20,
          CommonElevatedButton(
              ontap: () {},
              name: "Buy Now",
              textStyle: const TextStyle(
                color: kwhite,
                fontSize: 14,
              ),
              buttonwidth: 0.24,
              buttonheight: 0.06),
          height20,
          CommonContainerPlanDetals(
            containerheight: Get.height * 0.48,
            containerwidth: Get.width * 0.75,
            imageurl: "assets/images/cuate.svg",
            titleword: "P",
            titlename: 'remium Plan',
          ),
          height20,
          CommonElevatedButton(
              ontap: () {},
              name: "Buy Now",
              textStyle: const TextStyle(
                color: kwhite,
                fontSize: 14,
              ),
              buttonwidth: 0.24,
              buttonheight: 0.06),
          height20,
          const ShoppingListSlider(),
          height20,
          const NeedHelp(),
        ],
      ),
    );
  }
}
