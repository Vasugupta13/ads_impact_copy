import 'package:ads/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ConnectYourAccounts extends StatefulWidget {
  const ConnectYourAccounts({super.key});

  @override
  State<ConnectYourAccounts> createState() => _ConnectYourAccountsState();
}

class _ConnectYourAccountsState extends State<ConnectYourAccounts> {
  String? valuechoose;
  List listitem = [
    "Sharechat",
    "Instagram",
    "Yahoo",
    "Telegram",
    "Whatsapp",
    "Social",
    "Media"
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: kwhite,
        appBar: AppBar(
          backgroundColor: kwhite,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 76,
                width: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff1A377D).withOpacity(0.10),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/ri_meta-fill.svg",
                    fit: BoxFit.contain,
                    height: 42,
                  ),
                ),
              ),
              height10,
              const Text(
                "Connect Your Accounts",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              height10,
              Text(
                "We don’t use or make any changes to your account and you can easily disconnect it whenever you wnat",
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: kblack.withOpacity(0.45)),
              ),
              height25,
              Divider(
                color: kblack.withOpacity(0.20),
                thickness: 1,
              ),
              height25,
              const AccountView(
                  titlename: "Connect your Facebook Account",
                  subtitlename:
                      "Ads Impact needs access to your\nFacebook Account to access Ad-\nStats",
                  imageUrl: "assets/images/ic_baseline-facebook.svg",
                  accountname: "Connect"),
              height25,
              const AccountView(
                  titlename: "Connect your Twitter Account",
                  subtitlename:
                      "Ads Impact needs access to your\nTwitter Account to access Ad-\nStats",
                  imageUrl: "assets/images/mdi_twitter.svg",
                  accountname: "Connect"),
              height25,
              const AccountView(
                  titlename: "Connect your Linkedin Account",
                  subtitlename:
                      "Ads Impact needs access to your\nLinkedin Account to access Ad-\nStats",
                  imageUrl: "assets/images/in.svg",
                  accountname: "Connect"),
              height25,
              const AccountView(
                  titlename: "Connect your Google Account",
                  subtitlename:
                      "Ads Impact needs access to your\nGoogle Account to access Ad-\nStats",
                  imageUrl: "assets/images/bi_google.svg",
                  accountname: "Connect"),
              height25,
              Container(
                height: 250,
                width: Get.width,
                color: kwhite,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 210,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: const Color(0xff1A377D).withOpacity(0.10),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Connect your Social Media Account",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          height5,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Divider(
                              color: kblack.withOpacity(0.20),
                              thickness: 1,
                            ),
                          ),
                          height5,
                          Text(
                            "Ads Impact needs access to your\nSocial media Account to access\nAd- Stats",
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: TextStyle(
                              color: kblack.withOpacity(0.60),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          height15,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 42,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: kwhite,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: DropdownButton(
                                focusColor: Colors.red,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 23),
                                underline: Container(),
                                borderRadius: BorderRadius.circular(18),
                                value: valuechoose,
                                hint: Text(
                                  "Choose your Social Media Account",
                                  style: TextStyle(
                                      color: kblack.withOpacity(0.4),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                dropdownColor: Colors.white,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: kblack.withOpacity(0.4),
                                ),
                                iconSize: 26,
                                isExpanded: true,
                                style: TextStyle(
                                    color: kblack.withOpacity(0.5),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                                items: listitem.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Center(
                                        child: Text(
                                      valueItem,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: valueItem == valuechoose
                                              ? const Color(0xffFF4848)
                                              : kblack),
                                    )),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(
                                    () {
                                      valuechoose = newValue as String?;
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
                          Container(
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
                                  "assets/images/connect.svg",
                                  fit: BoxFit.contain,
                                ),
                                const Text(
                                  "Connect",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: kwhite,
                                  ),
                                ),
                              ],
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
              ),
              height30,
              Padding(
                padding: const EdgeInsets.only(bottom: 40, left: 34, right: 34),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Step 4",
                      style: TextStyle(
                          fontSize: 14,
                          color: kblack,
                          fontWeight: FontWeight.w600),
                    ),
                    height5,
                    LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(18),
                      minHeight: 10,
                      backgroundColor: Colors.black.withOpacity(0.7),
                      value: 0.8,
                      valueColor:
                          const AlwaysStoppedAnimation(Color(0xffFF4848)),
                    ),
                  ],
                ),
              ),
              height20,
            ],
          ),
        ),
      ),
    );
  }
}

class AccountView extends StatelessWidget {
  final String titlename;
  final String subtitlename;
  final String imageUrl;
  final String accountname;

  const AccountView(
      {super.key,
      required this.titlename,
      required this.subtitlename,
      required this.imageUrl,
      required this.accountname});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: Get.width,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 140,
            width: Get.width,
            decoration: BoxDecoration(
              color: const Color(0xff1A377D).withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  titlename,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
                height5,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(
                    color: kblack.withOpacity(0.20),
                    thickness: 1,
                  ),
                ),
                height5,
                Text(
                  subtitlename,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    color: kblack.withOpacity(0.60),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Container(
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
                        imageUrl,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        accountname,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: kwhite,
                        ),
                      ),
                    ],
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
