import 'package:ads/src/class/campaign_prospect.dart';
import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignDashboard extends StatefulWidget {
  const CampaignDashboard({super.key});
  static const routerPath = '/CampaignDashboard';

  @override
  State<CampaignDashboard> createState() => _CampaignDashboardState();
}

class _CampaignDashboardState extends State<CampaignDashboard> {
  bool light = false;
  int selectedIndex = 0;
  bool isPinned = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomAppBar(
                  name: "Campaign", imagepath: IconAssets.submenucampaign),
              height10,
              Container(
                height: screenHeight * 0.54,
                width: screenWidth,
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xffE5E5E5),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isPinned
                              ? const Icon(CupertinoIcons.pin_slash_fill,
                                  size: 18, color: kred)
                              : const Icon(CupertinoIcons.pin,
                                  size: 18, color: kblack),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Off',
                                style: TextStyle(
                                    fontFamily: FontAssets.Poppins,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              kwidth5,
                              Transform.scale(
                                scale: 0.7,
                                child: CupertinoSwitch(
                                  trackColor: kblack.withOpacity(0.6),
                                  activeColor:
                                      const Color(0xff1A377D).withOpacity(0.6),
                                  value: light,
                                  onChanged: (bool value) {
                                    setState(() {
                                      light = value;
                                    });
                                  },
                                ),
                              ),
                              kwidth5,
                              Text(
                                'On',
                                style: TextStyle(
                                  fontFamily: FontAssets.Poppins,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: kblack.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          PopupMenuButton<String>(
                            color: kwhite,
                            surfaceTintColor: kwhite,
                            onSelected: (String result) {
                              setState(() {
                                selectedIndex = int.parse(result);
                                if (selectedIndex == 2) {
                                  isPinned = !isPinned;
                                }
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              buildPopupMenuItem(
                                  'Edit',
                                  CupertinoIcons.square_pencil,
                                  selectedIndex == 0 ? kred : kblack,
                                  '0'),
                              buildPopupMenuItem(
                                  'Duplicate',
                                  CupertinoIcons.square_on_square,
                                  selectedIndex == 1 ? kred : kblack,
                                  '1'),
                              buildPopupMenuItem(
                                  isPinned ? 'Unpin' : 'Pin',
                                  isPinned
                                      ? CupertinoIcons.pin
                                      : CupertinoIcons.pin_slash_fill,
                                  selectedIndex == 2 ? kred : kblack,
                                  '2'),
                              buildPopupMenuItem(
                                  'View Charts',
                                  CupertinoIcons.chart_bar_fill,
                                  selectedIndex == 3 ? kred : kblack,
                                  '3'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    divider161,
                    height10,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Campaign Type :    ",
                          style: TextStyle(
                              fontFamily: FontAssets.Poppins,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Prospect",
                          style: TextStyle(
                              fontFamily: FontAssets.Poppins,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    height20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageAssets.peterparker,
                            height: screenHeight * 0.05),
                        kwidth20,
                        const Text(
                          "Peter Parker Yellow Tshirt",
                          style: TextStyle(
                              fontFamily: FontAssets.Poppins,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    height20,
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: CampaignProspect.campaigndetails.length,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(7),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  CampaignProspect.campaigndetails[index]
                                      ["name"],
                                  style: const TextStyle(
                                      fontFamily: FontAssets.Poppins,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Text("-"),
                              kwidth30,
                              Expanded(
                                child: Text(
                                  CampaignProspect.campaigndetails[index]
                                      ["subname"],
                                  style: const TextStyle(
                                      fontFamily: FontAssets.Poppins,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PopupMenuItem<String> buildPopupMenuItem(
  String text,
  IconData icon,
  Color color,
  String value,
) {
  return PopupMenuItem<String>(
    value: value,
    child: Row(
      children: [
        Icon(icon, size: 18, color: color),
        kwidth10,
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                color: color,
                fontFamily: FontAssets.Poppins,
                fontWeight: FontWeight.w500,
                fontSize: 10),
          ),
        ),
      ],
    ),
  );
}
