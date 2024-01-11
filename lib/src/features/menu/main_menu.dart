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
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PopupMenuView extends StatefulWidget {
  const PopupMenuView({super.key});

  @override
  State<PopupMenuView> createState() => _PopupMenuViewState();
}

class _PopupMenuViewState extends State<PopupMenuView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(22), color: kwhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ),
              ),
              kwidth50,
              const Expanded(
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          customDivider(
              endIndent: 0, indent: 0, color: kblack.withOpacity(0.1)),
          menuItem("Dashboard", "assets/images/dashboard_icon.svg", () {
            Get.to(() => const DashboardView(),
                transition: Transition.leftToRightWithFade);
          }),
          customDivider(
              color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          menuItemWithDropdown(
            "Catalog",
            "assets/images/catlog_icon.svg",
            () {
              _showPopup(
                  context,
                  "assets/images/catlog_icon.svg",
                  "Catalog",
                  () {
                    Get.to(() => const MenuCatalogCategories());
                  },
                  "assets/images/categories_icon.svg",
                  "Categories",
                  () {
                    Get.to(() => const MenuCatalogProducts());
                  },
                  "assets/images/products_icon.svg",
                  "Products",
                  ontapmenu3: () {
                    Get.to(() => const MenuCatalogInformation());
                  },
                  submenuimage3: "assets/images/info_icon.svg",
                  submenutitle3: "Catalog Information");
            },
          ),
          customDivider(
              color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          menuItemWithDropdown("Insights", "assets/images/insights_icon.svg",
              () {
            _showPopup(
                context,
                "assets/images/insights_icon.svg",
                "Insights",
                () {
                  Get.to(() => ());
                },
                "assets/images/status_insights_icon.svg",
                "Status",
                () {
                  Get.to(() => const MenuCatalogProducts());
                },
                "assets/images/insights_chart_icon.svg",
                "Analysis",
                ontapmenu3: () {
                  Get.to(() => const GranularAnalysis());
                },
                submenuimage3: "assets/images/insights_chart_icon.svg",
                submenutitle3: "Granular Analysis",
                ontapmenu4: () {
                  Get.to(() => const MenuCatalogInformation());
                },
                submenuimage4: "assets/images/insights_chart_icon.svg",
                submenutitle4: "ROAS Analyzer");
          }),
          customDivider(
              color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          menuItemWithDropdown("Campaign", "assets/images/campaign_icon.svg",
              () {
            _showPopup(
              context,
              "assets/images/campaign_icon.svg",
              "Create",
              () {
                Get.to(() => const CampaignCreate());
              },
              "assets/images/campaign_submenu_icon.svg",
              "Campaign",
              () {
                Get.to(() => const CampaignAnalysis());
              },
              "assets/images/insights_chart_icon.svg",
              "Analysis",
            );
          }),
          customDivider(
              color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          menuItem("Audience Insights", "assets/images/audience_insights.svg",
              () {
            Get.to(() => const AudienceInsights());
          }),
          customDivider(
              color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          menuItem("Automations", "assets/images/automations_icon.svg", () {
            Get.to(() => const Automation());
          }),
          height30,
          flagImage("assets/images/redflag.svg", "Try Our Packs", 35),
          height30,
          threePacks(),
          height20,
        ],
      ),
    );
  }

  Widget menuItem(String text, String iconPath, void Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.only(left: 36),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            kwidth15,
            Text(
              text,
              style: const TextStyle(fontSize: 12, color: kblack),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItemWithDropdown(
      String text, String iconPath, void Function() ontap) {
    return Padding(
      padding: const EdgeInsets.only(left: 36, right: 26),
      child: GestureDetector(
        onTap: ontap,
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            kwidth15,
            Text(
              text,
              style: const TextStyle(fontSize: 12, color: kblack),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down_outlined),
            kwidth15,
          ],
        ),
      ),
    );
  }

  Widget flagImage(String imagePath, String text, double leftPosition) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          SvgPicture.asset(imagePath, fit: BoxFit.contain),
          Positioned(
            left: leftPosition,
            top: 4,
            right: 25,
            bottom: 0,
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: kwhite),
            ),
          ),
        ],
      ),
    );
  }

  Widget threePacks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: pack("Basic Pack", "assets/images/basicpack.png")),
        kwidth10,
        Expanded(child: pack("Pro Pack", "assets/images/propack.png")),
        kwidth10,
        Expanded(child: pack("Advance Pack", "assets/images/advancepack.png")),
      ],
    );
  }

  Widget pack(String name, String imagePath) {
    return Center(
      child: Container(
        height: 110,
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: 100,
              width: Get.width,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                    color: kblack.withOpacity(0.25),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.medium,
                    height: 30,
                  ),
                  height5,
                  Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 8)),
                  const Divider(indent: 10, endIndent: 10),
                  const Text("₹ 10,000",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 8)),
                  height2,
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 16,
              child: Container(
                height: 18,
                width: 46,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                child: const Center(
                  child: Text("Buy Now",
                      style: TextStyle(color: kwhite, fontSize: 8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customDivider(
      {required double endIndent,
      required double indent,
      required Color color}) {
    return Divider(
      height: 24,
      color: color,
      endIndent: endIndent,
      indent: indent,
    );
  }

  void _showPopup(
    BuildContext context,
    String menuimage,
    String menutilte,
    VoidCallback ontapmenu1,
    String submenuimage1,
    String submenutitle1,
    VoidCallback ontapmenu2,
    String submenuimage2,
    String submenutitle2, {
    VoidCallback? ontapmenu3,
    String? submenuimage3,
    String? submenutitle3,
    VoidCallback? ontapmenu4,
    String? submenuimage4,
    String? submenutitle4,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              Positioned(
                top: 30,
                bottom: 30,
                left: 20,
                right: 20,
                child: Dialog(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(menuimage),
                              kwidth10,
                              Text(
                                menutilte,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          customDivider(
                            color: kblack.withOpacity(0.2),
                            endIndent: 10,
                            indent: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: ontapmenu1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(submenuimage1),
                                  kwidth10,
                                  Text(submenutitle1,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          customDivider(
                            color: kblack.withOpacity(0.2),
                            endIndent: 10,
                            indent: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: ontapmenu2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(submenuimage2),
                                  kwidth10,
                                  Text(
                                    submenutitle2,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (ontapmenu3 != null &&
                              submenuimage3 != null &&
                              submenutitle3 != null) ...[
                            customDivider(
                              color: kblack.withOpacity(0.2),
                              endIndent: 10,
                              indent: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                onTap: ontapmenu3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(submenuimage3),
                                    kwidth10,
                                    Text(
                                      submenutitle3,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          if (ontapmenu4 != null &&
                              submenuimage4 != null &&
                              submenutitle4 != null) ...[
                            customDivider(
                              color: kblack.withOpacity(0.2),
                              endIndent: 10,
                              indent: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                onTap: ontapmenu4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(submenuimage4),
                                    kwidth10,
                                    Text(
                                      submenutitle4,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
