import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/menu/catalog/widget/container_widget.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdOptimization extends StatefulWidget {
  const AdOptimization({
    super.key,
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
  bool productswitch = true;

  bool saveButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    return saveButtonTapped ? _buildDynamicAds() : _buildDefaultSection();
  }

  Widget _buildDefaultSection() {
    return Column(
      children: [
        height30,
        const CatalogContainer(
          name: "Stoop Loss Configuration",
          image: "assets/images/stop_loss.svg",
        ),
        height10,
        SizedBox(
          width: Get.width * 0.8,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemsname.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return StatusContainer(
                itemname: itemsname[index],
                switchvalue: switchstatus[index],
                onSwitchChnaged: (bool value) {
                  setState(() {
                    switchstatus[index] = value;
                  });
                },
              );
            },
          ),
        ),
        height20,
        CommonButton(
          onCancelPressed: () {},
          onSavePressed: () {
            setState(() {
              saveButtonTapped = true;
            });
          },
        ),
      ],
    );
  }

  Widget _buildStopLossProduct() {
    return Column(
      children: [
        height20,
        const CatalogContainer(
          name: "Stop Loss for Products",
          image: "assets/images/additem.svg",
        ),
        height10,
        StatusContainer(
          itemname: "Stop Loss For Products",
          switchvalue: productswitch,
          onSwitchChnaged: (bool value) {
            setState(() {
              productswitch = value;
            });
          },
        ),
        height20,
        CommonButton(
          onCancelPressed: () {},
          onSavePressed: () {},
        ),
      ],
    );
  }

  Widget _buildProductExclusion() {
    return Column(
      children: [
        height20,
        const CatalogContainer(
          name: "Product Exclusion",
          image: "assets/images/product_exclusion.svg",
        ),
        height10,
        const StatusContainer(
          itemname: "Lowest Price Exclusion",
          useTextForm: true,
        ),
        height20,
        CommonButton(
          onCancelPressed: () {},
          onSavePressed: () {},
        ),
        height20,
        const StatusContainer(
          itemname: "Highest Price Exclusion",
          useTextForm: true,
        ),
        height20,
        CommonButton(
          onCancelPressed: () {},
          onSavePressed: () {},
        ),
      ],
    );
  }

  Widget _buildDynamicAds() {
    return Column(
      children: [
        height20,
        const CatalogContainer(
          name: "Dynamic Ads - Exclusion",
          image: "assets/images/keyboard-open.svg",
        ),
        height10,
        const StatusContainer(
          itemname: "Lowest Price Exclusion",
          useTextForm: true,
        ),
        height20,
        CommonButton(
          onCancelPressed: () {},
          onSavePressed: () {},
        ),
        height20,
        const StatusContainer(
          itemname: "Highest Price Exclusion",
          useTextForm: true,
        ),
        height20,
        CommonButton(
          onCancelPressed: () {},
          onSavePressed: () {},
        ),
      ],
    );
  }
}

class StatusContainer extends StatelessWidget {
  final String itemname;
  final bool? switchvalue;
  final ValueChanged<bool>? onSwitchChnaged;
  final bool useTextForm;

  const StatusContainer({
    super.key,
    required this.itemname,
    this.switchvalue,
    this.onSwitchChnaged,
    this.useTextForm = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.75,
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
              useTextForm
                  ? SizedBox(
                      width: 100,
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 14),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffE5E5E5),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffE5E5E5),
                            ),
                          ),
                          labelText: "Ex : 5450",
                          hintStyle: const TextStyle(
                            fontSize: 10,
                            color: kdarkgrey,
                          ),
                        ),
                      ),
                    )
                  : Transform.scale(
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

class CommonButton extends StatelessWidget {
  final VoidCallback onCancelPressed;
  final VoidCallback onSavePressed;
  const CommonButton(
      {super.key, required this.onCancelPressed, required this.onSavePressed});

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
              textStyle: const TextStyle(fontSize: 12, color: kblack),
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
                textStyle: const TextStyle(fontSize: 12, color: kwhite),
                ontap: onSavePressed),
          ),
        ],
      ),
    );
  }
}
