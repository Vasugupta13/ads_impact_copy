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
import 'package:ads/src/features/sign-up/widget/sign_up_view.dart';
import 'package:ads/src/utils/const.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
          BoxDecoration(borderRadius: BorderRadius.circular(12), color: kwhite),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    _showPopup(
                      context,
                      "assets/images/catlog_icon.svg",
                      "Catalog",
                      "assets/images/categories_icon.svg",
                      "Categories",
                      () {
                        Get.to(() => const MenuCatalogCategories());
                      },
                      "assets/images/products_icon.svg",
                      "Products",
                      () {
                        Get.to(() => const MenuCatalogProducts());
                      },
                      "assets/images/info_icon.svg",
                      "Catalog Information",
                      () {
                        Get.to(() => const MenuCatalogCategories());
                      },
                    );
                  },
                ),
                divider16,
                MenuListtile(
                  istrailing: true,
                  iconimgae: "assets/images/insights_icon.svg",
                  title: "Insights",
                  ontap: () {},
                ),
                divider16,
                MenuListtile(
                  istrailing: true,
                  iconimgae: "assets/images/campaign_icon.svg",
                  title: "Campaign",
                  ontap: () {},
                ),
                divider16,
                MenuListtile(
                    istrailing: false,
                    ontap: () {},
                    iconimgae: "assets/images/audience_insights.svg",
                    title: "Audience Insights"),
                divider16,
                MenuListtile(
                    istrailing: false,
                    ontap: () {},
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
          threePacks(),
          height10

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     SvgPicture.asset("assets/images/dashboard_icon.svg"),
          //     kwidth15,
          //     const Expanded(
          //       child: Text(
          //         "Dashboard",
          //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          //       ),
          //     ),
          //   ],
          // ),
          // customDivider(
          //     endIndent: 0, indent: 0, color: kblack.withOpacity(0.1)),
          // menuItem("Dashboard", "assets/images/dashboard_icon.svg", () {
          //   Get.to(() => const DashboardView(),
          //       transition: Transition.leftToRightWithFade);
          // }),
          // customDivider(
          //     color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          // menuItemWithDropdown(
          //   "Catalog",
          //   "assets/images/catlog_icon.svg",
          //   () {
          //     _showPopup(
          //         context,
          //         "assets/images/catlog_icon.svg",
          //         "Catalog",
          // () {
          //   Get.to(() => const MenuCatalogCategories());
          // },
          //         "assets/images/categories_icon.svg",
          //         "Categories",
          // () {
          //   Get.to(() => const MenuCatalogProducts());
          // },
          // "assets/images/products_icon.svg",
          // "Products",
          //         ontapmenu3: () {
          //           Get.to(() => const MenuCatalogInformation());
          //         },
          // submenuimage3: "assets/images/info_icon.svg",
          // submenutitle3: "Catalog Information");
          //   },
          // ),
          // customDivider(
          //     color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          // menuItemWithDropdown("Insights", "assets/images/insights_icon.svg",
          //     () {
          //   _showPopup(
          //       context,
          //       "assets/images/insights_icon.svg",
          //       "Insights",
          //       () {
          //         Get.to(() => ());
          //       },
          //       "assets/images/status_insights_icon.svg",
          //       "Status",
          //       () {
          //         Get.to(() => const MenuCatalogProducts());
          //       },
          //       "assets/images/insights_chart_icon.svg",
          //       "Analysis",
          //       ontapmenu3: () {
          //         Get.to(() => const GranularAnalysis());
          //       },
          //       submenuimage3: "assets/images/insights_chart_icon.svg",
          //       submenutitle3: "Granular Analysis",
          //       ontapmenu4: () {
          //         Get.to(() => const MenuCatalogInformation());
          //       },
          //       submenuimage4: "assets/images/insights_chart_icon.svg",
          //       submenutitle4: "ROAS Analyzer");
          // }),
          // customDivider(
          //     color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          // menuItemWithDropdown("Campaign", "assets/images/campaign_icon.svg",
          //     () {
          //   _showPopup(
          //     context,
          //     "assets/images/campaign_icon.svg",
          //     "Create",
          //     () {
          //       Get.to(() => const CampaignCreate());
          //     },
          //     "assets/images/campaign_submenu_icon.svg",
          //     "Campaign",
          //     () {
          //       Get.to(() => const CampaignAnalysis());
          //     },
          //     "assets/images/insights_chart_icon.svg",
          //     "Analysis",
          //   );
          // }),
          // customDivider(
          //     color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          // menuItem("Audience Insights", "assets/images/audience_insights.svg",
          //     () {
          //   Get.to(() => const AudienceInsights());
          // }),
          // customDivider(
          //     color: kblack.withOpacity(0.2), endIndent: 18, indent: 18),
          // menuItem("Automations", "assets/images/automations_icon.svg", () {
          //   Get.to(() => const Automation());
          // }),
          // height30,
          // flagImage("assets/images/redflag.svg", "Try Our Packs", 35),
          // height30,
          // threePacks(),
          // height20,
        ],
      ),
    );
  }
}

