import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/features/menu/catalog/widget/cancel_save_button.dart';
import 'package:ads/src/features/menu/catalog/widget/custom_radiolisttile.dart';
import 'package:ads/src/features/menu/catalog/widget/catalog_container.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

class DefaultVariant extends StatefulWidget {
  const DefaultVariant({super.key});

  @override
  State<DefaultVariant> createState() => _DefaultVariantState();
}

class _DefaultVariantState extends State<DefaultVariant> {
  TileName _status = TileName.tagallphotos;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CatalogContainer(
          name: "Default Description",
          image: IconAssets.defaultdesc,
        ),
        height30,
         CustomTextField(
            hinttext:
                "Vorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."),
        height30,
        CatalogCommonButton(
          name: "Cancel",
          subname: "Save",
          ontapcancel: () {},
          ontapsave: () {},
        ),
        height40,
        const CatalogContainer(
          image: IconAssets.variant,
          name: "Variant Inclusion",
        ),
        height20,
        SizedBox(
          width: screenWidth * 0.8,
          child: Column(
            children: [
              RadioListTileButton(
                title: 'Do not send variants',
                groupValue: _status,
                value: TileName.donotsendvariants,
                onChanged: (TileName? value) {
                  setState(() {
                    _status = value!;
                  });
                },
              ),
              RadioListTileButton(
                title: 'Send Variants as variants',
                groupValue: _status,
                value: TileName.variantasvariant,
                onChanged: (TileName? value) {
                  setState(() {
                    _status = value!;
                  });
                },
              ),
              RadioListTileButton(
                title: 'Send variants as individual products',
                groupValue: _status,
                value: TileName.variantasindividual,
                onChanged: (TileName? value) {
                  setState(() {
                    _status = value!;
                  });
                },
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
        height30,
      ],
    );
  }
}
