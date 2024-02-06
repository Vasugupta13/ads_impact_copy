import 'dart:ui';
import 'package:ads/src/features/menu/audience%20insights/audience_insights.dart';
import 'package:ads/src/features/menu/automations/automations_view.dart';
import 'package:ads/src/features/menu/campaign/campaign_analysis.dart';
import 'package:ads/src/features/menu/campaign/campaign_create.dart';
import 'package:ads/src/features/menu/catalog/catalog_information.dart';
import 'package:ads/src/features/menu/catalog/categories.dart';
import 'package:ads/src/features/menu/catalog/catalog_products.dart';
import 'package:ads/src/features/menu/dashboard/dashboard_view.dart';
import 'package:ads/src/features/menu/insights/granular_analysis.dart';
import 'package:ads/src/features/menu/widgets/menulistile.dart';
import 'package:ads/src/features/menu/widgets/try_ourpacks.dart';
import 'package:ads/src/features/sign-up/widget/custom_signup_page.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class MainMenuPopup extends StatefulWidget {
  const MainMenuPopup({super.key});

  @override
  State<MainMenuPopup> createState() => _MainMenuPopupState();
}

class _MainMenuPopupState extends State<MainMenuPopup> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), color: kwhite),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, size: 18),
                ),
                kwidth30,
                const Expanded(
                  child: Text(
                    "Menu",
                    style: TextStyle(
                        
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: kblack.withOpacity(0.2), height: 1.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                MenuListtile(
                  istrailing: false,
                  iconimgae: IconAssets.menudashboard,
                  title: "Dashboard",
                  ontap: () {
                    // context.push(DashboardView.routerPath);
                    Get.to(() => const DashboardView());
                  },
                ),
                divider16,
                MenuListtile(
                  iconimgae: IconAssets.menucatalog,
                  title: "Catalog",
                  istrailing: true,
                  ontap: () {
                    PopupMenu(
                      context: context,
                      submenuimage: IconAssets.menucatalog,
                      submenutitle: "Catalog",
                      menu1icon: IconAssets.submenucategories,
                      menu1title: "Categories",
                      menutap1: () {
                        // context.push(MenuCatalogCategories.routerPath);

                        Get.to(() => const MenuCatalogCategories());
                      },
                      menu2icon: IconAssets.submenuproducts,
                      menu2title: "Products",
                      menutap2: () {
                        // context.push(MenuCatalogCategories.routerPath);
                        Get.to(() => const MenuCatalogProducts());
                      },
                      isMenu3: true,
                      menu3icon: IconAssets.submenucataloginfo,
                      menu3title: "Catalog Information",
                      menutap3: () {
                        // context.push(MenuCatalogCategories.routerPath);
                        Get.to(() => const MenuCatalogInformation());
                      },
                    ).showPopup();
                  },
                ),
                divider16,
                MenuListtile(
                  istrailing: true,
                  iconimgae: IconAssets.menuinsights,
                  title: "Insights",
                  ontap: () {
                    PopupMenu(
                      isMenu3: true,
                      isMenu4: true,
                      context: context,
                      submenuimage: IconAssets.menuinsights,
                      submenutitle: "Insights",
                      menu1icon: IconAssets.submenustatus,
                      menu1title: "Status",
                      menutap1: () {
                        // Get.to(() => const MenuCatalogProducts());
                      },
                      menu2icon: IconAssets.submenuanalysis,
                      menu2title: "Analysis",
                      menutap2: () {
                        // Get.to(() => const GranularAnalysis());
                      },
                      menu3icon: IconAssets.submenuanalysis,
                      menu3title: "Granular Analysis",
                      menutap3: () {
                        Get.to(() => const GranularAnalysis());
                      },
                      menu4icon: IconAssets.submenuanalysis,
                      menu4title: "ROAS Analyzer",
                    ).showPopup();
                  },
                ),
                divider16,
                MenuListtile(
                  istrailing: true,
                  iconimgae: IconAssets.menucampaign,
                  title: "Campaign",
                  ontap: () {
                    PopupMenu(
                      context: context,
                      submenuimage: IconAssets.menucampaign,
                      submenutitle: "Create",
                      menu1icon: IconAssets.submenucampaign,
                      menu1title: "Campaign",
                      menutap1: () {
                        // context.push(CampaignCreate.routerPath);
                        Get.to(() => const CampaignCreate());
                      },
                      menu2icon: IconAssets.submenuanalysis,
                      menu2title: "Analysis",
                      menutap2: () {
                        // context.push(CampaignAnalysis.routerPath);
                        Get.to(() => const CampaignAnalysis());
                      },
                    ).showPopup();
                  },
                ),
                divider16,
                MenuListtile(
                    istrailing: false,
                    ontap: () {
                      // context.push(AudienceInsights.routerPath);
                      Get.to(() => const AudienceInsights());
                    },
                    iconimgae: IconAssets.menuaudience,
                    title: "Audience Insights"),
                divider16,
                MenuListtile(
                    istrailing: false,
                    ontap: () {
                      // context.push(Automation.routerPath);
                      Get.to(() => const Automation());
                    },
                    iconimgae: IconAssets.menuautomation,
                    title: "Automation"),
              ],
            ),
          ),
          height10,
          Align(
            alignment: Alignment.centerLeft,
            child: CompanyContainer(
                titlename: "Try Our Packs",
                textStyle: const TextStyle(

                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: kwhite),
                height: screenHeight * 0.05,
                paintwidth: screenWidth * 0.5),
          ),
          height10,
          dividerind16,
          height20,
          const TryOurPacks(),
          height20
        ],
      ),
    );
  }
}
