import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomTextField extends StatelessWidget {
  final String hinttext;
  CustomTextField({Key? key, required this.hinttext}) : super(key: key);

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: Get.width * 0.8,
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: kblack.withOpacity(0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: isSelected
                  ? const Color(0xffFF4848)
                  : kblack.withOpacity(0.2),
            ),
          ),
          contentPadding: const EdgeInsets.all(15),
          hintText: hinttext,
          hintStyle: TextStyle(
            fontSize: 12,
            color: kblack.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
