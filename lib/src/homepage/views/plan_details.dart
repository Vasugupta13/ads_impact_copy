import 'package:ads/src/homepage/views/branding_partners_sliding.dart';
import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/homepage/widgets/our_plan_container.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/need_help_chat.dart';

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
          SvgPicture.asset(ImageAssets.takeplan, fit: BoxFit.contain),
          height10,
          RichText(
            textAlign: TextAlign.center,
            maxLines: 3,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Unlock',
                  style: TextStyle(
                      fontFamily: FontAssets.Poppins,
                      color: kred,
                      fontWeight: FontWeight.w600,
                      fontSize: 36),
                ),
                TextSpan(
                  text: ' the Perfect\nSolution for your\n"Ads"',
                  style: TextStyle(
                      fontFamily: FontAssets.Poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 36,
                      color: kblack),
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
          OurPlansContainer(
              onTap: () {},
              containerheight: Get.height * 0.45 + 5,
              containerwidth: Get.width * 0.75,
              imageurl: ImageAssets.planbasic,
              titleletter: "B",
              titlename: 'asic Plan'),
          OurPlansContainer(
              onTap: () {},
              containerheight: Get.height * 0.45 + 5,
              containerwidth: Get.width * 0.75,
              imageurl: ImageAssets.planadvance,
              titleletter: "A",
              titlename: 'dvance Plan'),
          OurPlansContainer(
              onTap: () {},
              containerheight: Get.height * 0.45 + 5,
              containerwidth: Get.width * 0.75,
              imageurl: ImageAssets.planpremium,
              titleletter: "P",
              titlename: 'remium Plan'),
          const ShoppingListSlider(),
          height20,
          const NeedHelp(),
        ],
      ),
    );
  }
}
