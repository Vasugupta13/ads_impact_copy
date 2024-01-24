import 'dart:ui';

import 'package:ads/src/utils/const.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDown extends StatefulWidget {
  final double containerheight;
  final double containerwidth;
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final Color? alternatecolor;

  const CustomDropDown(
      {super.key,
      required this.hint,
      this.value,
      required this.dropdownItems,
      this.onChanged,
      required this.containerwidth,
      required this.containerheight,
      this.alternatecolor});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool isDropDownOpen = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isDropDownOpen)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
                color: kwhite.withOpacity(0.2),
                height: Get.height,
                width: Get.width),
          ),
        Container(
          height: Get.height * widget.containerheight,
          width: Get.width * widget.containerwidth,
          decoration: BoxDecoration(
            color: widget.alternatecolor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: kblack.withOpacity(0.2),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down),
              ),
              style: const TextStyle(fontSize: 10, color: kblack),
              isExpanded: true,
              hint: Center(
                child: Text(
                  widget.hint,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 10, color: kblack),
                ),
              ),
              items: widget.dropdownItems
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Center(
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.value == item ? kred : kblack,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
              value: widget.value,
              onChanged: widget.onChanged,
              buttonStyleData: ButtonStyleData(
                  width: Get.width * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  elevation: 0),
              menuItemStyleData: const MenuItemStyleData(),
            ),
          ),
        ),
      ],
    );
  }
}
