import 'package:ads/src/common/views/customdropdown.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/features/menu/catalog/catalog_information.dart';
import 'package:ads/src/features/menu/catalog/widget/cancel_save_button.dart';
import 'package:ads/src/features/menu/catalog/widget/custom_radiolisttile.dart';
import 'package:ads/src/features/menu/catalog/widget/title_container.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  TileName _status = TileName.tagallphotos;
  bool _gender = false;
  bool _desc = false;
  final List<String> countrylist = ["India", "Pakistan", "Afghanistan"];
  String? selectedvalue;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CatalogContainer(
            image: IconAssets.productdetails, name: "Product Details"),
        height30,
        const Text(
          "Product Title",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        height20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: RadioListTileButton(
                  fontsize: 8,
                  padding: EdgeInsets.zero,
                  title: 'Prefix Brand Name',
                  groupValue: _status,
                  value: TileName.prfixbrandname,
                  onChanged: (TileName? value) {
                    setState(() {
                      _status = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTileButton(
                  fontsize: 8,
                  padding: EdgeInsets.zero,
                  title: 'Suffix Brand Name',
                  groupValue: _status,
                  value: TileName.suffixbrandname,
                  onChanged: (TileName? value) {
                    setState(() {
                      _status = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTileButton(
                  fontsize: 8,
                  padding: EdgeInsets.zero,
                  title: 'No Transformation',
                  groupValue: _status,
                  value: TileName.notransformation,
                  onChanged: (TileName? value) {
                    setState(() {
                      _status = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        height10,
        const CustomTextField(labelText: 'Enter Prefix'),
        height20,
        SizedBox(
          width: screenWidth * 0.8,
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Display Gender",
                      style: TextStyle(
                        fontFamily: FontAssets.Poppins,
                        fontWeight: FontWeight.w500,
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
              height15,
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Display Description",
                      style: TextStyle(
                        fontFamily: FontAssets.Poppins,
                        fontWeight: FontWeight.w500,
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
        CustomDropDown(
          dropdownItems: countrylist,
          initialValue: 'India',
          hint: 'Country',
          containerheight: 35,
          containerwidth: screenWidth * 0.45,
          value: selectedvalue,
          onChanged: (String? value) {
            setState(() {
              selectedvalue = value;
            });
          },
        ),
        height30,
        const Text(
          "Manufacturer Info",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        height30,
        Container(
          height: screenHeight * 0.3,
          width: screenWidth * 0.6,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: klightgrey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              height20,
              CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage(ImageAssets.zkenterprises),
              ),
              height10,
              Divider(thickness: 1),
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
                  detailname: "GST: ", details: "    45DEFG6789H1I2J3"),
              height5,
              CompanyDetails(
                detailname: "Email: ",
                details: " ethan.brown@example.com",
              ),
            ],
          ),
        ),
        height30,
        CatalogCommonButton(
          name: "Cancel",
          subname: "Save",
          ontapcancel: () {},
          ontapsave: () {},
        ),
        height40,
      ],
    );
  }
}
