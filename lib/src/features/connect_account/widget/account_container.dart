
import 'package:ads/src/features/connect_account/connect_your_account2.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AccountView extends StatefulWidget {
  final double sizeboxheight;
  final double containerheight;
  final String titlename;
  final String subtitlename;
  final bool? issubtitle;
  final String imageUrl;
  // final String accountname;
  final bool? isdropdown;

  const AccountView({
    Key? key,
    required this.titlename,
    required this.subtitlename,
    required this.imageUrl,
    // required this.accountname,
    this.isdropdown,
    required this.containerheight,
    required this.sizeboxheight,
    this.issubtitle,
  }) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  String? valuechoose;
  bool isDropDownOpen = false;
  List<String> listitem = [
    "Sharechat",
    "Instagram",
    "Yahoo",
    "Telegram",
    "Whatsapp",
    "Social",
    "Media"
  ];

  String? selectedvalue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.sizeboxheight,
      width: Get.width * 0.90,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: widget.containerheight,
            width: Get.width,
            decoration: BoxDecoration(
              color: kblue77D.withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  widget.titlename,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
                height5,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(color: kblack.withOpacity(0.2), thickness: 1),
                ),
                height5,
                if (widget.issubtitle!)
                  Text(
                    widget.subtitlename,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style:
                        TextStyle(color: kblack.withOpacity(0.6), fontSize: 12),
                  ),
                height5,
                if (widget.isdropdown!)
                  Container(
                    height: 42,
                    width: Get.width * 0.7,
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton(
                      focusColor: kred,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      underline: Container(),
                      borderRadius: BorderRadius.circular(12),
                      value: valuechoose,
                      hint: Text(
                        "Choose your Social Media Account",
                        style: TextStyle(
                            color: kblack.withOpacity(0.4), fontSize: 12),
                      ),
                      dropdownColor: kwhite,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: kblack.withOpacity(0.4),
                      ),
                      iconSize: 26,
                      isExpanded: true,
                      style: TextStyle(
                          color: kblack.withOpacity(0.5), fontSize: 12),
                      items: listitem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Center(
                              child: Text(
                            valueItem,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color:
                                    valueItem == valuechoose ? kred : kblack),
                          )),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(
                          () {
                            valuechoose = newValue;
                          },
                        );
                      },
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
                    if (valuechoose != null) {
                      Get.off(() => const ConnectYourAccount2());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Please select an item from the dropdown."),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: Get.height * 0.05,
                    width: Get.width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kblue77D,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(widget.imageUrl, fit: BoxFit.contain),
                        const Text(
                          "Connect",
                          style: TextStyle(fontSize: 14, color: kwhite),
                        ),
                      ],
                    ),
                  ),
                ),
                height15,
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
