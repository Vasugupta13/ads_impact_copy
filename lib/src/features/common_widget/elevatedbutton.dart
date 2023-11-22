import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final String name;
  final double buttonwidth;
  final IconData? iconname;
  const CommonElevatedButton(
      {super.key,
      required this.name,
      required this.buttonwidth,
      this.iconname});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          elevation: 0,
          fixedSize: Size(screenHeight * buttonwidth, screenHeight * 0.06),
          backgroundColor: const Color(0xffFF4848),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: kwhite,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
