import 'dart:ui';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MenuListtile extends StatelessWidget {
  final String iconimgae;
  final String title;
  final bool istrailing;
  final VoidCallback ontap;
  final double fontsize;

  const MenuListtile({
    super.key,
    required this.istrailing,
    required this.iconimgae,
    required this.title,
    required this.ontap,
    this.fontsize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 45,
        child: ListTile(
          horizontalTitleGap: 6,
          minVerticalPadding: 0,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          onTap: ontap,
          iconColor: kblack,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset(iconimgae),
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
                  if (istrailing)
                    const Icon(Icons.keyboard_arrow_down_outlined),
                ],
              ),
              height5,
            ],
          ),
        ),
      ),
    );
  }
}

class PopupMenu extends StatelessWidget {
  final BuildContext context;
  final String submenuimage;
  final String submenutitle;
  final String menu1icon;
  final String menu1title;
  final VoidCallback menutap1;
  final String menu2icon;
  final String menu2title;
  final VoidCallback menutap2;
  final String? menu3icon;
  final String? menu3title;
  final VoidCallback? menutap3;
  final bool? isMenu3;
  final String? menu4icon;
  final String? menu4title;
  final VoidCallback? menutap4;
  final bool? isMenu4;

  const PopupMenu({
    super.key,
    required this.context,
    required this.submenuimage,
    required this.submenutitle,
    required this.menu1icon,
    required this.menu1title,
    required this.menutap1,
    required this.menu2icon,
    required this.menu2title,
    required this.menutap2,
    this.menu3icon,
    this.menu3title,
    this.menutap3,
    this.isMenu3,
    this.menu4icon,
    this.menu4title,
    this.isMenu4,
    this.menutap4,
  });

  void showPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              Positioned(
                top: screenHeight * 0.3,
                left: screenWidth * 0.15 + 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  width: screenWidth * 0.55,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                            style: const TextStyle(

                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                          kwidth20,
                        ],
                      ),
                      height10,
                      menudivider,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MenuListtile(
                            istrailing: false,
                            iconimgae: menu1icon,
                            title: menu1title,
                            ontap: menutap1,
                            fontsize: 10,
                          ),
                          menudivider,
                          MenuListtile(
                            istrailing: false,
                            iconimgae: menu2icon,
                            title: menu2title,
                            ontap: menutap2,
                            fontsize: 10,
                          ),
                          if ((isMenu3 ?? false) &&
                              menu3icon != null &&
                              menu3title != null)
                            menudivider,
                          if ((isMenu3 ?? false) &&
                              menu3icon != null &&
                              menu3title != null)
                            MenuListtile(
                              istrailing: false,
                              iconimgae: menu3icon!,
                              title: menu3title!,
                              ontap: menutap3!,
                              fontsize: 10,
                            ),
                          if ((isMenu4 ?? false) &&
                              menu4icon != null &&
                              menu4title != null)
                            menudivider,
                          if ((isMenu4 ?? false) &&
                              menu4icon != null &&
                              menu4title != null)
                            MenuListtile(
                              istrailing: false,
                              iconimgae: menu4icon!,
                              title: menu4title!,
                              fontsize: 10,
                              ontap: menutap4 ?? () {},
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
