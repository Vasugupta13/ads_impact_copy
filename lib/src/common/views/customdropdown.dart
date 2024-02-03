import 'dart:ui';

import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDown extends StatefulWidget {
  final double? containerheight;
  final double? containerwidth;
  final String? hint;
  final List<String> dropdownItems;
  final String? initialValue;
  final Function(String?)? onChanged;
  final String? value;
  final Color? alternatecolor;
  final bool? isBorderColor;
  final bool? hinticon;

  const CustomDropDown({
    super.key,
    required this.dropdownItems,
    this.initialValue,
    this.onChanged,
    this.containerheight,
    this.containerwidth,
    this.hint,
    this.value,
    this.alternatecolor,
    this.isBorderColor,
    this.hinticon,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool isDropDownOpen = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        if (isDropDownOpen)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
                color: kwhite.withOpacity(0.2),
                height: screenHeight,
                width: screenWidth),
          ),
        Container(
          height: widget.containerheight,
          width: widget.containerwidth,
          decoration: BoxDecoration(
            color: widget.alternatecolor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kblack.withOpacity(0.2)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              menuItemStyleData: const MenuItemStyleData(height: 35),
              onChanged: widget.onChanged,
              iconStyleData:
                  const IconStyleData(icon: Icon(Icons.keyboard_arrow_down)),
              style: const TextStyle(
                  fontFamily: FontAssets.Poppins,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: kblack),
              isExpanded: true,
              value: widget.value,
              hint: Row(
                children: [
                  widget.hinticon == true
                      ? const Icon(Icons.visibility_outlined,
                          size: 20, color: kdarkgrey)
                      : const SizedBox(),
                  kwidth10,
                  Expanded(
                    child: Text(
                      widget.hint ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        color: kdarkgrey,
                      ),
                    ),
                  ),
                ],
              ),
              items: widget.dropdownItems.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Center(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontFamily: FontAssets.Poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: widget.value == item ? kred : kblack,
                      ),
                    ),
                  ),
                );
              }).toList(),
              buttonStyleData: const ButtonStyleData(
                overlayColor: MaterialStatePropertyAll(kwhite),
                padding: EdgeInsets.symmetric(horizontal: 8),
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14), color: kwhite),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
