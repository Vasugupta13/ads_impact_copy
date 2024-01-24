import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/common_widget/catalog_list_view.dart';
import 'package:ads/src/homepage/customapp_bar.dart';
import 'package:ads/src/homepage/homepage.dart';
import 'package:ads/src/res/catalog_products_detail.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MenuCatalogProducts extends StatefulWidget {
  const MenuCatalogProducts({super.key});

  @override
  State<MenuCatalogProducts> createState() => _MenuCatalogProductsState();
}

class _MenuCatalogProductsState extends State<MenuCatalogProducts> {
  int listindex = 0;
  List<bool> selectedStates =
      List.generate(CatalogProductDetails.defaultitem.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomAppBar(
              onTapBack: () => Get.to(() => const HomePage()),
              name: "Catalog Products",
              imagepath: "assets/images/catalog_products_icon.svg",
            ),
            height5,
            CatalogListView(
              names: const ["Default View", "Website View", "Performance View"],
              onTapCallback: (index) {
                setState(() {
                  listindex = index;
                });
              },
            ),
            height20,
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: CatalogProductDetails.defaultitem.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                bool isSelected = selectedStates[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedStates[index] = !isSelected;
                      
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: klightgrey),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image.asset(
                                        CatalogProductDetails.defaultitem[index]
                                            ["imageurl"],
                                      ),
                                    ),
                                    Container(
                                      height: 0.7,
                                      width: Get.width * 0.25 - 10,
                                      color: kblack.withOpacity(0.2),
                                    ),
                                    height10,
                                    Text(
                                      "Date Added :",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: kblack.withOpacity(0.7),
                                      ),
                                    ),
                                    Text(
                                      CatalogProductDetails.defaultitem[index]
                                          ["date"],
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    height20,
                                    Container(
                                      height: Get.height * 0.03,
                                      width: Get.width * 0.1 + 10,
                                      decoration: BoxDecoration(
                                        color: kblue77D.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "In Stock",
                                          style: TextStyle(
                                              fontSize: 8, color: kblue77D),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        CatalogProductDetails.defaultitem[index]
                                            ["title"],
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      ),
                                      height10,
                                      Container(
                                        height: 0.5,
                                        width: Get.width * 0.9,
                                        color: kblack.withOpacity(0.2),
                                      ),
                                      height10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "MRP - ",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: kdarkgrey),
                                          ),
                                          Text(
                                            CatalogProductDetails
                                                .defaultitem[index]["price"],
                                            style: const TextStyle(
                                                fontSize: 17,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontWeight: FontWeight.w600,
                                                color: kdarkgrey),
                                          ),
                                          kwidth10,
                                          Text(
                                            CatalogProductDetails
                                                .defaultitem[index]["off"],
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                                color: kdarkgrey),
                                          ),
                                        ],
                                      ),
                                      height10,
                                      Container(
                                          width: Get.width * 0.3,
                                          height: 0.5,
                                          color: klightgrey),
                                      height10,
                                      Text(
                                        CatalogProductDetails.defaultitem[index]
                                            ["actualprice"],
                                        style: const TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w600,
                                            color: kred),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            height10,
                            Row(
                              children: [
                                _buildActionButton(
                                  () {},
                                  "assets/images/products_edit_icon.svg",
                                  "Edit",
                                ),
                                _buildActionButton(
                                  () {},
                                  "assets/images/trash_icon.svg",
                                  "Remove",
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      if (isSelected)
                        Positioned(
                          left: 30,
                          child: Container(
                            height: 27,
                            width: 31,
                            decoration: BoxDecoration(
                              color: kblue77D,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: const Icon(Icons.check,
                                color: kwhite, size: 20),
                          ),
                        ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildActionButton(VoidCallback onTap, String iconPath, String label) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: klightgrey),
              right: BorderSide(color: klightgrey),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath),
              kwidth10,
              Text(
                label,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
