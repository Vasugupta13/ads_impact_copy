import 'package:ads/src/features/connect_account/views/account_view.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  issubtitle: true,
                  isdropdown: false,
                  sizeboxheight: 190,
                  containerheight: 150,
                  titlename: "Connect your Google Account",
                  subtitlename:
                      "Ads Impact needs access to your\nGoogle Account to access Ad-\nStats",
                  imageUrl: "assets/images/bi_google.svg",
                  accountname: "Connect"),
              height25,
              const AccountView(
                  issubtitle: true,
                  sizeboxheight: 190,
                  containerheight: 150,
                  isdropdown: false,
                  titlename: "Connect your Twitter Account",
                  subtitlename:
                      "Ads Impact needs access to your\nTwitter Account to access Ad-\nStats",
                  imageUrl: "assets/images/twi.svg",
                  accountname: "Connect"),
              height25,
              const AccountView(
                  issubtitle: true,
                  sizeboxheight: 190,
                  containerheight: 150,
                  isdropdown: false,
                  titlename: "Connect your Linkedin Account",
                  subtitlename:
                      "Ads Impact needs access to your\nLinkedin Account to access Ad-\nStats",
                  imageUrl: "assets/images/in.svg",
                  accountname: "Connect"),
              height25,
              const AccountView(
                  issubtitle: true,
                  sizeboxheight: 190,
                  containerheight: 150,
                  isdropdown: false,
                  titlename: "Connect your Google Account",
                  subtitlename:
                      "Ads Impact needs access to your\nGoogle Account to access Ad-\nStats",
                  imageUrl: "assets/images/bi_google.svg",
                  accountname: "Connect"),
              height25,
              const AccountView(
                  issubtitle: true,
                  sizeboxheight: 234,
                  containerheight: 186,
                  isdropdown: true,
                  titlename: "Connect your Google Account",
                  subtitlename:
                      "Ads Impact needs access to your\nSocial media Account to access\nAd-Stats",
                  imageUrl: "assets/images/crown.svg",
                  accountname: "Connect"),
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
