import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CatalogContainer extends StatefulWidget {
  final String name;
  final String? image;
  const CatalogContainer({super.key, required this.name, this.image});

  @override
  State<CatalogContainer> createState() => _CatalogContainerState();
}

class _CatalogContainerState extends State<CatalogContainer> {
  @override
  Widget build(BuildContext context) {
    double screeWidth = MediaQuery.of(context).size.width;
    double screeHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screeHeight * 0.07,
      width: screeWidth * 0.75,
      decoration: BoxDecoration(
        color: kblue77D,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.image != null) SvgPicture.asset(widget.image!),
          kwidth15,
          Text(
            widget.name,
            style: const TextStyle(
                fontFamily: FontAssets.Poppins,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: kwhite),
          )
        ],
      ),
    );
  }
}
