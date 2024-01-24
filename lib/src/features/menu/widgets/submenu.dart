import 'dart:ui';

import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
  });

  void showPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: Get.height * 0.3,
                left: Get.width * 0.10 + 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  width: Get.width * 0.55,
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
                            style: const TextStyle(fontSize: 14),
                          ),
                          kwidth20,
                        ],
                      ),
                      height10,
                      Divider(
                        height: 1.0,
                        color: Colors.black.withOpacity(0.2),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 0,
                            child: MenuListtile(
                              istrailing: false,
                              iconimgae: menu1icon,
                              title: menu1title,
                              ontap: menutap1,
                              fontsize: 8,
                            ),
                          ),
                          menudivider,
                          Material(
                            color: Colors.transparent,
                            elevation: 0,
                            child: MenuListtile(
                              istrailing: false,
                              iconimgae: menu2icon,
                              title: menu2title,
                              ontap: menutap2,
                              fontsize: 8,
                            ),
                          ),
                          if ((isMenu3 ?? false) &&
                              menu3icon != null &&
                              menu3title != null)
                            menudivider,
                          if ((isMenu3 ?? false) &&
                              menu3icon != null &&
                              menu3title != null)
                            Material(
                              color: Colors.transparent,
                              elevation: 0,
                              child: MenuListtile(
                                istrailing: false,
                                iconimgae: menu3icon!,
                                title: menu3title!,
                                ontap: menutap3!,
                                fontsize: 8,
                              ),
                            ),
                          if ((isMenu4 ?? false) &&
                              menu4icon != null &&
                              menu4title != null)
                            menudivider,
                          if ((isMenu4 ?? false) &&
                              menu4icon != null &&
                              menu4title != null)
                            Material(
                              color: Colors.transparent,
                              elevation: 0,
                              child: MenuListtile(
                                istrailing: false,
                                iconimgae: menu4icon!,
                                title: menu4title!,
                                fontsize: 8,
                                ontap: () {},
                              ),
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
