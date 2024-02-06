import 'package:ads/src/class/adset_analysis.dart';
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

class AdsetAnalysis extends StatefulWidget {
  const AdsetAnalysis({super.key});
  static const routerPath = '/AdsetAnalysis';

  @override
  State<AdsetAnalysis> createState() => _AdsetAnalysisState();
}

class _AdsetAnalysisState extends State<AdsetAnalysis> {
  final List<String> items = ["Retargetting", "Prospect", "Dynamic"];
  String? selecteditem = 'Prospect';

  final List<String> value = [
    "CTR",
    "Spends",
    "CPM",
    "Link Clicks",
    "Add to Cart",
    "AOV",
    "ROAS"
  ];

  String? selectedvalue = "Spends";
  int listindex = 0;
  final NumberFormat formatter = NumberFormat("#,##0.00", "en_US");
  List<Map<String, String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    updateTable();
  }

  void updateTable() {
    filteredData = AdsetAnalysisDetails.prospect
        .map((category) => {
              "prospect": category["prospect"].toString(),
              "value": category[selectedvalue!.toLowerCase()].toString(),
              "previous": category["previous"].toString(),
            })
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double total = AdsetAnalysisDetails.prospect.fold(
        0.0,
        (sum, category) =>
            sum +
            double.parse(
                category[selectedvalue!.toLowerCase()].replaceAll(',', '')));

    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBar(
                  name: "Adset Analysis", imagepath: IconAssets.analysis),
              height5,
              const CustomCalendar(),
              height20,
              CatalogListView(
                borderRadiusBottomRight: 12,
                borderRadiusTopRight: 12,
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
              height20,
              CustomDropDown(
                containerheight: 30,
                containerwidth: screenWidth * 0.5,
                value: selecteditem,
                dropdownItems: items,
                onChanged: (String? value) {
                  setState(() {
                    selecteditem = value;
                  });
                },
              ),
              height30,
              CustomDropDown(
                containerheight: 30,
                containerwidth: screenWidth * 0.4,
                value: selectedvalue,
                dropdownItems: value,
                onChanged: (String? value) {
                  setState(() {
                    selectedvalue = value;
                    updateTable();
                  });
                },
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
                      columnWidths: {
                        0: FractionColumnWidth(listindex == 1 ? 0.50 : 0.6),
                        1: FractionColumnWidth(listindex == 1 ? 0.25 : 0.4),
                        if (listindex == 1) 2: const FractionColumnWidth(0.25)
                      },
                      border: const TableBorder(
                        verticalInside: BorderSide(
                          color: Color(0xffE5E5E5),
                        ),
                        bottom: BorderSide(
                          color: Color(0xffE5E5E5),
                        ),
                      ),
                      children: [
                        buildRow([
                          "Campaign - Prospect",
                          selectedvalue ?? '',
                          if (listindex == 1) "Previous"
                        ], fontWeight: FontWeight.w600),
                      ],
                    ),
                    Table(
                      columnWidths: {
                        0: FractionColumnWidth(listindex == 1 ? 0.50 : 0.6),
                        1: FractionColumnWidth(listindex == 1 ? 0.25 : 0.4),
                        if (listindex == 1) 2: const FractionColumnWidth(0.25)
                      },
                      border: const TableBorder(
                        verticalInside:
                            BorderSide(width: 1, color: Color(0xffE5E5E5)),
                      ),
                      children: filteredData
                          .map((category) => buildRow([
                                category["prospect"]!,
                                category['value']!,
                                if (listindex == 1) category['previous']!,
                              ], fontWeight: FontWeight.w500))
                          .toList(),
                    ),
                  ],
                ),
              ),
              height15,
              Divider(
                color: kblack.withOpacity(0.1),
                indent: 16,
              ),
              height15,
              CommonElevatedButton(
                ontap: () {},
                name: "Total Summary:   ${formatter.format(total)}",
                buttonwidth: 0.6,
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

  TableRow buildRow(List<String> cells, {FontWeight? fontWeight}) => TableRow(
        children: cells
            .map(
              (cell) => Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    cell,
                    style: TextStyle(fontWeight: fontWeight, fontSize: 11),
                  ),
                ),
              ),
            )
            .toList(),
      );
}
