
import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/common/views/customdropdown.dart';
import 'package:ads/src/features/menu/catalog/widget/catalog_container.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BudgetOptimization extends StatefulWidget {
  final String image;
  final String name;
  const BudgetOptimization(
      {super.key, required this.name, required this.image});

  @override
  State<BudgetOptimization> createState() => _BudgetOptimizationState();
}

class _BudgetOptimizationState extends State<BudgetOptimization> {
  bool status = true;
  bool item1Checked = false;
  bool item2Checked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height20,
        CatalogContainer(name: widget.name, image: widget.image),
        height20,
         CustomDropDown(
            containerheight: 0.5,
            hint: "Campaign",
            dropdownItems: [],
            containerwidth: 0.40),
        height20,
        Container(
          width: Get.width * 0.80,
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: kblack.withOpacity(0.2),
            ),
          ),
          child: Column(
            children: [
              height10,
              CommonElevatedButton(
                name: "Campaign Type : Prospect",
                buttonwidth: 0.36,
                buttonheight: 0.06,
                textStyle: const TextStyle(color: kwhite, fontSize: 12),
                ontap: () {},
              ),
              height10,
              const Divider(
                indent: 30,
                color: Color(0xffE5E5E5),
              ),
              height5,
              buildCheckboxRow("Increase Case Condition", item1Checked,
                  (value) {
                setState(() {
                  item1Checked = value!;
                });
              }),
              height20,
              buildCheckboxRow("Decrease Case Condition", item2Checked,
                  (value) {
                setState(() {
                  item2Checked = value!;
                });
              }),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Status",
                    style: TextStyle(fontSize: 12),
                  ),
                  kwidth30,
                  Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      trackColor: kblack.withOpacity(0.6),
                      activeColor: const Color(0xff67DA87),
                      value: status,
                      onChanged: (bool value) {
                        setState(() {
                          status = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: CommonElevatedButton(
                  alternatecolor: kwhite,
                  bordercolor: kblack.withOpacity(0.1),
                  name: "Cancel",
                  buttonwidth: 0.5,
                  buttonheight: 0.06,
                  textStyle: const TextStyle(fontSize: 12, color: kblack),
                  ontap: () {},
                ),
              ),
              kwidth20,
              Expanded(
                child: CommonElevatedButton(
                  alternatecolor: const Color(0xff1A377D),
                  name: "Save",
                  buttonwidth: 0.5,
                  buttonheight: 0.06,
                  textStyle: const TextStyle(fontSize: 12, color: kwhite),
                  ontap: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCheckboxRow(
          String label, bool checked, ValueChanged<bool?> onChanged) =>
      Container(
        width: Get.width,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: const Color(0xff1A377D).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Checkbox(
              side: const BorderSide(color: kblack),
              activeColor: Colors.white,
              checkColor: Colors.green,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: kblack.withOpacity(0.1),
                ),
              ),
              value: checked,
              onChanged: onChanged,
            ),
          ],
        ),
      );
}
