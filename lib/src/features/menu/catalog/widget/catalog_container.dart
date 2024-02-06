import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CatalogContainer extends StatefulWidget {
  final double? containerHeight;
  final double? containerWidth;
  final Color? containerColor;
  final TextStyle? textStyle;
  final String name;
  final String? image;
  final bool? isBorder;
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;

  const CatalogContainer(
      {super.key,
      required this.name,
      this.image,
      this.containerHeight,
      this.containerWidth,
      this.containerColor,
      this.textStyle,
      this.isBorder = false,
      this.onTap,
      this.borderRadius});

  @override
  State<CatalogContainer> createState() => _CatalogContainerState();
}

class _CatalogContainerState extends State<CatalogContainer> {
  @override
  Widget build(BuildContext context) {
    double screeWidth = MediaQuery.of(context).size.width;
    double screeHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: widget.containerColor == true ? null : widget.onTap,
      child: Container(
        height: widget.containerHeight ?? screeHeight * 0.07,
        width: widget.containerWidth ?? screeWidth * 0.75,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: widget.containerColor ?? kblue77D,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
            border: widget.isBorder == true
                ? Border.all(
                    color: kblack.withOpacity(0.1),
                  )
                : null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.image != null)
              Row(
                children: [SvgPicture.asset(widget.image!), kwidth10],
              ),
            Expanded(
              child: Text(
                widget.name,
                style: widget.textStyle ??
                    const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: kwhite),
              ),
            )
          ],
        ),
      ),
    );
  }
}
