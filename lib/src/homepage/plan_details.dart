import 'package:ads/src/features/common_widget/custom_elevatedbutton.dart';
import 'package:ads/src/homepage/common_plan_container.dart';
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
          divider16,
          SvgPicture.asset("assets/images/plandetails.svg",
              fit: BoxFit.contain),
          height10,
          RichText(
            textAlign: TextAlign.center,
            maxLines: 3,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Unlock',
                  style: TextStyle(
                      color: kred, fontWeight: FontWeight.w600, fontSize: 36),
                ),
                TextSpan(
                  text: ' the Perfect\nSolution for your\n"Ads"',
                  style: TextStyle(fontSize: 36, color: kblack),
                ),
              ],
            ),
          ),
          dividerind16,
          height20,
          const Text(
            "Our Plans",
            style: TextStyle(fontSize: 24),
          ),
          height20,
          CommonContainerPlanDetals(
              containerheight: Get.height * 0.45 + 5,
              containerwidth: Get.width * 0.75,
              imageurl: "assets/images/our_basic_plan.svg",
              titleletter: "B",
              titlename: 'asic Plan'),
          height20,
          CommonElevatedButton(
            name: "Buy Now",
            buttonwidth: 0.45,
            textStyle: elevatedtextstyle,
            ontap: () {},
          ),
          height20,
          CommonContainerPlanDetals(
              containerheight: Get.height * 0.45 + 5,
              containerwidth: Get.width * 0.75,
              imageurl: "assets/images/our_advance_plan.svg",
              titleletter: "A",
              titlename: 'dvance Plan'),
          height20,
          CommonElevatedButton(
            name: "Buy Now",
            buttonwidth: 0.45,
            textStyle: elevatedtextstyle,
            ontap: () {},
          ),
          height20,
          CommonContainerPlanDetals(
              containerheight: Get.height * 0.45 + 5,
              containerwidth: Get.width * 0.75,
              imageurl: "assets/images/our_premium_plan.svg",
              titleletter: "P",
              titlename: 'remium Plan'),
          height20,
          CommonElevatedButton(
            name: "Buy Now",
            buttonwidth: 0.45,
            textStyle: elevatedtextstyle,
            ontap: () {},
          ),
          height20,
          const ShoppingListSlider(),
          height20,
          const NeedHelp(),
        ],
      ),
    );
  }
}
