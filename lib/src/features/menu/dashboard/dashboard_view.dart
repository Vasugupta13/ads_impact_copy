import 'package:ads/src/class/dashboard_creative_spend.dart';
import 'package:ads/src/class/dashboard_platform_spend.dart';
import 'package:ads/src/class/socialmediainfo.dart';
import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/homepage/widgets/spend_istview.dart';
import 'package:ads/src/features/menu/dashboard/widgets/spend_container.dart';
import 'package:ads/src/features/menu/dashboard/widgets/custom_chart_container.dart';
import 'package:ads/src/homepage/widgets/insights_graph.dart';
import 'package:ads/src/homepage/widgets/social_account_list_widget.dart';
import 'package:ads/src/model/social_media_info.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
  static const routerPath = '/DashboardView';

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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(
                  onTapBack: () {
                    Navigator.pop(context);
                  },
                  name: "Dashboard",
                  imagepath: IconAssets.menudashboard),
              height5,
              const Text(
                "Choose Platform:",
                style: TextStyle(
                  fontSize: 14,
                ),
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
              dividerind16,
              height10,
              SocialMediaOverview(
                  dataList: currentDetails, scrollDirection: Axis.horizontal),
              height30,
              const ChartNameContainer(
                  imagepath: IconAssets.analysisbottom,
                  name: "Spends and Revenue Perfomance"),
              height20,
              divider161,
              height10,
              const CommonGraph(
                imagepath: ImageAssets.spendsgraph,
              ),
              height40,
              const ChartNameContainer(
                  imagepath: IconAssets.dashboardroas, name: "ROAS % Trend"),
              height20,
              divider161,
              height10,
              const CommonGraph(
                imagepath: ImageAssets.roasgraph,
              ),
              height40,
              const ChartNameContainer(
                  imagepath: IconAssets.dashboardpurchases, name: "Purchases"),
              height20,
              divider161,
              height10,
              const CommonGraph(
                imagepath: ImageAssets.purchasegraph,
              ),
              height40,
              const ChartNameContainer(
                  imagepath: IconAssets.dashboardconversion,
                  name: "Conversion Rate Trend"),
              height20,
              divider161,
              const CommonGraph(
                imagepath: ImageAssets.conversiongraph,
              ),
              height10,
              divider161,
              height20,
              CommonElevatedButton(
                ontap: () {},
                name: "Platform Wise Spend and ROAS %",
                textStyle: elevatedtextstyle,
                buttonwidth: 0.7,
                buttonheight: 50,
              ),
              height30,
              SpendContainer(data: DashboardSocialMediaData.socialspend),
              height10,
              divider161,
              height20,
              CommonElevatedButton(
                ontap: () {},
                name: "Creative Wise Spend and ROAS %",
                textStyle: elevatedtextstyle,
                buttonwidth: 0.7,
                buttonheight: 50,
              ),
              height30,
              SpendContainer(data: DashboardCreativeSpend.spendname),
              height30,
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
