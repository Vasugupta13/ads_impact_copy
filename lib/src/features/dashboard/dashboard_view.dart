import 'package:ads/src/features/common_widget/custom_app_bar.dart';
import 'package:ads/src/features/common_widget/elevatedbutton.dart';
import 'package:ads/src/features/common_widget/insights_graph.dart';
import 'package:ads/src/features/common_widget/social_account_overview_details.dart';
import 'package:ads/src/features/dashboard/common_container.dart';
import 'package:ads/src/homepage/social_account_list_widget.dart';
import 'package:ads/src/model/social_media_info.dart';
import 'package:ads/src/res/socialmediainfo.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
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
    setState(() {
      currentDetails = facebookSocialMediaResponse.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 42),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBar(
                name: "Dashboard",
                imagepath: "assets/images/dashboard_group.svg"),
            height20,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            height5,
            const Text(
              "Choose Platform:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            height15,
            SocialAccountList(
              onTapCallback: (index) {
                setState(
                  () {
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
                  },
                );
              },
            ),
            height20,
            Divider(
              indent: 26,
              endIndent: 0,
              color: kblack.withOpacity(0.2),
            ),
            SocialMediaOverview(
                dataList: currentDetails, scrollDirection: Axis.horizontal),
            height40,
            const ChartNameContainer(
                imagepath: "assets/images/chart.svg",
                name: "Spends and Revenue Perfomance"),
            height20,
            Divider(
              indent: 26,
              endIndent: 0,
              color: kblack.withOpacity(0.1),
            ),
            const CommonGraph(
              imagepath: 'assets/images/spend_revenue_chart.svg',
            ),
            height40,
            const ChartNameContainer(
                imagepath: "assets/images/roas_icon.svg", name: "ROAS % Trend"),
            height20,
            Divider(
              indent: 26,
              endIndent: 0,
              color: kblack.withOpacity(0.1),
            ),
            const CommonGraph(
              imagepath: 'assets/images/roas_trend_chart.svg',
            ),
            height40,
            const ChartNameContainer(
                imagepath: "assets/images/purchase_icon.svg",
                name: "Purchases"),
            height20,
            Divider(
              indent: 26,
              endIndent: 0,
              color: kblack.withOpacity(0.1),
            ),
            const CommonGraph(
              imagepath: 'assets/images/purchase_chart.svg',
            ),
            height40,
            const ChartNameContainer(
                imagepath: "assets/images/conversion_icon.svg",
                name: "Conversion Rate Trend"),
            height20,
            Divider(
              indent: 26,
              endIndent: 0,
              color: kblack.withOpacity(0.1),
            ),
            const CommonGraph(
              imagepath: 'assets/images/conversion_chart.svg',
            ),
            height10,
            Divider(
              indent: 26,
              endIndent: 0,
              color: kblack.withOpacity(0.1),
            ),
            height20,
            const CommonElevatedButton(
              name: "Platform Wise Spend and ROAS %",
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: kwhite,
                fontSize: 12,
              ),
              buttonwidth: 0.40,
              buttonheight: 0.07,
            ),
            height30,
            Stack(
              //! same for future use (for adding the graph in to it)

              children: [
                Container(
                  height: 210,
                  width: Get.width,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: kblack.withOpacity(0.25),
                        offset: const Offset(0, 4),
                      ),
                    ],
                    color: kwhite,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      height50,
                      Divider(
                        color: kblack.withOpacity(0.1),
                        endIndent: 14,
                        indent: 14,
                      ),
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Facebook"),
                                Text("1,23,567"),
                                Text("550"),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  left: (Get.width - 76) / 2,
                  child: GestureDetector(
                    child: Container(
                      height: 40,
                      width: 76,
                      decoration: const BoxDecoration(
                        color: Color(0xffE8EBF2),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.keyboard_arrow_up),
                          Text(
                            "View More",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
