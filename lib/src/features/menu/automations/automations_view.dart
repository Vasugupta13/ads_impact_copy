import 'package:ads/src/features/common_widget/custom_app_bar.dart';
import 'package:ads/src/features/common_widget/customdropdown.dart';
import 'package:ads/src/features/common_widget/elevatedbutton.dart';
import 'package:ads/src/features/menu/automations/view/ad_optimization.dart';
import 'package:ads/src/features/menu/automations/view/budget_optimization.dart';
import 'package:ads/src/homepage/social_account_list_widget.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<String> items = [
  "Ad Optimization",
  "Budget Optimization",
  "Report Settings"
];

String? selectedvalue;

class Automation extends StatefulWidget {
  const Automation({super.key});

  @override
  State<Automation> createState() => _AutomationState();
}

class _AutomationState extends State<Automation> {
  int listindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 42),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBar(
                name: "Automation",
                imagepath: "assets/images/automation_view.svg"),
            height20,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            height5,
            const Text(
              "Choose Platform :",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            height15,
            SocialAccountList(
              onTapCallback: (index) {
                setState(
                  () {
                    listindex = index;
                  },
                );
              },
            ),
            height30,
            CustomDropDown(
              hint: 'Budget Optimization',
              containerwidth: 0.50,
              dropdownItems: items,
              onChanged: (String? value) {
                setState(
                  () {
                    selectedvalue = value;
                  },
                );
              },
              value: selectedvalue,
            ),
            if (selectedvalue == "Ad Optimization")
              const AdOptimization()
            else if (listindex == 0)
              const BudgetOptimization(
                name: "Facebook Optimization",
                image: "assets/images/fb_logo.svg",
              )
            else if (listindex == 1)
              const BudgetOptimization(
                name: "Twitter Optimization",
                image: "assets/images/twitter.svg",
              )
            else if (listindex == 2)
              const BudgetOptimization(
                name: "Google Optimization",
                image: "assets/images/google.svg",
              )
            else if (listindex == 3)
              const BudgetOptimization(
                name: "Linkedin Optimization",
                image: "assets/images/link_logo.svg",
              ),
          ],
        ),
      ),
    );
  }
}
