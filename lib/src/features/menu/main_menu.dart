import 'dart:ui';
import 'package:ads/src/features/menu/audience%20insights/audience_insights.dart';
import 'package:ads/src/features/menu/automations/automations_view.dart';
import 'package:ads/src/features/menu/campaign/campaign_analysis.dart';
import 'package:ads/src/features/menu/campaign/campaign_create.dart';
import 'package:ads/src/features/menu/catalog/catalog_information.dart';
import 'package:ads/src/features/menu/catalog/categories.dart';
import 'package:ads/src/features/menu/catalog/products.dart';
import 'package:ads/src/features/menu/dashboard/dashboard_view.dart';
import 'package:ads/src/features/menu/insights/granular_analysis.dart';
import 'package:ads/src/features/menu/widgets/submenu.dart';
import 'package:ads/src/features/menu/widgets/try_ourpacks.dart';
import 'package:ads/src/features/sign-up/widget/custom_signup_page.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainMenuPopup extends StatefulWidget {
  const MainMenuPopup({super.key});

  @override
  State<MainMenuPopup> createState() => _MainMenuPopupState();
}

class _MainMenuPopupState extends State<MainMenuPopup> {
  @override
  Widget build(BuildContext context) {
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                  iconimgae: "assets/images/dashboard_icon.svg",
                  title: "Dashboard",
                  ontap: () {
                    Get.to(() => const DashboardView());
                  },
                ),
                divider16,
                MenuListtile(
                  iconimgae: "assets/images/catlog_icon.svg",
                  title: "Catalog",
                  istrailing: true,
                  ontap: () {
                    PopupMenu(
                      context: context,
                      submenuimage: "assets/images/catlog_icon.svg",
                      submenutitle: "Catalog",
                      menu1icon: "assets/images/categories_icon.svg",
                      menu1title: "Categories",
                      menutap1: () {
                        Get.to(() => const MenuCatalogCategories());
                      },
                      menu2icon: "assets/images/products_icon.svg",
                      menu2title: "Products",
                      menutap2: () {
                        Get.to(() => const MenuCatalogProducts());
                      },
                      isMenu3: true,
                      menu3icon: "assets/images/info_icon.svg",
                      menu3title: "Catalog Information",
                      menutap3: () {
                        Get.to(() => const MenuCatalogInformation());
                      },
                    ).showPopup();
                  },
                ),
                divider16,
                MenuListtile(
                  istrailing: true,
                  iconimgae: "assets/images/insights_icon.svg",
                  title: "Insights",
                  ontap: () {
                    PopupMenu(
                      isMenu3: true,
                      isMenu4: true,
                      context: context,
                      submenuimage: "assets/images/insights_icon.svg",
                      submenutitle: "Insights",
                      menu1icon: "assets/images/status_insights_icon.svg",
                      menu1title: "Status",
                      menutap1: () {
                        Get.to(() => const MenuCatalogProducts());
                      },
                      menu2icon: "assets/images/insights_chart_icon.svg",
                      menu2title: "Analysis",
                      menutap2: () {
                        Get.to(() => const GranularAnalysis());
                      },
                      menu3icon: "assets/images/insights_chart_icon.svg",
                      menu3title: "Granular Analysis",
                      menutap3: () {
                        Get.to(() => const MenuCatalogInformation());
                      },
                      menu4icon: "assets/images/insights_chart_icon.svg",
                      menu4title: "ROAS Analyzer",
                    ).showPopup();
                  },
                ),
                divider16,
                MenuListtile(
                  istrailing: true,
                  iconimgae: "assets/images/campaign_icon.svg",
                  title: "Campaign",
                  ontap: () {
                    PopupMenu(
                      context: context,
                      submenuimage: "assets/images/campaign_icon.svg",
                      submenutitle: "Create",
                      menu1icon: "assets/images/campaign_submenu_icon.svg",
                      menu1title: "Campaign",
                      menutap1: () {
                        Get.to(() => const CampaignCreate());
                      },
                      menu2icon: "assets/images/insights_chart_icon.svg",
                      menu2title: "Analysis",
                      menutap2: () {
                        Get.to(() => const CampaignAnalysis());
                      },
                    ).showPopup();
                  },
                ),
                divider16,
                MenuListtile(
                    istrailing: false,
                    ontap: () {
                      Get.to(() => const AudienceInsights());
                    },
                    iconimgae: "assets/images/audience_insights.svg",
                    title: "Audience Insights"),
                divider16,
                MenuListtile(
                    istrailing: false,
                    ontap: () {
                      Get.to(() => const Automation());
                    },
                    iconimgae: "assets/images/automations_icon.svg",
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
                    fontSize: 12, fontWeight: FontWeight.w400, color: kwhite),
                height: Get.height * 0.05,
                paintwidth: Get.width * 0.5),
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
