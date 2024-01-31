import 'package:ads/src/class/strings.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SocialAccountList extends StatefulWidget {
  final Function(int index) onTapCallback;
  const SocialAccountList({super.key, required this.onTapCallback});

  @override
  State<SocialAccountList> createState() => _SocialAccountListState();
}

class _SocialAccountListState extends State<SocialAccountList> {
  int listindex = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: screenHeight * 0.1 - 15,
        width: screenWidth * 0.95,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000040).withOpacity(0.25),
              blurRadius: 16,
              spreadRadius: 1,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ListView.separated(
          itemCount: AppStrings.socialaccount.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            bool isSelected = index == listindex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  listindex = index;
                  widget.onTapCallback(index);
                });
              },
              child: Container(
                // height: 60,
                width: screenWidth * 0.25,
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: SvgPicture.asset(
                              AppStrings.socialaccount[index]["imageurl"],
                              fit: BoxFit.contain),
                        ),
                        kwidth5,
                        Text(
                          AppStrings.socialaccount[index]["name"],
                          style: const TextStyle(
                              fontFamily: FontAssets.Poppins,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        kwidth5,
                      ],
                    ),
                    const SizedBox(height: 17),
                    Container(
                      height: 1,
                      color: isSelected ? kred : Colors.transparent,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return VerticalDivider(
              indent: 18,
              endIndent: 18,
              thickness: 1,
              color: kblack.withOpacity(0.2),
            );
          },
        ),
      ),
    );
  }
}
