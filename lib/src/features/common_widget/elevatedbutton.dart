import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final String name;
  final double buttonwidth;
  final double buttonheight;
  final IconData? iconname;
  final TextStyle textStyle;
  final VoidCallback ontap;
  final Color alternatecolor;
  final Color bordercolor;

  const CommonElevatedButton(
      {super.key,
      required this.name,
      required this.buttonwidth,
      this.iconname,
      required this.buttonheight,
      required this.textStyle,
      required this.ontap,
      this.alternatecolor = const Color(0xffFF4848),
      this.bordercolor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          elevation: 0,
          fixedSize:
              Size(screenHeight * buttonwidth, screenHeight * buttonheight),
          backgroundColor: alternatecolor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: bordercolor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconname != null) ...[Icon(iconname), kwidth20],
            Text(name,
                style: textStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
