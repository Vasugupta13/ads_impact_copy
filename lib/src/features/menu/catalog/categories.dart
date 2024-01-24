import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/common_widget/catalog_list_view.dart';
import 'package:ads/src/features/common_widget/custom_elevatedbutton.dart';
import 'package:ads/src/features/common_widget/customdropdown.dart';
import 'package:ads/src/homepage/customapp_bar.dart';
import 'package:ads/src/homepage/homepage.dart';
import 'package:ads/src/res/catalog_categories_products.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MenuCatalogCategories extends StatefulWidget {
  const MenuCatalogCategories({super.key});

  @override
  State<MenuCatalogCategories> createState() => _MenuCatalogCategoriesState();
}

class _MenuCatalogCategoriesState extends State<MenuCatalogCategories> {
  List<String> items = [
    'New Products',
    'Products',
    'Out of Stock',
    'Discounted',
    'Invalid',
    'Exclude',
    'ROAS'
  ];
  String? selectedValue = "Products";
  final NumberFormat formatter = NumberFormat("#,##0.00", "en_US");
  List<Map<String, String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    updateTable();
  }

  void updateTable() {
    filteredData = CatalogProductDetail.categorydetails
        .map((category) => {
              "categoryname": category["categoryname"].toString(),
              "value": category[selectedValue!.toLowerCase()].toString(),
            })
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double total = CatalogProductDetail.categorydetails.fold(
        0.0,
        (sum, category) =>
            sum +
            double.parse(
                category[selectedValue!.toLowerCase()].replaceAll(',', '')));

    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomAppBar(
              onTapBack: () => Get.to(() => const HomePage()),
              name: "Catalog",
              imagepath: "assets/images/catalog_categories_icon.svg",
            ),
            height5,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 40,
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: kblue77D.withOpacity(0.1),
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
              names: const ["Default View", "Website View", "Performance View"],
              onTapCallback: (int index) {},
            ),
            height20,
            CustomDropDown(
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                  updateTable();
                });
              },
              hint: "Products",
              dropdownItems: items,
              containerwidth: 0.5,
              containerheight: 0.05,
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
                    border: TableBorder(
                      verticalInside:
                          BorderSide(color: kblack.withOpacity(0.1)),
                      bottom: BorderSide(color: kblack.withOpacity(0.1)),
                    ),
                    children: [
                      buildRow(["Product Categories", selectedValue ?? ""]),
                    ],
                  ),
                  Table(
                    border: TableBorder(
                      verticalInside:
                          BorderSide(width: 1, color: kblack.withOpacity(0.1)),
                    ),
                    children: filteredData
                        .map((category) => buildRow(
                            [category["categoryname"]!, category["value"]!]))
                        .toList(),
                  ),
                ],
              ),
            ),
            height15,
            divider161,
            height15,
            CommonElevatedButton(
              ontap: () {},
              name: "Total Summary:   ${formatter.format(total)}",
              buttonwidth: 0.6,
              textStyle: const TextStyle(fontSize: 12, color: kwhite),
            ),
            height30,
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
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
}
