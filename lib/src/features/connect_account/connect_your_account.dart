import 'package:ads/src/features/connect_account/widget/account_container.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ConnectYourAccounts extends StatefulWidget {
  final bool? includeAccountContainer;

  const ConnectYourAccounts({
    super.key,
    this.includeAccountContainer = true,
  });

  static const routerPath = '/ConnectYourAccounts';
  @override
  State<ConnectYourAccounts> createState() => _ConnectYourAccountsState();
}

class _ConnectYourAccountsState extends State<ConnectYourAccounts> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
          child: Column(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kblue77D.withOpacity(0.10),
                ),
                child: Center(
                  child: SvgPicture.asset(IconAssets.metaicon,
                      fit: BoxFit.contain),
                ),
              ),
              height15,
              const Text(
                "Connect Your Accounts",
                style: TextStyle(

                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              height10,
              Text(
                "We don’t use or make any changes to your account and you can easily disconnect it whenever you want",
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w500,

                  fontSize: 13,
                  color: kblack.withOpacity(0.45),
                ),
              ),
              height25,
              Divider(color: kblack.withOpacity(0.2), thickness: 1),
              height25,
              const Column(
                children: [
                  AccountContainer(
                    issubtitle: true,
                    titlename: "Connect your Facebook Account",
                    subtitlename:
                        "Ads Impact needs access to your\nGoogle Account to access Ad-\nStats",
                    imageUrl: ImageAssets.fbwhite,
                  ),
                  height25,
                  AccountContainer(
                    issubtitle: true,
                    titlename: "Connect your Twitter Account",
                    subtitlename:
                        "Ads Impact needs access to your\nTwitter Account to access Ad-\nStats",
                    imageUrl: ImageAssets.twitterwhite,
                  ),
                  height25,
                  AccountContainer(
                    issubtitle: true,
                    titlename: "Connect your Linkedin Account",
                    subtitlename:
                        "Ads Impact needs access to your\nLinkedin Account to access Ad-\nStats",
                    imageUrl: ImageAssets.linkdinwhite,
                  ),
                  height25,
                  AccountContainer(
                    issubtitle: true,
                    titlename: "Connect your Google Account",
                    subtitlename:
                        "Ads Impact needs access to your\nGoogle Account to access Ad-\nStats",
                    imageUrl: ImageAssets.googlewhite,
                  ),
                  height25,
                  AccountContainer(
                    issubtitle: true,
                    isdropdown: true,
                    titlename: "Connect your Social Media Account",
                    subtitlename:
                        "Ads Impact needs access to your\nSocial media Account to access\nAd-Stats",
                    imageUrl: ImageAssets.connectwhite,
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
              height30,
            ],
          ),
        ),
      ),
    );
  }
}
