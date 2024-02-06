import 'package:ads/src/features/menu/catalog/widget/cancel_save_button.dart';
import 'package:ads/src/features/menu/catalog/widget/custom_radiolisttile.dart';
import 'package:ads/src/features/menu/catalog/widget/catalog_container.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ImageSpecifications extends StatefulWidget {
  const ImageSpecifications({super.key});

  @override
  State<ImageSpecifications> createState() => _ImageSpecificationsState();
}

class _ImageSpecificationsState extends State<ImageSpecifications> {
  final TileName _status = TileName.tagallphotos;

  int currentindex = 1;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CatalogContainer(
          image: IconAssets.image,
          name: "Image Specifications",
        ),
        height25,
        const Text(
          "No - Fit",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              ),
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
            radius: const Radius.circular(12),
            borderPadding: const EdgeInsets.all(16),
            color: currentindex == 0 ? kblue77D : kblack.withOpacity(0.2),
            child: Container(
              margin: const EdgeInsets.all(16),
              height: screenHeight * 0.5,
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          ImageAssets.notfit1,
                          height: screenHeight * 0.35,
                          width: screenWidth * 0.35,
                        ),
                        Image.asset(
                          ImageAssets.notfit2,
                          height: screenHeight * 0.25,
                          width: screenWidth * 0.25,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color:
                        currentindex == 0 ? kblue77D : kblack.withOpacity(0.2),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Default",
                      style: TextStyle(

                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        height25,
        const Text(
          "Fit to AD",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              ),
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
            height: screenHeight * 0.5,
            width: screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color:
                      currentindex == 1 ? kblue77D : kblack.withOpacity(0.2)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Image.asset(ImageAssets.notfit1,
                            height: screenHeight * 0.35,
                            width: screenWidth * 0.35),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          height: screenHeight * 0.25,
                          width: screenWidth * 0.1,
                          color: klightgrey,
                          child: Image.asset(
                            ImageAssets.notfit2,
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: currentindex == 1
                      ? const Color(0xff1A377D)
                      : kblack.withOpacity(0.2),
                ),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Fit to AD",
                    style: TextStyle(

                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
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
