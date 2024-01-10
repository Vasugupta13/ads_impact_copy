import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/common_widget/catalog_list_view.dart';
import 'package:ads/src/features/common_widget/custom_app_bar.dart';
import 'package:ads/src/features/common_widget/customdropdown.dart';
import 'package:ads/src/features/common_widget/elevatedbutton.dart';
import 'package:ads/src/res/campaign_analysis.dart';
import 'package:ads/src/utils/const.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

final List<String> items = [
  "Clicks",
  "Impressions",
  "CTR",
  "Spends(INR)",
  "Cart Adds",
  "Purchases",
  "ROAS"
];
String? selectedvalue;

class CampaignAnalysis extends StatefulWidget {
  const CampaignAnalysis({super.key});

  @override
  State<CampaignAnalysis> createState() => _CampaignAnalysisState();
}

class _CampaignAnalysisState extends State<CampaignAnalysis> {
  TableRow buildRow(List<String> cells) => TableRow(
          children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Text(
              cell,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
        );
      }).toList());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 42),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CustomAppBar(
                name: "Analysis",
                imagepath: "assets/images/campaign_analysis.svg"),
            height20,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            height5,
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
                    SvgPicture.asset('assets/images/calendar-edit.svg',
                        fit: BoxFit.contain),
                    const Text("Select Date Range"),
                    SvgPicture.asset('assets/images/arrow-square-down.svg',
                        fit: BoxFit.contain, height: 22),
                  ],
                ),
              ),
            ),
            height20,
            CatalogListView(
              containerwidth: 0.85,
              names: const ["Default View", "Website View", "Performance View"],
              onTapCallback: (int index) {},
            ),
            height20,
            CustomDropDown(
              containerwidth: 0.45,
              dropdownItems: items,
              hint: 'Impressions',
              onChanged: (String? value) {
                setState(() {
                  selectedvalue = value;
                });
              },
              value: selectedvalue,
            ),
            height20,
            Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: kblack.withOpacity(0.4),
                ),
              ),
              child: Column(
                children: [
                  Table(
                    border: TableBorder(
                      verticalInside:
                          BorderSide(color: kblack.withOpacity(0.4)),
                      bottom: BorderSide(
                        color: kblack.withOpacity(0.4),
                      ),
                    ),
                    children: [
                      buildRow(
                        ["Date", "Impressions"],
                      ),
                    ],
                  ),
                  Table(
                    border: TableBorder(
                      verticalInside: BorderSide(
                        width: 1,
                        color: kblack.withOpacity(0.4),
                      ),
                    ),
                    children: CampaignAnalysisDetails.analysisdetails
                        .map(
                          (category) => buildRow(
                            [
                              category["date"].toString(),
                              category["impressions"].toString(),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            height30,
            CommonElevatedButton(
              ontap: () {},
              name: "Total Summary:   18,47,563",
              buttonwidth: 0.40,
              buttonheight: 0.07,
              textStyle: const TextStyle(
                fontSize: 12,
                color: kwhite,
              ),
            ),
            height30,
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
