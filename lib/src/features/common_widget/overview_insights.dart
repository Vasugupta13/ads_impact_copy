import 'package:ads/src/features/common_widget/insight_view.dart';
import 'package:ads/src/features/common_widget/social_account_overview_details.dart';
import 'package:ads/src/homepage/social_account_list_widget.dart';
import 'package:ads/src/model/social_media_info.dart';
import 'package:ads/src/res/socialmediainfo.dart';
import 'package:ads/src/res/strings.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
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
                      color: currentindex == 0
                          ? const Color(0xff1A377D)
                          : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.4), width: 0.5),
                    ),
                    child: Center(
                      child: Text(
                        'OverView',
                        style: TextStyle(
                            color: currentindex == 0 ? Colors.white : kblack,
                            fontWeight: FontWeight.w500),
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
                      color: currentindex == 0
                          ? Colors.white
                          : const Color(0xff1A377D),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.4), width: 0.5),
                    ),
                    child: Center(
                      child: Text(
                        'Insights',
                        style: TextStyle(
                            color: currentindex == 0 ? kblack : Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        height20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Container(
            height: 40,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color(0xff1A377D).withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/calendar-edit.svg',
                  fit: BoxFit.contain,
                ),
                const Text("Select Date Range"),
                SvgPicture.asset(
                  'assets/images/arrow-square-down.svg',
                  fit: BoxFit.contain,
                  height: 22,
                ),
              ],
            ),
          ),
        ),
        height25,
        SocialAccountList(
          onTapCallback: (index) {
            setState(() {
              listindex = index;
              if (index == 0) {
                currentDetails = facebookSocialMediaResponse.data;
              } else if (index == 1) {
                currentDetails = twitterlMediaResponse.data;
              } else if (index == 2) {
                currentDetails = googleSociaMediaResponse.data;
              } else if (index == 3) {
                currentDetails = linkedinSocialMediaResponse.data;
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
