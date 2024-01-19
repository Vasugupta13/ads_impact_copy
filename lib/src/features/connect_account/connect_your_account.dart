import 'package:ads/src/features/connect_account/widget/account_container.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ConnectYourAccounts extends StatefulWidget {
  final bool? includeAccountView;

  const ConnectYourAccounts({
    super.key,
    this.includeAccountView = true,
  });

  @override
  State<ConnectYourAccounts> createState() => _ConnectYourAccountsState();
}

class _ConnectYourAccountsState extends State<ConnectYourAccounts> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(backgroundColor: kwhite, elevation: 0),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height * 0.12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kblue77D.withOpacity(0.10),
                ),
                child: Center(
                  child: SvgPicture.asset("assets/images/meta_icon.svg",
                      fit: BoxFit.contain),
                ),
              ),
              const Text(
                "Connect Your Accounts",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              height10,
              Text(
                "We don’t use or make any changes to your account and you can easily disconnect it whenever you want",
                maxLines: 2,
                style: TextStyle(fontSize: 13, color: kblack.withOpacity(0.45)),
              ),
              height25,
              Divider(color: kblack.withOpacity(0.2), thickness: 1),
              height25,
              // Stack(
              //   children: [
              //     Container(
              //       height: 200,
              //       width: Get.width,
              //       color: kblack,
              //       child: Column(
              //         children: [
              //           Container(
              //             padding: const EdgeInsets.symmetric(
              //                 horizontal: 16, vertical: 10),
              //             height: 150,
              //             width: Get.width * 0.75,
              //             color: kred,
              //             child: const Column(
              //               children: [
              //                 Text(
              //                   "sachin",
              //                   style: TextStyle(
              //                       color: kwhite,
              //                       fontWeight: FontWeight.w800,
              //                       fontSize: 20),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Positioned(
              //       bottom: 30,
              //       left: 0,
              //       right: 0,
              //       child: Align(
              //         alignment: Alignment.center,
              //         child: Container(
              //           height: 30,
              //           width: 140,
              //           color: kblue77D,
              //           child: const Text(
              //             "Data",
              //             style: TextStyle(color: kwhite),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              const Column(
                children: [
                  AccountView(
                    issubtitle: true,
                    isdropdown: false,
                    sizeboxheight: 190,
                    containerheight: 150,
                    titlename: "Connect your Facebook Account",
                    subtitlename:
                        "Ads Impact needs access to your\nGoogle Account to access Ad-\nStats",
                    imageUrl: "assets/images/fb_logo.svg",
                  ),
                  height25,
                  AccountView(
                    issubtitle: true,
                    sizeboxheight: 190,
                    containerheight: 150,
                    isdropdown: false,
                    titlename: "Connect your Twitter Account",
                    subtitlename:
                        "Ads Impact needs access to your\nTwitter Account to access Ad-\nStats",
                    imageUrl: "assets/images/twitter_logo.svg",
                  ),
                  height25,
                  AccountView(
                    issubtitle: true,
                    sizeboxheight: 190,
                    containerheight: 150,
                    isdropdown: false,
                    titlename: "Connect your Linkedin Account",
                    subtitlename:
                        "Ads Impact needs access to your\nLinkedin Account to access Ad-\nStats",
                    imageUrl: "assets/images/linkedin_logo.svg",
                  ),
                  height25,
                  AccountView(
                    issubtitle: true,
                    sizeboxheight: 190,
                    containerheight: 150,
                    isdropdown: false,
                    titlename: "Connect your Google Account",
                    subtitlename:
                        "Ads Impact needs access to your\nGoogle Account to access Ad-\nStats",
                    imageUrl: "assets/images/google_logo.svg",
                  ),
                  height25,
                  AccountView(
                    issubtitle: true,
                    sizeboxheight: 234,
                    containerheight: 186,
                    isdropdown: true,
                    titlename: "Connect your Google Account",
                    subtitlename:
                        "Ads Impact needs access to your\nSocial media Account to access\nAd-Stats",
                    imageUrl: "assets/images/crown.svg",
                  ),
                ],
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
