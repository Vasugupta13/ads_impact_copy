import 'package:ads/src/features/menu/catalog/catalog_information.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TileName {
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

class RadioListTileButton extends StatelessWidget {
  const RadioListTileButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.padding,
    this.fontsize = 12,
  });
  final EdgeInsetsGeometry? padding;
  final double fontsize;
  final String title;
  final TileName value;
  final TileName groupValue;
  final Function(TileName?) onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<TileName>(
      visualDensity: VisualDensity.compact,
      contentPadding: padding,
      activeColor: kblue77D,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: FontAssets.Poppins,
          fontWeight: FontWeight.w400,
          fontSize: fontsize,
        ),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
