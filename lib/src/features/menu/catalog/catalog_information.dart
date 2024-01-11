import 'dart:ui';

import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/common_widget/custom_app_bar.dart';
import 'package:ads/src/features/menu/catalog/widget/button.dart';
import 'package:ads/src/features/menu/catalog/widget/container_widget.dart';
import 'package:ads/src/homepage/social_account_list_widget.dart';
import 'package:ads/src/utils/const.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum StockStatus {
  tagallphotos,
  tagasstock,
  tagasoutofstock,
  foremipsum,
  horemipsum,
  boremipsum,
  prfixbrandname,
  suffixbrandname,
  notransformation,
  donotsendvariants,
  variantasvariant,
  variantasindividual
}

class MenuCatalogInformation extends StatefulWidget {
  const MenuCatalogInformation({super.key});

  @override
  State<MenuCatalogInformation> createState() => _MenuCatalogInformationState();
}

class _MenuCatalogInformationState extends State<MenuCatalogInformation> {
  StockStatus? _status = StockStatus.tagallphotos;
  int currentindex = 1;
  String selectedOption = '';
  int listindex = 0;
  bool _gender = false;
  bool _desc = false;
  final List<String> countrylist = ["India", "Pakistan", "Afghanistan"];
  String? selectedvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(elevation: 0, toolbarHeight: 0),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
        child: Column(
          children: [
            const CustomAppBar(
                name: "Catalog Configuration",
                imagepath: "assets/images/catalog_info.svg"),
            height20,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            height5,
            const Text(
              "Choose Platform:",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            height15,
            SocialAccountList(
              onTapCallback: (index) {
                setState(
                  () {},
                );
              },
            ),
            height30,
            const CatalogContainer(
                image: "assets/images/stock_status.svg", name: "Stock Status"),
            height20,
            RadioListTile<StockStatus>(
              activeColor: const Color(0xff1A377D),
              title: const Text(
                "Tag all Photos in catalog as In Stock",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              value: StockStatus.tagallphotos,
              groupValue: _status,
              onChanged: (StockStatus? value) {
                setState(() {
                  _status = value;
                });
              },
            ),
            RadioListTile<StockStatus>(
              activeColor: const Color(0xff1A377D),
              title: const Text(
                "Tag as In Stock, if lorem epsum in",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              value: StockStatus.tagasstock,
              groupValue: _status,
              onChanged: (StockStatus? value) {
                setState(() {
                  _status = value;
                });
              },
            ),
            RadioListTile<StockStatus>(
              activeColor: const Color(0xff1A377D),
              title: const Text(
                "Forem ipsum dolor sit",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              value: StockStatus.foremipsum,
              groupValue: _status,
              onChanged: (StockStatus? value) {
                setState(() {
                  _status = value;
                });
              },
            ),
            RadioListTile<StockStatus>(
              activeColor: const Color(0xff1A377D),
              title: const Text(
                "Tag as Out of Stock Porem ipsum dolor sit amet",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              value: StockStatus.tagasoutofstock,
              groupValue: _status,
              onChanged: (StockStatus? value) {
                setState(() {
                  _status = value;
                });
              },
            ),
            RadioListTile<StockStatus>(
              activeColor: const Color(0xff1A377D),
              title: const Text(
                "Horem ipsum dolor sit amet consectetur",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              value: StockStatus.horemipsum,
              groupValue: _status,
              onChanged: (StockStatus? value) {
                setState(() {
                  _status = value;
                });
              },
            ),
            RadioListTile<StockStatus>(
              activeColor: const Color(0xff1A377D),
              title: const Text(
                "Borem ipsum dolor sit amet consectetur",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              value: StockStatus.boremipsum,
              groupValue: _status,
              onChanged: (StockStatus? value) {
                setState(() {
                  _status = value;
                });
              },
            ),
            CatalogCommonButton(
              ontapcancel: () {},
              ontapsave: () {},
              name: 'Cancel',
              subname: "Save",
            ),
            height10,
            const CatalogContainer(
              image: "assets/images/majesticons_image.svg",
              name: "Image Specifications",
            ),
            height20,
            const Text(
              "No - Fit",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            height20,
            GestureDetector(
              onTap: () {
                setState(() {
                  currentindex = 0;
                });
              },
              child: DottedBorder(
                dashPattern: const [4],
                borderType: BorderType.RRect,
                radius: const Radius.circular(16),
                borderPadding: const EdgeInsets.all(16),
                color: currentindex == 0
                    ? const Color(0xff1A377D)
                    : kblack.withOpacity(0.2),
                child: Container(
                  margin: const EdgeInsets.all(16),
                  height: Get.height * 0.5,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset("assets/images/bloom1.png"),
                            Image.asset("assets/images/bloom2.png"),
                          ],
                        ),
                      ),
                      height20,
                      Divider(
                        color: currentindex == 0
                            ? const Color(0xff1A377D)
                            : kblack.withOpacity(0.2),
                        height: 30,
                      ),
                      const Text(
                        "Default",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            height20,
            const Text(
              "Fit to AD",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            height20,
            GestureDetector(
              onTap: () {
                setState(() {
                  currentindex = 1;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                height: Get.height * 0.5,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: currentindex == 1
                          ? const Color(0xff1A377D)
                          : kblack.withOpacity(0.2)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/images/bloom1.png"),
                          Image.asset("assets/images/bloom2.png"),
                        ],
                      ),
                    ),
                    height20,
                    Divider(
                      color: currentindex == 1
                          ? const Color(0xff1A377D)
                          : kblack.withOpacity(0.4),
                      thickness: 1,
                      height: 30,
                    ),
                    const Text(
                      "Fit to AD",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            height10,
            CatalogCommonButton(
              name: "Cancel",
              subname: "Save",
              ontapcancel: () {},
              ontapsave: () {},
            ),
            height20,
            const CatalogContainer(
              name: "Image Padding (No-Fit)",
              image: "assets/images/material_padding.svg",
            ),
            height15,
            Container(
              margin: const EdgeInsets.all(16),
              height: Get.height * 0.5,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kblack.withOpacity(0.2)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Padding",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: Get.height * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: kblack.withOpacity(0.2),
                          ),
                        ),
                        child: Image.asset("assets/images/bloom2.png"),
                      ),
                      Image.asset("assets/images/bloom1.png"),
                    ],
                  ),
                  height20,
                  Divider(
                    color: kblack.withOpacity(0.2),
                    thickness: 1,
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "White Pad",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Auto Pad",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            CatalogCommonButton(
              name: "Cancel",
              subname: "Save",
              ontapcancel: () {},
              ontapsave: () {},
            ),
            height20,
            const CatalogContainer(
                image: "assets/images/color-swatch.svg",
                name: "Product Details"),
            height30,
            const Text(
              "Product Title",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<StockStatus>(
                    contentPadding: EdgeInsets.zero,
                    activeColor: const Color(0xff1A377D),
                    title: const Text(
                      "Prefix Brand Name",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                    value: StockStatus.prfixbrandname,
                    groupValue: _status,
                    onChanged: (StockStatus? value) {
                      setState(() {
                        _status = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<StockStatus>(
                    contentPadding: EdgeInsets.zero,
                    activeColor: const Color(0xff1A377D),
                    title: const Text(
                      "Suffix Brand Name",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                    value: StockStatus.suffixbrandname,
                    groupValue: _status,
                    onChanged: (StockStatus? value) {
                      setState(() {
                        _status = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<StockStatus>(
                    contentPadding: EdgeInsets.zero,
                    activeColor: const Color(0xff1A377D),
                    title: const Text(
                      "No Transformation",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                    value: StockStatus.notransformation,
                    groupValue: _status,
                    onChanged: (StockStatus? value) {
                      setState(() {
                        _status = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            height10,
            SizedBox(
              width: Get.width * 0.65,
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kblack.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: kblack.withOpacity(0.2),
                    ),
                  ),
                  hintText: "Enter Prefix",
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: kblack.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            height20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Display Gender",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      CupertinoSwitch(
                        activeColor: const Color(0xff67DA87),
                        value: _gender,
                        onChanged: (bool value) {
                          setState(
                            () {
                              _gender = value;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Display Description",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      CupertinoSwitch(
                        activeColor: const Color(0xff67DA87),
                        value: _desc,
                        onChanged: (bool value) {
                          setState(
                            () {
                              _desc = value;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            height20,
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: const Row(
                  children: [
                    Text(
                      'Country',
                      style: TextStyle(fontSize: 14, color: kblack),
                    ),
                    Expanded(
                      child: VerticalDivider(
                          endIndent: 8, indent: 8, thickness: 1.5),
                    ),
                  ],
                ),
                items: countrylist
                    .map((String countrylist) => DropdownMenuItem<String>(
                          value: countrylist,
                          child: Text(
                            countrylist,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedvalue,
                onChanged: (String? value) {
                  setState(() {
                    selectedvalue = value;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: kblack.withOpacity(0.2), width: 1.5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  height: 40,
                  width: Get.width * 0.4,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: kblack,
                    size: 30,
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            ),
            height30,
            const Text(
              "Manufacturer Info",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Container(
              height: Get.height * 0.3,
              width: Get.width * 0.7,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kblack.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  height10,
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage("assets/images/zk.png"),
                  ),
                  Divider(thickness: 1, indent: 12, endIndent: 12),
                  height5,
                  Text(
                    "ZK Enterprises",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  height20,
                  CompanyDetails(
                      detailname: "Phone: ", details: "+1 (555) 234-5678"),
                  height5,
                  CompanyDetails(
                      detailname: "GST: ", details: "45DEFG6789H1I2J3"),
                  height5,
                  CompanyDetails(
                    detailname: "Email: ",
                    details: "ethan.brown@example.com",
                  ),
                ],
              ),
            ),
            height20,
            CatalogCommonButton(
              name: "Cancel",
              subname: "Save",
              ontapcancel: () {},
              ontapsave: () {},
            ),
            height20,
            const CatalogContainer(
              name: "Default Description",
              image: "assets/images/stickynote.svg",
            ),
            height20,
            SizedBox(
              width: Get.width * 0.8,
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kblack.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: kblack.withOpacity(0.2),
                    ),
                  ),
                  hintText:
                      "Vorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                  hintMaxLines: 5,
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff878787),
                  ),
                ),
              ),
            ),
            height20,
            CatalogCommonButton(
              name: "Cancel",
              subname: "Save",
              ontapcancel: () {},
              ontapsave: () {},
            ),
            height20,
            const CatalogContainer(
              image: "assets/images/document.svg",
              name: "Variant Inclusion",
            ),
            height20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  RadioListTile<StockStatus>(
                    activeColor: const Color(0xff1A377D),
                    title: const Text(
                      "Do not send variants",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    value: StockStatus.donotsendvariants,
                    groupValue: _status,
                    onChanged: (StockStatus? value) {
                      setState(() {
                        _status = value;
                      });
                    },
                  ),
                  RadioListTile<StockStatus>(
                    activeColor: const Color(0xff1A377D),
                    title: const Text(
                      "Send Variants as variants",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    value: StockStatus.variantasvariant,
                    groupValue: _status,
                    onChanged: (StockStatus? value) {
                      setState(() {
                        _status = value;
                      });
                    },
                  ),
                  RadioListTile<StockStatus>(
                    activeColor: const Color(0xff1A377D),
                    title: const Text(
                      "Send variants as individual products",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    value: StockStatus.variantasindividual,
                    groupValue: _status,
                    onChanged: (StockStatus? value) {
                      setState(() {
                        _status = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            height20,
            CatalogCommonButton(
              name: "Cancel",
              subname: "Save",
              ontapcancel: () {},
              ontapsave: () {},
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class CompanyDetails extends StatelessWidget {
  final String detailname;
  final String details;
  const CompanyDetails({
    super.key,
    required this.detailname,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            detailname,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
          kwidth10,
          Text(
            details,
            style: TextStyle(
              fontSize: 10,
              color: kblack.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
