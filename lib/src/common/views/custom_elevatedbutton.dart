import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CommonElevatedButton extends StatefulWidget {
  final String name;
  final double buttonwidth;
  final double? buttonheight;
  final String? preifxicon;
  final TextStyle textStyle;
  final VoidCallback ontap;
  final Color alternatecolor;
  final Color bordercolor;

  const CommonElevatedButton(
      {super.key,
      required this.name,
      required this.buttonwidth,
      this.preifxicon,
      this.buttonheight,
      required this.textStyle,
      required this.ontap,
      this.alternatecolor = kred,
      this.bordercolor = Colors.transparent});

  @override
  State<CommonElevatedButton> createState() => _CommonElevatedButtonState();
}

class _CommonElevatedButtonState extends State<CommonElevatedButton> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: ElevatedButton(
        onPressed: widget.ontap,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          elevation: 0,
          fixedSize: Size(
              screenWidth * widget.buttonwidth, widget.buttonheight ?? 40.0),
          backgroundColor: widget.alternatecolor ?? kwhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: widget.bordercolor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.preifxicon != null) ...[
              SvgPicture.asset(widget.preifxicon!),
              kwidth20
            ],
            Text(widget.name,
                style: widget.textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
