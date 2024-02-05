import 'package:ads/src/class/campaign_analysis.dart';
import 'package:ads/src/common/views/catalog_list_view.dart';
import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/common/views/customdropdown.dart';
import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/homepage/widgets/custom_calendar.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CampaignAnalysis extends StatefulWidget {
  const CampaignAnalysis({super.key});
  static const routerPath = '/CampaignAnalysis';
  @override
  State<CampaignAnalysis> createState() => _CampaignAnalysisState();
}

class _CampaignAnalysisState extends State<CampaignAnalysis> {
  final List<String> items = [
    "Clicks",
    "Impressions",
    "CTR",
    "Spends(INR)",
    "Cart Adds",
    "Purchases",
    "ROAS"
  ];
  String? selectedvalue = "Impressions";

  final NumberFormat formatter = NumberFormat("#,##0.00", "en_US");
  List<Map<String, String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    selectedvalue = items[1];
    updateTable();
  }

  void updateTable() {
    filteredData = CampaignAnalysisDetails.analysisdetails
        .map((category) => {
              "Date": category["date"].toString(),
              "value": category[selectedvalue!.toLowerCase()].toString(),
            })
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double total = CampaignAnalysisDetails.analysisdetails.fold(
        0.0,
        (sum, category) =>
            sum +
            double.parse(
                category[selectedvalue?.toLowerCase()].replaceAll(',', '')));

    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBar(
                  name: "Analysis", imagepath: IconAssets.analysis),
              height5,
              const CustomCalendar(),
              height20,
              CatalogListView(
                names: const [
                  "Default View",
                  "Website View",
                  "Performance View"
                ],
                onTapCallback: (int index) {},
              ),
              height20,
              CustomDropDown(
                containerheight: 30,
                containerwidth: screenWidth * 0.5,
                value: selectedvalue,
                dropdownItems: items,
                initialValue: 'Impressions',
                onChanged: (String? value) {
                  setState(() {
                    selectedvalue = value;
                  });
                },
              ),
              height20,
              Container(
                margin: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: kblack.withOpacity(0.21),
                  ),
                ),
                child: Column(
                  children: [
                    Table(
                      border: TableBorder(
                        verticalInside:
                            BorderSide(color: kblack.withOpacity(0.21)),
                        bottom: BorderSide(
                          color: kblack.withOpacity(0.21),
                        ),
                      ),
                      children: [
                        buildRow(['Date', selectedvalue ?? '']),
                      ],
                    ),
                    Table(
                      border: TableBorder(
                        verticalInside: BorderSide(
                          width: 1,
                          color: kblack.withOpacity(0.21),
                        ),
                      ),
                      children: CampaignAnalysisDetails.analysisdetails
                          .map(
                            (category) => buildRow(
                              [
                                category["date"] ?? '',
                                category[selectedvalue?.toLowerCase()]
                                        ?.toString() ??
                                    ''
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
                name: "Total Summary:   ${formatter.format(total)}",
                buttonwidth: 0.65,
                textStyle: elevatedtextstyle,
              ),
              height30,
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

TableRow buildRow(List<String> cells) => TableRow(
      children: cells
          .map(
            (cell) => Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Text(
                  cell,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          )
          .toList(),
    );
