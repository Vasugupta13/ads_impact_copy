import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/common_widget/catalog_list_view.dart';
import 'package:ads/src/features/common_widget/custom_app_bar.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 42),
        child: Column(
          children: [
            const CustomAppBar(
                name: "Catalog Products",
                imagepath: "assets/images/catalog_products.svg"),
            height20,
            Divider(
              color: kblack.withOpacity(0.1),
              endIndent: 0,
              indent: 26,
            ),
            height15,
            CatalogListView(
              containerwidth: 0.85,
              names: const ["Default View", "Website View", "Performance View"],
              onTapCallback: (index) {
                setState(() {
                  listindex = index;
                });
              },
            ),
            height20,
            Container(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                physics: const BouncingScrollPhysics(),
                itemCount: CatalogProductDetails.defaultitem.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: kblack.withOpacity(0.4),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image.asset(
                                        CatalogProductDetails.defaultitem[index]
                                            ["imageurl"],
                                      ),
                                    ),
                                    height10,
                                    Divider(
                                      color: kblack.withOpacity(0.4),
                                    ),
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
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    height20,
                                    Container(
                                      height: Get.height * 0.04,
                                      width: Get.width * 0.2,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff1A377D)
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "In Stock",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff1A377D),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "MRP - ",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff878787),
                                            ),
                                          ),
                                          Text(
                                            CatalogProductDetails
                                                .defaultitem[index]["price"],
                                            style: const TextStyle(
                                              fontSize: 17,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff878787),
                                            ),
                                          ),
                                          kwidth10,
                                          Text(
                                            CatalogProductDetails
                                                .defaultitem[index]["off"],
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff878787),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Text(
                                        CatalogProductDetails.defaultitem[index]
                                            ["actualprice"],
                                        style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffFF4848),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/trash.svg",
                                      color: kblack,
                                      height: 18,
                                    ),
                                    kwidth10,
                                    const Text(
                                      "Edit",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                                const VerticalDivider(),
                                Row(
                                  children: [
                                    SvgPicture.asset("assets/images/trash.svg"),
                                    kwidth10,
                                    const Text(
                                      "Remove",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          left: 30,
                          child: Container(
                            height: Get.height * 0.04,
                            width: Get.width * 0.1,
                            decoration: BoxDecoration(
                                color: const Color(0xff1A377D),
                                borderRadius: BorderRadius.circular(24)),
                            child: const Icon(
                              Icons.check,
                              color: kwhite,
                              size: 20,
                            ),
                          ))
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
