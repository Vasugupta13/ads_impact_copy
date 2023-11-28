import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final String name;
  final double buttonwidth;
  final double buttonheight;
  final IconData? iconname;
  final TextStyle textStyle;
  const CommonElevatedButton(
      {super.key,
      required this.name,
      required this.buttonwidth,
      this.iconname,
      required this.buttonheight,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          elevation: 0,
          fixedSize:
              Size(screenHeight * buttonwidth, screenHeight * buttonheight),
          backgroundColor: const Color(0xffFF4848),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(name, style: textStyle),
      ),
    );
  }
}
