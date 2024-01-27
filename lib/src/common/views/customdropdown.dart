import 'dart:ui';

import 'package:ads/src/res/assets.dart';
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
  final bool? isBorderColor;
  final bool? hintstyle;

  const CustomDropDown({
    super.key,
    required this.hint,
    this.value,
    required this.dropdownItems,
    this.onChanged,
    required this.containerwidth,
    required this.containerheight,
    this.alternatecolor,
    this.isBorderColor = true,
    this.hintstyle = true,
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
            border: Border.all(
              color: widget.isBorderColor!
                  ? kblack.withOpacity(0.2)
                  : Colors.transparent,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              iconStyleData:
                  const IconStyleData(icon: Icon(Icons.keyboard_arrow_down)),
              style: const TextStyle(
                  fontFamily: FontAssets.Poppins,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: kblack),
              isExpanded: true,
              hint: Center(
                child: Text(
                  widget.hint,
                  maxLines: 1,
                  style: widget.hintstyle!
                      ? const TextStyle(fontSize: 10, color: kblack)
                      : TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: FontAssets.Poppins,
                          fontSize: 12,
                          color: kblack.withOpacity(0.2),
                        ),
                ),
              ),
              items: widget.dropdownItems
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Center(
                          child: Text(
                            item,
                            style: widget.hintstyle!
                                ? TextStyle(
                                    fontFamily: FontAssets.Poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: widget.value == item ? kred : kblack,
                                  )
                                : TextStyle(
                                    fontFamily: FontAssets.Poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color:
                                        widget.value == item ? kred : kblack),
                          ),
                        ),
                      ))
                  .toList(),
              value: widget.value,
              onChanged: widget.onChanged,
              buttonStyleData: ButtonStyleData(
                  width: screenWidth * 0.1,
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
