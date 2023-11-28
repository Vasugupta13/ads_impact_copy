import 'dart:ui';

import 'package:ads/src/features/dashboard/dashboard_view.dart';
import 'package:ads/src/features/forget_password/create_new_password.dart';
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
              _showPopup(context);
            },
          ),
          customDivider(
              color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          menuItemWithDropdown(
              "Insights", "assets/images/insights_icon.svg", () {}),
          customDivider(
              color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          menuItemWithDropdown(
              "Campaign", "assets/images/campaign_icon.svg", () {}),
          customDivider(
              color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          menuItem("Audience Insights", "assets/images/audience_insights.svg",
              () {}),
          customDivider(
              color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          menuItem("Automations", "assets/images/automations_icon.svg", () {}),
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
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w500, color: kblack),
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
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w500, color: kblack),
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

  void _showPopup(BuildContext context) {
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
                  child: Container(
                    height: 180,
                    width: 40,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/images/catlog_icon.svg"),
                            kwidth10,
                            const Text(
                              "Catalog",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        customDivider(
                            color: kblack.withOpacity(0.2),
                            endIndent: 10,
                            indent: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                  "assets/images/categories_icon.svg"),
                              kwidth10,
                              const Text(
                                "Categories",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        customDivider(
                            color: kblack.withOpacity(0.2),
                            endIndent: 10,
                            indent: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                  "assets/images/products_icon.svg"),
                              kwidth10,
                              const Text(
                                "Products",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        customDivider(
                            color: kblack.withOpacity(0.2),
                            endIndent: 10,
                            indent: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assets/images/info_icon.svg"),
                              kwidth10,
                              const Text(
                                "Catalog Information",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
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
