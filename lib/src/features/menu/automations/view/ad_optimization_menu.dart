import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/menu/automations/widgets/common_widget.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdOptimization extends StatefulWidget {
  const AdOptimization({super.key});

  @override
  _AdOptimizationState createState() => _AdOptimizationState();
}

class _AdOptimizationState extends State<AdOptimization> {
  final List<String> itemsname = [
    "Stop Loss For Campaign",
    "Stop Loss For Adsets",
    "Stop Loss For Creative",
    "Stop Loss For AD"
  ];
  List<bool> switchstatus = [true, false, true, false];
  bool productswitch = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        height30,
        CommonWidget(
          title: "Stoop Loss Configuration",
          image: IconAssets.stopLossConfig,
          onCancelPressed: () {},
          onSavePressed: () {},
          items: itemsname,
          switchValues: switchstatus,
          onSwitchChanged: (bool value) {
            setState(() {
              print('$switchstatus');
              switchstatus[0] = value;
            });
          },
        ),
        height30,
        CommonWidget(
          title: "Stop Loss For Products",
          image: IconAssets.stopLossProd,
          onCancelPressed: () {},
          onSavePressed: () {},
          items: const ['Stop Loss For Products'],
          switchValues: const [true],
          onSwitchChanged: (bool value) {
            setState(() {
              // switchstatus[index] = value;
            });
          },
        ),
      ],
    );
  }
}

class CommonButton extends StatelessWidget {
  final VoidCallback onCancelPressed;
  final VoidCallback onSavePressed;

  const CommonButton({
    super.key,
    required this.onCancelPressed,
    required this.onSavePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              textStyle: const TextStyle(
                  fontSize: 12, color: kblack, fontWeight: FontWeight.w500),
              ontap: onCancelPressed,
            ),
          ),
          kwidth20,
          Expanded(
            child: CommonElevatedButton(
              alternatecolor: const Color(0xff1A377D),
              name: "Save",
              buttonwidth: 0.5,
              buttonheight: 0.06,
              textStyle: elevatedtextstyle,
              ontap: onSavePressed,
            ),
          ),
        ],
      ),
    );
  }
}
