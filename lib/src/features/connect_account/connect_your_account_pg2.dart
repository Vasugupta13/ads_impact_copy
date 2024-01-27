import 'package:ads/src/features/connect_account/widget/account_container.dart';
import 'package:ads/src/features/connect_account/widget/account_drop_down.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConnectYourAccount2 extends StatefulWidget {
  const ConnectYourAccount2({
    super.key,
  });

  static const routerPath = '/ConnectYourAccount2';

  @override
  State<ConnectYourAccount2> createState() => _ConnectYourAccount2State();
}

class _ConnectYourAccount2State extends State<ConnectYourAccount2> {
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
                    fontFamily: FontAssets.Poppins,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              height10,
              Text(
                "We don’t use or make any changes to your account and you can easily disconnect it whenever you want",
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: FontAssets.Poppins,
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
                    issubtitle: false,
                    titlename: "Connect your Facebook Account",
                    imageUrl: ImageAssets.fbwhite,
                  ),
                  height25,
                  AccountContainer(
                    issubtitle: false,
                    titlename: "Connect your Twitter Account",
                    imageUrl: ImageAssets.twitterwhite,
                  ),
                  height25,
                  AccountContainer(
                    issubtitle: false,
                    titlename: "Connect your Linkedin Account",
                    imageUrl: ImageAssets.linkdinwhite,
                  ),
                  height25,
                  AccountContainer(
                    issubtitle: false,
                    titlename: "Connect your Google Account",
                    imageUrl: ImageAssets.googlewhite,
                  ),
                  height25,
                  AccountContainer(
                    issubtitle: false,
                    isdropdown: true,
                    titlename: "Connect your Social Media Account",
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
