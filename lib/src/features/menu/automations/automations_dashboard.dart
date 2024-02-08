import 'package:ads/src/common/views/customdropdown.dart';
import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/menu/automations/view/ad_optimization_menu.dart';
import 'package:ads/src/features/menu/automations/view/budget_optimization_widget.dart';
import 'package:ads/src/homepage/widgets/social_account_list_widget.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

final List<String> items = [
  "Ad Optimization",
  "Budget Optimization",
  "Report Settings"
];

String? selectedvalue = "Budget Optimization";

class Automation extends StatefulWidget {
  const Automation({super.key});

  static const routerPath = '/Automation';

  @override
  State<Automation> createState() => _AutomationState();
}

class _AutomationState extends State<Automation> {
  int listindex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAppBar(
                  name: "Automation", imagepath: IconAssets.menuautomation),
              height20,
              const Text(
                "Choose Platform :",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                dropdownItems: items,
                value: selectedvalue,
                containerwidth: screenWidth * 0.5,
                containerheight: 30,
                onChanged: (String? value) {
                  setState(() {
                    selectedvalue = value;
                  });
                },
              ),
              if (selectedvalue == "Ad Optimization")
                const AdOptimization()
              else if (listindex == 0)
                const BudgetOptimization(
                  name: "Facebook Optimization",
                  image: ImageAssets.fbwhite,
                )
              else if (listindex == 1)
                const BudgetOptimization(
                  name: "Twitter Optimization",
                  image: ImageAssets.twitterwhite,
                )
              else if (listindex == 2)
                const BudgetOptimization(
                  name: "Google Optimization",
                  image: ImageAssets.googlewhite,
                )
              else if (listindex == 3)
                const BudgetOptimization(
                  name: "Linkedin Optimization",
                  image: ImageAssets.linkdinwhite,
                ),
              height30,
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
