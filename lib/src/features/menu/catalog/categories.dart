import 'package:ads/src/features/common_widget/catalog_list_view.dart';
import 'package:ads/src/features/common_widget/custom_app_bar.dart';
import 'package:ads/src/res/catalog_products.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MenuCatalogCategories extends StatefulWidget {
  const MenuCatalogCategories({super.key});

  @override
  State<MenuCatalogCategories> createState() => _MenuCatalogCategoriesState();
}

class _MenuCatalogCategoriesState extends State<MenuCatalogCategories> {
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
                name: "Catalog", imagepath: "assets/images/catalog_group.svg"),
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
              onTapCallback: (int index) {},
            ),
            height20,
            Container(
              height: 34,
              width: Get.width * 0.38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: kblack.withOpacity(0.2),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Products",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  kwidth5,
                  VerticalDivider(endIndent: 6, indent: 6, thickness: 1),
                  kwidth5,
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
            height20,
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: kblack.withOpacity(0.2))),
              child: Table(
                border: const TableBorder(
                  verticalInside: BorderSide(),
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('Category Name'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('Products'),
                        ),
                      ),
                    ],
                  ),
                  for (var category in CatalogProductDetail.categorydetails)
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(category["categoryname"].toString()),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(category["products"].toString()),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
