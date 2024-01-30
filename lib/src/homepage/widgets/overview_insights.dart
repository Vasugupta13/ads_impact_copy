import 'package:ads/src/class/socialmediainfo.dart';
import 'package:ads/src/features/menu/insights/view/adset_analysis.dart';
import 'package:ads/src/homepage/insight_view.dart';
import 'package:ads/src/homepage/spend_istview.dart';
import 'package:ads/src/homepage/widgets/social_account_list_widget.dart';
import 'package:ads/src/model/social_media_info.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HomeDetailsPage extends StatefulWidget {
  const HomeDetailsPage({super.key});

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  bool selectedcontainer1 = true;
  int currentindex = 0;
  bool isSeelected = true;
  int listindex = 0;

  SocialMediaResponse facebookSocialMediaResponse =
      SocialMediaResponse.fromMap(SocialMediaData.facebookData);
  SocialMediaResponse twitterlMediaResponse =
      SocialMediaResponse.fromMap(SocialMediaData.twitterDetails);
  SocialMediaResponse googleSociaMediaResponse =
      SocialMediaResponse.fromMap(SocialMediaData.googledetails);
  SocialMediaResponse linkedinSocialMediaResponse =
      SocialMediaResponse.fromMap(SocialMediaData.linkedinDetails);

  List<SocialMediaInfo> currentDetails = [];

  @override
  void initState() {
    super.initState();
    currentDetails = facebookSocialMediaResponse.data;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentindex = 0;
                    });
                  },
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      color: currentindex == 0 ? kblue77D : kwhite,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      border: Border.all(
                        color: kblack.withOpacity(0.4),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'OverView',
                        style: TextStyle(
                          fontFamily: FontAssets.Poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: currentindex == 0 ? kwhite : kblack,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              kwidth10,
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentindex = 1;
                    });
                  },
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      color: currentindex == 0 ? kwhite : kblue77D,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      border: Border.all(
                        color: kblack.withOpacity(0.4),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Insights',
                        style: TextStyle(
                          fontFamily: FontAssets.Poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: currentindex == 0 ? kblack : kwhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        height30,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              width: screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kblue77D.withOpacity(0.1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    IconAssets.calendaredit,
                    fit: BoxFit.contain,
                  ),
                  const Text("Select Date Range"),
                  SvgPicture.asset(IconAssets.calendararrow,
                      fit: BoxFit.contain),
                ],
              ),
            ),
          ),
        ),
        height25,
        SocialAccountList(
          onTapCallback: (index) {
            setState(() {
              listindex = index;
              if (currentindex == 0) {
                if (index == 0) {
                  currentDetails = facebookSocialMediaResponse.data;
                } else if (index == 1) {
                  currentDetails = twitterlMediaResponse.data;
                } else if (index == 2) {
                  currentDetails = googleSociaMediaResponse.data;
                } else if (index == 3) {
                  currentDetails = linkedinSocialMediaResponse.data;
                }
              } else if (currentindex == 1) {
                if (index == 0) {
                  print("facebook");
                } else if (index == 1) {
                  print("twitter");
                } else if (index == 2) {
                  print("google");
                } else if (index == 3) {
                  print("link");
                }
              }
            });
          },
        ),
        height10,
        if (currentindex == 0)
          SocialMediaOverview(
              dataList: currentDetails, scrollDirection: Axis.vertical),
        if (currentindex == 1)
          InsightView(
            value: listindex,
          ),
      ],
    );
  }
}
