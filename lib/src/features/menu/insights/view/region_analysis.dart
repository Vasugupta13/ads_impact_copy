import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/common_widget/catalog_list_view.dart';
import 'package:ads/src/homepage/customapp_bar.dart';
import 'package:ads/src/features/common_widget/customdropdown.dart';
import 'package:ads/src/features/common_widget/custom_elevatedbutton.dart';
import 'package:ads/src/res/region_analysis.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

final List<String> value = [
  "CTR",
  "Spends",
  "CPM",
  "Link Clicks",
  "Add to Cart",
  "AOV",
  "ROAS"
];
String? selectedvalue;

class RegionAnalysis extends StatefulWidget {
  const RegionAnalysis({super.key});

  @override
  State<RegionAnalysis> createState() => _RegionAnalysisState();
}

class _RegionAnalysisState extends State<RegionAnalysis> {
  int listindex = 0;
  TableRow buildRow(List<String> cells) => TableRow(
          children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Text(
              cell,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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
                name: "Region Analysis",
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
              containerwidth: 0.75,
              alignment: Alignment.center,
              names: const [
                "Default View",
                "Comparison View",
              ],
              onTapCallback: (int index) {
                setState(() {
                  listindex = index;
                });
              },
            ),
            height30,
            CustomDropDown(
              containerheight: 0.5,
              containerwidth: 0.35,
              dropdownItems: value,
              hint: 'Select Item',
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
                border: Border.all(color: const Color(0xffE5E5E5)),
              ),
              child: Column(
                children: [
                  Table(
                    border: const TableBorder(
                      verticalInside: BorderSide(
                        color: Color(0xffE5E5E5),
                      ),
                      bottom: BorderSide(
                        color: Color(0xffE5E5E5),
                      ),
                    ),
                    children: [
                      buildRow(
                          ["Place", "Spends", if (listindex == 1) "Previous"]),
                    ],
                  ),
                  Table(
                    border: const TableBorder(
                      verticalInside:
                          BorderSide(width: 1, color: Color(0xffE5E5E5)),
                    ),
                    children: RegionAnalysisDetail.placedetails
                        .map(
                          (category) => buildRow(
                            [
                              category["place"].toString(),
                              category["spends"].toString(),
                              if (listindex == 1)
                                category["previous"].toString()
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
              name: "Total Summary:   10,434",
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
