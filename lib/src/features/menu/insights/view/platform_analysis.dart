import 'dart:io';

import 'package:ads/src/class/platform_analysis_default.dart';
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

class PlatformAnalysis extends StatefulWidget {
  const PlatformAnalysis({super.key});
  static const routerPath = '/PlatformAnalysis';
  @override
  State<PlatformAnalysis> createState() => _PlatformAnalysisState();
}

class _PlatformAnalysisState extends State<PlatformAnalysis> {
  final List<String> items = [
    "CTR",
    "Spends",
    "CPM",
    "Link Clicks",
    "Add to Cart",
    "AOV",
    "ROAS"
  ];

  String? selectedValue = "Spends";
  int listindex = 0;
  final NumberFormat formatter = NumberFormat("#,##0.00", "en_US");
  List<Map<String, String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    updateTable();
  }

  void updateTable() {
    filteredData = PlatformAnalysisDetails.defaultView
        .map((category) => {
              "platform": category["platform"].toString(),
              "value": category[selectedValue!.toLowerCase()].toString(),
              "previous": category["previous"].toString(),
            })
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double total = PlatformAnalysisDetails.defaultView.fold(
        0.0,
        (sum, category) =>
            sum +
            double.parse(
                category[selectedValue!.toLowerCase()].replaceAll(',', '')));

    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBar(
                  name: "Platform Analysis", imagepath: IconAssets.analysis),
              height5,
              const CustomCalendar(),
              height20,
              CatalogListView(
                names: const [
                  "Default View",
                  "Comparsion View",
                  "Performance View"
                ],
                onTapCallback: (int index) {
                  listindex = index;
                  updateTable();
                  setState(() {});
                },
              ),
              height20,
              CustomDropDown(
                containerheight: 30,
                containerwidth: screenWidth * 0.5,
                value: selectedValue,
                dropdownItems: items,
                initialValue: 'Products',
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                    updateTable();
                  });
                },
              ),
              height20,
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: kblack.withOpacity(0.2)),
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
                        buildRow([
                          "Platform",
                          selectedValue ?? "",
                          if (listindex == 1) "Previous",
                        ], fontWeight: FontWeight.w600),
                      ],
                    ),
                    Table(
                      border: const TableBorder(
                        verticalInside:
                            BorderSide(width: 1, color: Color(0xffE5E5E5)),
                      ),
                      children: filteredData
                          .map((category) => buildRow([
                                category["platform"]!,
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
                    style: TextStyle(fontWeight: fontWeight, fontSize: 12),
                  ),
                ),
              ),
            )
            .toList(),
      );
}
