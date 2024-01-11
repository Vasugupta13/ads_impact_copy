import 'package:ads/src/features/menu/campaign/campaign_analysis.dart';
import 'package:ads/src/utils/const.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomDropDown extends StatelessWidget {
  final double containerwidth;
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  

  const CustomDropDown(
      {super.key,
      required this.hint,
      this.value,
      required this.dropdownItems,
      this.onChanged,
      required this.containerwidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: Get.width * containerwidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: kblack.withOpacity(0.2),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down),
          ),
          style: const TextStyle(
            fontSize: 10,
            color: kblack,
          ),
          isExpanded: true,
          hint: Center(
            child: Text(
              hint,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 10,
                color: kblack,
              ),
            ),
          ),
          items: dropdownItems
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Center(
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ))
              .toList(),
          value: value,
          onChanged: onChanged,
          buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 80,
              elevation: 0),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
}
