import 'package:ads/src/class/campaign_prospect.dart';
import 'package:ads/src/homepage/customapp_bar.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignDashboard extends StatefulWidget {
  const CampaignDashboard({super.key});

  @override
  State<CampaignDashboard> createState() => _CampaignDashboardState();
}

class _CampaignDashboardState extends State<CampaignDashboard> {
  bool light = false;
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(elevation: 0, toolbarHeight: 0),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomAppBar(
                name: "Campaign", imagepath: "assets/images/campaign.svg"),
            height20,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            height5,
            Container(
              height: Get.height * 0.54,
              width: Get.width,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xffE5E5E5),
                ),
              ),
              child: Column(
                children: [
                  height10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const Spacer(),
                        const Text(
                          'Off',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        kwidth5,
                        CupertinoSwitch(
                          trackColor: kblack.withOpacity(0.6),
                          activeColor: const Color(0xff1A377D).withOpacity(0.6),
                          value: light,
                          onChanged: (bool value) {
                            setState(() {
                              light = value;
                            });
                          },
                        ),
                        kwidth5,
                        Text(
                          'On',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: kblack.withOpacity(0.5),
                          ),
                        ),
                        const Spacer(),
                        PopupMenuButton<String>(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          onSelected: (String result) {
                            print(result);
                            setState(() {});
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              onTap: () {
                                setState(() {});
                              },
                              value: 'option1',
                              child: const Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.square_pencil,
                                    size: 18,
                                    color: Colors.red,
                                  ),
                                  kwidth15,
                                  Expanded(
                                    child: Text('Edit',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: 'option2',
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.square_on_square,
                                      size: 18),
                                  kwidth10,
                                  Expanded(
                                    child: Text('Duplicate',
                                        style: TextStyle(
                                          fontSize: 12,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: 'option3',
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.pin_fill, size: 18),
                                  kwidth10,
                                  Expanded(
                                    child: Text('Unpin',
                                        style: TextStyle(
                                          fontSize: 12,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: 'option4',
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.chart_bar_fill, size: 18),
                                  kwidth10,
                                  Expanded(
                                    child: Text(
                                      'View Charts',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          icon: const Icon(Icons.more_horiz_rounded),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: kblack.withOpacity(0.2), indent: 30),
                  height10,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Campaign Type :",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "     Prospect",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/peter_tshirt.png"),
                      kwidth20,
                      const Text(
                        "Peter Parker Yellow Tshirt",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  height20,
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: CampaignProspect.campaigndetails.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(6),
                        padding: const EdgeInsets.only(left: 26),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                CampaignProspect.campaigndetails[index]["name"],
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Text("-"),
                            kwidth30,
                            Expanded(
                              child: Text(
                                CampaignProspect.campaigndetails[index]
                                    ["subname"],
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
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
    );
  }
}
