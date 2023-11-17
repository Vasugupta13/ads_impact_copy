import 'package:ads/connect_account/connect_your_account2.dart';
import 'package:ads/const.dart';
import 'package:ads/home_page/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AccountIDDropDown extends StatefulWidget {
  final double sizeboxheight;
  final double containerheight;
  final String titlename;
  final String subtitlename;
  final bool isdropdown;

  final String imageUrl;
  final String accountname;

  const AccountIDDropDown({
    Key? key,
    required this.titlename,
    required this.subtitlename,
    required this.imageUrl,
    required this.accountname,
    required this.containerheight,
    required this.sizeboxheight,
    required this.isdropdown,
  }) : super(key: key);

  @override
  State<AccountIDDropDown> createState() => _AccountIDDropDownState();
}

class _AccountIDDropDownState extends State<AccountIDDropDown> {
  String? valuechooseaccount;
  String? valuechooseid;

  List sicalmediaaccount = [
    "Sharechat",
    "Instagram",
    "Yahoo",
    "Telegram",
    "Whatsapp",
    "Social",
    "Media"
  ];

  List adidaccount = [
    "Ella Lewis12123415",
    "Robert Johnson535315",
    "Daniel Hall53523524",
    "John Doe23432432",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.sizeboxheight,
      width: Get.width,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: widget.containerheight,
            width: Get.width,
            decoration: BoxDecoration(
              color: const Color(0xff1A377D).withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  widget.titlename,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                height5,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(
                    color: kblack.withOpacity(0.20),
                    thickness: 1,
                  ),
                ),
                height15,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Container(
                    height: 36,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton(
                      focusColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      underline: Container(),
                      borderRadius: BorderRadius.circular(28),
                      value: valuechooseid,
                      hint: Text(
                        "Choose your Ad  Account",
                        style: TextStyle(
                            color: kblack.withOpacity(0.4),
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                      dropdownColor: Colors.white,
                      icon: SvgPicture.asset(
                        "assets/images/arrow-square-down.svg",
                        fit: BoxFit.contain,
                        height: 18,
                      ),
                      isExpanded: true,
                      style: TextStyle(
                          color: kblack.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      items: adidaccount.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Center(
                              child: Text(
                            valueItem,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: valueItem == valuechooseid
                                    ? const Color(0xffFF4848)
                                    : kblack),
                          )),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(
                          () {
                            valuechooseid = newValue as String?;
                          },
                        );
                      },
                    ),
                  ),
                ),
                height15,
                if (widget.isdropdown)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Container(
                      height: 36,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButton(
                        focusColor: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        underline: Container(),
                        borderRadius: BorderRadius.circular(28),
                        value: valuechooseaccount,
                        hint: Text(
                          "Choose your Socail Media  Account",
                          style: TextStyle(
                              color: kblack.withOpacity(0.20),
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                        dropdownColor: Colors.white,
                        icon: SvgPicture.asset(
                          "assets/images/arrow-square-down.svg",
                          fit: BoxFit.contain,
                          height: 18,
                        ),
                        isExpanded: true,
                        style: TextStyle(
                            color: kblack.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                        items: sicalmediaaccount.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Center(
                                child: Text(
                              valueItem,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: valueItem == valuechooseaccount
                                      ? const Color(0xffFF4848)
                                      : kblack),
                            )),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(
                            () {
                              valuechooseaccount = newValue as String?;
                            },
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.off(() => const HomePage());
                  },
                  child: Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xff1A377D),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          widget.imageUrl,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          widget.accountname,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: kwhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SmoothPageIndicator(
                  controller: PageController(),
                  count: 2,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xff1A377D),
                    dotHeight: 8,
                    dotWidth: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
