import 'package:ads/src/features/common_widget/elevatedbutton.dart';
import 'package:ads/src/features/menu/catalog/widget/container_widget.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AdOptimization extends StatefulWidget {
  // final String image;
  // final String name;
  const AdOptimization({
    super.key,
    //  required this.image, required this.name
  });

  @override
  State<AdOptimization> createState() => _AdOptimizationState();
}

class _AdOptimizationState extends State<AdOptimization> {
  final List<String> itemsname = [
    "Stop Loss For Campaign",
    "Stop Loss For Adsets",
    "Stop Loss For Creative",
    "Stop Loss For AD"
  ];
  List<bool> switchstatus = [true, false, true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height30,
        const CatalogContainer(name: "Sachin", image: "assets/images"),
        height10,
        SizedBox(
          width: Get.width * 0.8,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemsname.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
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
                      itemsname[index],
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
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
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            trackColor: kblack.withOpacity(0.6),
                            activeColor: const Color(0xff67DA87),
                            value: switchstatus[index],
                            onChanged: (bool value) {
                              setState(() {
                                switchstatus[index] = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        height20,
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
}
