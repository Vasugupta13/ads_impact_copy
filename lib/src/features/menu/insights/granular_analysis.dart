import 'package:ads/src/features/common_widget/custom_app_bar.dart';
import 'package:ads/src/features/common_widget/customdropdown.dart';
import 'package:ads/src/features/common_widget/elevatedbutton.dart';
import 'package:ads/src/features/menu/campaign/campaign_analysis.dart';
import 'package:ads/src/features/menu/insights/view/adset_analysis.dart';
import 'package:ads/src/features/menu/insights/view/creative_analysis.dart';
import 'package:ads/src/features/menu/insights/view/keyword_analysis.dart';
import 'package:ads/src/features/menu/insights/view/platform_analysis.dart';
import 'package:ads/src/features/menu/insights/view/region_analysis.dart';
import 'package:ads/src/features/menu/insights/view/search_analysis.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<String> items = [
  "Platform Based Analysis",
  "Campaign Based Analysis",
  "Adset Based Analysis",
  "Creative Based Analysis",
];
String? selectedvalue;

final List<String> targetitems = [
  "Region Based Analysis",
  "Keyword Based Analysis",
  "Search Based Analysis",
];
String? selecteditems;

class GranularAnalysis extends StatefulWidget {
  const GranularAnalysis({super.key});

  @override
  State<GranularAnalysis> createState() => _GranularAnalysisState();
}

class _GranularAnalysisState extends State<GranularAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 42),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CustomAppBar(
                name: "Granular Analysis",
                imagepath: "assets/images/campaign_analysis.svg"),
            height20,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            height5,
            const Text(
              "Performance Based Analysis",
              style: TextStyle(fontSize: 18, ),
            ),
            height5,
            Text(
              "About the performance of Campaign, Adsets and Ads",
              style: TextStyle(
                  fontSize: 8,

                  color: kblack.withOpacity(0.56)),
            ),
            height20,
            CustomDropDown(
              containerwidth: 0.50,
              dropdownItems: items,
              hint: 'Select Value',
              onChanged: (String? value) {
                setState(() {
                  selectedvalue = value;
                });
              },
              value: selectedvalue,
            ),
            height25,
            CommonElevatedButton(
              ontap: () {
                if (selectedvalue == "Platform Based Analysis") {
                  Get.to(() => const PlatformAnalysis());
                } else if (selectedvalue == "Adset Based Analysis") {
                  Get.to(() => const AdsetAnalysis());
                } else {
                  if (selectedvalue == "Creative Based Analysis") {
                    Get.to(() => const CreativeAnalysis());
                  } else {
                    if (selectedvalue == "Campaign Based Analysis") {
                      Get.to(() => const CampaignAnalysis());
                    }
                  }
                }
              },
              name: "Next",
              buttonwidth: 0.20,
              buttonheight: 0.05,
              textStyle:
                  const TextStyle(fontSize: 12, ),
            ),
            height30,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            height20,
            const Text(
              "Target Based Analysis",
              style: TextStyle(fontSize: 16, ),
            ),
            height5,
            Text(
              "About the performance of Campaign, Adsets and Ads",
              style: TextStyle(
                fontSize: 8,
                
                color: kblack.withOpacity(0.56),
              ),
            ),
            height20,
            CustomDropDown(
              containerwidth: 0.50,
              dropdownItems: targetitems,
              hint: 'Select Value',
              onChanged: (String? value) {
                setState(() {
                  selecteditems = value;
                });
              },
              value: selecteditems,
            ),
            height25,
            CommonElevatedButton(
              ontap: () {
                if (selecteditems == "Region Based Analysis") {
                  Get.to(() => const RegionAnalysis());
                }
                if (selecteditems == "Search Based Analysis") {
                  Get.to(() => const SearchAnalysis());
                }
                if (selecteditems == "Keyword Based Analysis") {
                  Get.to(() => const KeywordAnalysis());
                }
              },
              name: "Next",
              buttonwidth: 0.20,
              buttonheight: 0.05,
              textStyle:
                  const TextStyle(fontSize: 12, ),
            ),
            height30,
          ],
        ),
      ),
    );
  }
}
