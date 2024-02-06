import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/common/views/customdropdown.dart';
import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/features/menu/campaign/campaign_analysis.dart';
import 'package:ads/src/features/menu/insights/view/adset_analysis.dart';
import 'package:ads/src/features/menu/insights/view/creative_analysis.dart';
import 'package:ads/src/features/menu/insights/view/keyword_analysis.dart';
import 'package:ads/src/features/menu/insights/view/platform_analysis.dart';
import 'package:ads/src/features/menu/insights/view/region_analysis.dart';
import 'package:ads/src/features/menu/insights/view/search_analysis.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final List<String> items = [
  "Platform",
  "Campaign",
  "Adset",
  "Creative",
];
String? selectedvalue = "Platform";

final List<String> targetitems = [
  "Region",
  "Keyword",
  "Search",
];
String? selecteditems = "Region";

class GranularAnalysis extends StatefulWidget {
  const GranularAnalysis({super.key});
  static const routerPath = '/GranularAnalysis';

  @override
  State<GranularAnalysis> createState() => _GranularAnalysisState();
}

class _GranularAnalysisState extends State<GranularAnalysis> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBar(
                  name: "Granular Analysis", imagepath: IconAssets.analysis),
              height20,
              const Text(
                "Performance Based Analysis",
                style: TextStyle(

                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              height5,
              Text(
                "About the performance of Campaign, Adsets and Ads",
                style: TextStyle(

                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  color: kblack.withOpacity(0.56),
                ),
              ),
              height20,
              CustomDropDown(
                containerheight: 30,
                containerwidth: screenWidth * 0.5,
                dropdownItems: items,
                initialValue: "Platform",
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
                    if (selectedvalue == "Platform") {
                      // context.push(PlatformAnalysis.routerPath);
                      Get.to(() => const PlatformAnalysis());
                    } else if (selectedvalue == "Adset") {
                      // context.push(AdsetAnalysis.routerPath);
                      Get.to(() => const AdsetAnalysis());
                    } else {
                      if (selectedvalue == "Creative") {
                        // context.push(CreativeAnalysis.routerPath);

                        Get.to(() => const CreativeAnalysis());
                      } else {
                        if (selectedvalue == "Campaign") {
                          // context.push(CampaignAnalysis.routerPath);

                          Get.to(() => const CampaignAnalysis());
                        }
                      }
                    }
                  },
                  name: "Next",
                  buttonwidth: 0.45,
                  textStyle: elevatedtextstyle),
              height30,
              divider161,
              height20,
              const Text(
                "Target Based Analysis",
                style: TextStyle(
                  
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              height5,
              Text(
                "About the performance of Campaign, Adsets and Ads",
                style: TextStyle(

                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  color: kblack.withOpacity(0.56),
                ),
              ),
              height20,
              CustomDropDown(
                containerheight: 30,
                containerwidth: screenWidth * 0.5,
                initialValue: 'Region',
                dropdownItems: targetitems,
                value: selecteditems,
                onChanged: (String? value) {
                  setState(() {
                    selecteditems = value;
                  });
                },
              ),
              height25,
              CommonElevatedButton(
                  ontap: () {
                    if (selecteditems == "Region") {
                      // context.push(RegionAnalysis.routerPath);
                      Get.to(() => const RegionAnalysis());
                    }
                    if (selecteditems == "Search") {
                      // context.push(SearchAnalysis.routerPath);
                      Get.to(() => const SearchAnalysis());
                    }
                    if (selecteditems == "Keyword") {
                      // context.push(KeywordAnalysis.routerPath);
                      Get.to(() => const KeywordAnalysis());
                    }
                  },
                  name: "Next",
                  buttonwidth: 0.45,
                  textStyle: elevatedtextstyle),
              height30,
            ],
          ),
        ),
      ),
    );
  }
}
