import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/features/menu/automations/view/ad_optimization_menu.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonWidget extends StatefulWidget {
  final String title;
  final String image;
  final List<String> items;
  final List<bool> switchValues;
  final void Function(bool)? onSwitchChanged;
  final VoidCallback onCancelPressed;
  final VoidCallback onSavePressed;

  const CommonWidget({
    super.key,
    required this.title,
    required this.items,
    required this.switchValues,
    required this.onCancelPressed,
    required this.onSavePressed,
    this.onSwitchChanged,
    required this.image,
  });

  @override
  State<CommonWidget> createState() => _CommonWidgetState();
}

class _CommonWidgetState extends State<CommonWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CommonElevatedButton(
          name: widget.title,
          buttonwidth: 0.75,
          buttonheight: 55,
          textStyle: elevatedtextstyle,
          ontap: () {},
          alternatecolor: kblue77D,
          preifxicon: widget.image,
        ),
        height10,
        SizedBox(
          width: screenWidth * 0.8,
          child: Column(
            children: List.generate(widget.items.length, (index) {
              return StatusContainer(
                itemname: widget.items[index],
                switchvalue: widget.switchValues[index],
                onSwitchChnaged: widget.onSwitchChanged,
              );
            }),
          ),
        ),
        height20,
        CommonButton(
          onCancelPressed: widget.onCancelPressed,
          onSavePressed: widget.onSavePressed,
        ),
      ],
    );
  }
}

class StatusContainer extends StatelessWidget {
  final String itemname;
  final bool? switchvalue;
  final ValueChanged<bool>? onSwitchChnaged;

  const StatusContainer({
    super.key,
    required this.itemname,
    this.switchvalue,
    this.onSwitchChnaged,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.75,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: kblack.withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          Text(
            itemname,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          height10,
          Divider(
            indent: 8,
            endIndent: 8,
            color: kblack.withOpacity(0.1),
          ),
          height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Status",
                style: TextStyle(fontSize: 12),
              ),
              kwidth30,
              // CustomTextField(
              //     hinttext: 'Ex: 550',
              //     containerWidth: screenWidth * 0.25,
              //     hintverticalPadding: 4,
              //     hinTxtstyle: const TextStyle(fontSize: 8, color: kblack),
              //     containerHeight: 25),
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  trackColor: kblack.withOpacity(0.6),
                  activeColor: const Color(0xff67DA87),
                  value: switchvalue!,
                  onChanged: onSwitchChnaged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
