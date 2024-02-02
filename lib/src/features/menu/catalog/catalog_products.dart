import 'package:ads/src/class/catalog_products_detail.dart';
import 'package:ads/src/common/views/catalog_list_view.dart';
import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/homepage/homepage.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MenuCatalogProducts extends StatefulWidget {
  const MenuCatalogProducts({super.key});

  static const routerPath = '/MenuCatalogProducts';

  @override
  State<MenuCatalogProducts> createState() => _MenuCatalogProductsState();
}

class _MenuCatalogProductsState extends State<MenuCatalogProducts> {
  int listindex = 0;
  List<bool> selectedStates =
      List.generate(CatalogProductDetails.defaultitem.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBar(
                name: "Catalog Products",
                imagepath: IconAssets.catalogproductsbar,
              ),
              height20,
              CatalogListView(
                names: const [
                  "Default View",
                  "Website View",
                  "Performance View"
                ],
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
                          width: screenWidth,
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
                                          CatalogProductDetails
                                              .defaultitem[index]["imageurl"],
                                          height: screenHeight * 0.1,
                                        ),
                                      ),
                                      Container(
                                        height: 0.7,
                                        width: screenWidth * 0.25 - 10,
                                        color: kblack.withOpacity(0.2),
                                      ),
                                      height10,
                                      Text(
                                        "Date Added :",
                                        style: TextStyle(
                                          fontFamily: FontAssets.Poppins,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: kblack.withOpacity(0.7),
                                        ),
                                      ),
                                      Text(
                                        CatalogProductDetails.defaultitem[index]
                                            ["date"],
                                        style: const TextStyle(
                                            fontFamily: FontAssets.Poppins,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                      height20,
                                      Container(
                                        height: screenHeight * 0.03,
                                        width: screenWidth * 0.1 + 10,
                                        decoration: BoxDecoration(
                                          color: kblue77D.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(16),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          CatalogProductDetails
                                              .defaultitem[index]["title"],
                                          style: const TextStyle(
                                              fontFamily: FontAssets.Poppins,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                        height10,
                                        Container(
                                          height: 0.5,
                                          width: screenWidth * 0.9,
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
                                                  fontFamily:
                                                      FontAssets.Poppins,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: kdarkgrey),
                                            ),
                                            Text(
                                              CatalogProductDetails
                                                  .defaultitem[index]["price"],
                                              style: const TextStyle(
                                                  fontFamily:
                                                      FontAssets.Poppins,
                                                  fontSize: 17,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontWeight: FontWeight.w600,
                                                  color: kdarkgrey),
                                            ),
                                            kwidth10,
                                            Text(
                                              CatalogProductDetails
                                                  .defaultitem[index]["off"],
                                              style: const TextStyle(
                                                  fontFamily:
                                                      FontAssets.Poppins,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  color: kdarkgrey),
                                            ),
                                          ],
                                        ),
                                        height10,
                                        Container(
                                            width: screenWidth * 0.3,
                                            height: 0.5,
                                            color: klightgrey),
                                        height10,
                                        Text(
                                          CatalogProductDetails
                                                  .defaultitem[index]
                                              ["actualprice"],
                                          style: const TextStyle(
                                              fontFamily: FontAssets.Poppins,
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
                                    IconAssets.editicon,
                                    "Edit",
                                  ),
                                  _buildActionButton(
                                    rightborder: false,
                                    () {},
                                    IconAssets.deleteicon,
                                    "Remove",
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: 30,
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.09,
                            decoration: BoxDecoration(
                              color: isSelected ? kblue77D : klightgrey,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: isSelected
                                ? const Icon(Icons.check,
                                    color: kwhite, size: 20)
                                : const SizedBox(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              height30,
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildActionButton(VoidCallback onTap, String iconPath, String label,
      {bool rightborder = true}) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: screenHeight * 0.06,
          decoration: BoxDecoration(
            border: Border(
                top: const BorderSide(color: klightgrey),
                right: rightborder
                    ? const BorderSide(color: klightgrey)
                    : BorderSide.none),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath),
              kwidth20,
              Text(
                label,
                style: const TextStyle(
                    fontFamily: FontAssets.Poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
