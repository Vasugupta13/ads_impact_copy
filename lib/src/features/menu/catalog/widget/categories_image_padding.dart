import 'package:ads/src/features/menu/catalog/widget/cancel_save_button.dart';
import 'package:ads/src/features/menu/catalog/widget/catalog_container.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

class ImagePadding extends StatefulWidget {
  const ImagePadding({super.key});

  @override
  State<ImagePadding> createState() => _ImagePaddingState();
}

class _ImagePaddingState extends State<ImagePadding> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CatalogContainer(
          name: "Image Padding (No-Fit)",
          image: IconAssets.imagepadding,
        ),
        height30,
        Container(
          margin: const EdgeInsets.all(12),
          height: screenHeight * 0.55,
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: kblack.withOpacity(0.2),
            ),
          ),
          child: Column(
            children: [
              height15,
              const Text(
                "Padding",
                style: TextStyle(

                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              height10,
              const Divider(color: klightgrey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: kblack.withOpacity(0.2),
                      ),
                    ),
                    child: Image.asset(ImageAssets.notfit2),
                  ),
                  Image.asset(ImageAssets.notfit1,
                      height: screenHeight * 0.35, width: screenWidth * 0.35),
                ],
              ),
              height20,
              const Divider(color: klightgrey),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                ),
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