class MenuListtile extends StatelessWidget {
  final String iconimgae;
  final String title;
  final bool istrailing;
  final VoidCallback ontap;
  final double fontsize;

  const MenuListtile({
    Key? key,
    required this.istrailing,
    required this.iconimgae,
    required this.title,
    required this.ontap,
    this.fontsize = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListTile(
        horizontalTitleGap: 6,
        minVerticalPadding: 0,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        onTap: ontap,
        iconColor: kblack,
        title: Row(
          children: [
            SvgPicture.asset(
              iconimgae,
              height: Get.height * 0.02 + 3,
            ),
            kwidth20,
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: fontsize,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            if (istrailing) const Icon(Icons.keyboard_arrow_down_outlined),
          ],
        ),
      ),
    );
  }
}

//   Widget menuItem(String text, String iconPath, void Function() onPressed) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16),
//       child: GestureDetector(
//         onTap: onPressed,
//         child: Row(
//           children: [
//             SvgPicture.asset(iconPath),
//             kwidth15,
//             Text(
//               text,
//               style: const TextStyle(fontSize: 12, color: kblack),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// Widget menuItemWithDropdown(
//     String text, String iconPath, void Function() ontap) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 36, right: 26),
//     child: GestureDetector(
//       onTap: ontap,
//       child: Row(
//         children: [
//           SvgPicture.asset(iconPath),
//           kwidth15,
//           Text(
//             text,
//             style: const TextStyle(fontSize: 12, color: kblack),
//           ),
//           const Spacer(),
//           const Icon(Icons.keyboard_arrow_down_outlined),
//           kwidth15,
//         ],
//       ),
//     ),
//   );
// }

// Widget flagImage(String imagePath, String text, double leftPosition) {
//   return Align(
//     alignment: Alignment.centerLeft,
//     child: Stack(
//       children: [
//         SvgPicture.asset(imagePath, fit: BoxFit.contain),
//         Positioned(
//           left: leftPosition,
//           top: 4,
//           right: 25,
//           bottom: 0,
//           child: Text(
//             text,
//             style: const TextStyle(
//                 fontSize: 12, fontWeight: FontWeight.w400, color: kwhite),
//           ),
//         ),
//       ],
//     ),
//   );
// }

Widget threePacks() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: packsUI(
          "Basic Pack",
          "assets/images/basicpack.png",
          () {
            print("Basic Pack");
          },
        )),
        kwidth10,
        Expanded(
            child: packsUI(
          "Pro Pack",
          "assets/images/propack.png",
          () {
            print("Pro Pack");
          },
        )),
        kwidth10,
        Expanded(
            child: packsUI(
          "Advance Pack",
          "assets/images/advancepack.png",
          () {
            print("Advance Pack");
          },
        )),
      ],
    ),
  );
}

