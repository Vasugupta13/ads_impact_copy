import 'package:ads/src/common/views/customdropdown.dart';
import 'package:ads/src/features/connect_account/connect_your_account_pg2.dart';
import 'package:ads/src/features/connect_account/widget/account_drop_down.dart';
import 'package:ads/src/utils/const.dart';
import 'package:ads/src/utils/snackbar_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AccountContainer extends StatefulWidget {
  // final double? containerheight;
  final String titlename;
  final String? subtitlename;
  final bool? issubtitle;
  final String imageUrl;
  // final String accountname;
  final bool? isdropdown;
  // final bool? isAdaccountId;

  const AccountContainer({
    super.key,
    required this.titlename,
    this.subtitlename,
    required this.imageUrl,
    // required this.accountname,
    this.isdropdown,
    // this.containerheight,
    this.issubtitle,
    // this.isAdaccountId = true,
  });

  @override
  State<AccountContainer> createState() => _AccountContainerState();
}

class _AccountContainerState extends State<AccountContainer> {
  // String? valuechoose;
  bool isDropDownOpen = false;
  String? idselectedvalue;
  String? socialmediavalue;

  List<String> socialmedia = [
    "Sharechat",
    "Instagram",
    "Yahoo",
    "Telegram",
    "Whatsapp",
    "Social",
    "Media"
  ];

  List<String> adIdAccount = [
    "Ella Lewis12123415",
    "Robert Johnson535315",
    "Daniel Hall53523524",
    "John Doe23432432",
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height:
          widget.isdropdown == true ? screenHeight * 0.32 : screenHeight * 0.25,
      width: screenWidth,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: widget.isdropdown == true
                ? screenHeight * 0.27
                : screenHeight * 0.2,
            width: screenWidth,
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
                if (widget.issubtitle != null && widget.issubtitle!)
                  Text(
                    widget.subtitlename!,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style:
                        TextStyle(color: kblack.withOpacity(0.6), fontSize: 12),
                  )
                else
                  Column(
                    children: [
                      height15,
                      AccountIDDropDown(
                        itemList: adIdAccount,
                        selectedValue: idselectedvalue,
                        menutitle: "",
                        onItemSelected: (String? value) {
                          idselectedvalue = value;
                        },
                      ),
                    ],
                  ),
                height5,
                if (widget.isdropdown != null && widget.isdropdown!)
                  Column(
                    children: [
                      SizedBox(height: widget.issubtitle == false ? 20 : 10),
                      AccountIDDropDown(
                        selectedValue: socialmediavalue,
                        isChooseSocial: true,
                        menutitle: "",
                        itemList: socialmedia,
                        onItemSelected: (String? value) {
                          setState(() {
                            socialmediavalue = value;
                          });
                        },
                      ),
                    ],
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
                    if (socialmediavalue != null) {
                      // context.push(ConnectYourAccount2.routerPath);
                      Get.off(() => const ConnectYourAccount2());
                    } else {
                      SnackBarService.showSnackBar(
                          context: context,
                          message: "Please select an item from the dropdown.");
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
