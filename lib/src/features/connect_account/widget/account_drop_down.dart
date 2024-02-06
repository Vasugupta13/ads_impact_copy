import 'package:ads/src/homepage/homepage.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AccountIDDropDown extends StatefulWidget {
  final bool? isChooseSocial;
  final String menutitle;
  final List<String> itemList;
  final String? selectedValue;
  final ValueChanged<String?> onItemSelected;

  const AccountIDDropDown({
    super.key,
    this.isChooseSocial = false,
    required this.menutitle,
    required this.itemList,
    this.selectedValue,
    required this.onItemSelected,
  });

  @override
  State<AccountIDDropDown> createState() => _AccountIDDropDownState();
}

class _AccountIDDropDownState extends State<AccountIDDropDown> {
  String? valueChooseAccount;
  String? valueChooseId;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: widget.isChooseSocial == true ? 42 : 30,
      width:
          widget.isChooseSocial == true ? screenWidth * 0.7 : screenWidth * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: PopupMenuButton<String>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        surfaceTintColor: kwhite,
        color: kwhite,
        onSelected: widget.onItemSelected,
        itemBuilder: (BuildContext context) {
          return [
            if (widget.isChooseSocial!)
              PopupMenuItem<String>(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                enabled: false,
                child: Center(
                  child: Text(
                    widget.menutitle,
                    style: TextStyle(
                      
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: kblack.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ...widget.itemList.map((valueItem) {
              return PopupMenuItem<String>(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                value: valueItem,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      height: 1.0,
                      color: kblack.withOpacity(0.2),
                    ),
                    widget.isChooseSocial == true
                        ? Text(valueItem)
                        : RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: kred,
                            title: Text(
                              valueItem,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: kblack,
                              ),
                            ),
                            value: valueItem,
                            groupValue: widget.selectedValue,
                            onChanged: (value) {
                              widget.onItemSelected(value);
                              Navigator.of(context).pop(value);
                            },
                          ),
                  ],
                ),
              );
            }),
          ];
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.isChooseSocial == true
                  ? valueChooseAccount ?? "Choose your Social Media Account"
                  : valueChooseId ?? "Choose your Ad Account",
              style: TextStyle(

                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: kblack.withOpacity(0.4),
              ),
            ),
            widget.isChooseSocial == true
                ? Icon(
                    Icons.arrow_drop_down,
                    color: kblack.withOpacity(0.2),
                  )
                : SvgPicture.asset(IconAssets.connectdropdown),
          ],
        ),
      ),
    );
  }
}