Widget packsUI(String name, String imagePath, VoidCallback onTap) {
  return Center(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.15,
        color: kwhite,
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.15 - 10,
              // width: Get.width,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: kwhite,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                      color: kblack.withOpacity(0.25),
                      spreadRadius: 0),
                ],
              ),
              child: Column(
                children: [
                  Image.asset(imagePath,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.medium,
                      height: Get.height * 0.1 / 2.5),
                  height5,
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 8),
                  ),
                  Divider(
                      color: kblack.withOpacity(0.2),
                      endIndent: 16,
                      indent: 16),
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
                  color: kred,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Buy Now",
                    style: TextStyle(color: kwhite, fontSize: 6),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void _showPopup(
  BuildContext context,
  String submenuimage,
  String submenutitle,
  String menu1icon,
  String menu1title,
  VoidCallback menutap1,
  String menu2icon,
  String menu2title,
  VoidCallback menutap2,
  String menu3icon,
  String menu3title,
  VoidCallback menutap3, {
  String? menu4icon,
  String? menu4title,
  bool? isMenu4 = false,
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
                color: kwhite.withOpacity(0.2),
              ),
            ),
            Positioned(
              top: 200,
              left: 70,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                width: Get.width * 0.55,
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(submenuimage),
                        kwidth20,
                        Text(
                          submenutitle,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    height10,
                    Divider(
                      height: 1.0,
                      color: kblack.withOpacity(0.2),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 0,
                      child: MenuListtile(
                        istrailing: false,
                        iconimgae: menu1icon,
                        title: menu1title,
                        ontap: menutap1,
                      ),
                    ),
                    divider161,
                    Material(
                      color: Colors.transparent,
                      elevation: 0,
                      child: MenuListtile(
                        istrailing: false,
                        iconimgae: menu2icon,
                        title: menu2title,
                        ontap: menutap2,
                      ),
                    ),
                    divider161,

                    Material(
                      color: Colors.transparent,
                      elevation: 0,
                      child: MenuListtile(
                        istrailing: false,
                        iconimgae: menu3icon,
                        title: menu3title,
                        ontap: menutap3,
                      ),
                    ),

                    if (isMenu4 ??
                        false && menu4icon != null && menu4title != null)
                      divider161,
                    if (isMenu4 ??
                        false && menu4icon != null && menu4title != null)
                      Material(
                        color: Colors.transparent,
                        elevation: 0,
                        child: MenuListtile(
                          istrailing: false,
                          iconimgae: menu4icon!,
                          title: menu4title!,
                          ontap: () {},
                        ),
                      ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20),
                    //   child: GestureDetector(
                    //     onTap: ontapmenu1,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         SvgPicture.asset(submenuimage1),
                    //         kwidth10,
                    //         Text(submenutitle1,
                    //             style: const TextStyle(
                    //               fontSize: 12,
                    //             )),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // divider16,
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20),
                    //   child: GestureDetector(
                    //     onTap: ontapmenu2,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         SvgPicture.asset(submenuimage2),
                    //         kwidth10,
                    //         Text(
                    //           submenutitle2,
                    //           style: const TextStyle(
                    //             fontSize: 12,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // if (ontapmenu3 != null &&
                    //     submenuimage3 != null &&
                    //     submenutitle3 != null) ...[
                    //   divider16,
                    //   Padding(
                    //     padding: const EdgeInsets.only(left: 20),
                    //     child: GestureDetector(
                    //       onTap: ontapmenu3,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           SvgPicture.asset(submenuimage3),
                    //           kwidth10,
                    //           Text(
                    //             submenutitle3,
                    //             style: const TextStyle(
                    //               fontSize: 12,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                  ],
                  // if (ontapmenu4 != null &&
                  //     submenuimage4 != null &&
                  //     submenutitle4 != null) ...[
                  //   divider16,
                  //   Padding(
                  //     padding: const EdgeInsets.only(left: 20),
                  //     child: GestureDetector(
                  //       onTap: ontapmenu4,
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           SvgPicture.asset(submenuimage4),
                  //           kwidth10,
                  //           Text(
                  //             submenutitle4,
                  //             style: const TextStyle(
                  //               fontSize: 12,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
