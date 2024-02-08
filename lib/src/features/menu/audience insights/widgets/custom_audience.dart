import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/common/views/customdropdown.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/features/menu/audience%20insights/widgets/custom_audience_popup.dart';
import 'package:ads/src/features/menu/catalog/widget/catalog_container.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAudience extends StatefulWidget {
  const CustomAudience({
    super.key,
  });

  @override
  State<CustomAudience> createState() => _CustomAudienceState();
}

class _CustomAudienceState extends State<CustomAudience> {
  TextStyle textStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: kblack.withOpacity(0.2),
  );
  final List<String> items = [
    "Facebook",
    "Google",
    "Linkedin",
    "Twitter",
    "YouTube",
  ];
  String? selectedvalue;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      shadowColor: kwhite,
      backgroundColor: kwhite,
      surfaceTintColor: kwhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: screenHeight * 0.78,
          width: screenWidth,
          color: kwhite,
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.03, horizontal: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grid_view_rounded),
                  kwidth20,
                  Text(
                    "Custom Audience",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
              height10,
              Divider(
                color: kblack.withOpacity(0.1),
              ),
              height20,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropDown(
                      // initialValue: "Google",
                      containerheight: 42,
                      dropdownItems: items,
                      hint: "Source",
                      value: selectedvalue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedvalue = value;
                        });
                      },
                    ),
                    height20,
                    CustomTextField(
                        hintverticalPadding: 0,
                        borderRadius: 12,
                        containerHeight: 42,
                        hinTxtstyle: textStyle,
                        hinttext: "Events"),
                    height20,
                    const Text(
                      "Retention",
                      style: TextStyle(
                          fontSize: 12,
                          color: kdarkgrey,
                          fontWeight: FontWeight.w500),
                    ),
                    height5,
                    CustomTextField(
                        hintverticalPadding: 0,
                        borderRadius: 12,
                        containerHeight: 42,
                        hinTxtstyle: textStyle,
                        hinttext: "30 Days"),
                  ],
                ),
              ),
              height20,
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CatalogContainer(
                        containerWidth: 0,
                        onTap: () {},
                        containerHeight: 42,
                        name: 'Include more people',
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: kwhite),
                        image: IconAssets.plusicon),
                  ),
                  kwidth10,
                  Expanded(
                    flex: 3,
                    child: CatalogContainer(
                      containerWidth: 0,
                      name: 'Exclude people',
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: kwhite),
                      containerHeight: 42,
                      image: IconAssets.minusicon,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              height20,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    CustomTextField(
                        hintverticalPadding: 0,
                        borderRadius: 12,
                        containerHeight: 42,
                        hinTxtstyle: textStyle,
                        hinttext: "Audience Name"),
                    height20,
                    CustomTextField(
                        hintverticalPadding: 0,
                        borderRadius: 12,
                        containerHeight: 42,
                        hinTxtstyle: textStyle,
                        hinttext: "Description (optional)"),
                  ],
                ),
              ),
              height25,
              CommonElevatedButton(
                name: "Create Audience",
                buttonwidth: 0.4,
                buttonheight: 0.05,
                textStyle: elevatedtextstyle,
                ontap: () async {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AudiencePopup();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
