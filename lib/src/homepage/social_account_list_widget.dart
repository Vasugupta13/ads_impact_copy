import 'package:ads/src/res/strings.dart';
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
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: Get.height * 0.1 - 15,
        width: Get.width * 0.90,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000040).withOpacity(0.25),
              blurRadius: 16,
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
            return GestureDetector(
              onTap: () {
                setState(() {
                  listindex = index;
                  widget.onTapCallback(index);
                });
              },
              child: Container(
                // height: 60,
                width: Get.width * 0.25,
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                          AppStrings.socialaccount[index]["imageurl"],
                          color: kblue77D,
                          fit: BoxFit.contain),
                    ),
                    kwidth5,
                    Text(
                      AppStrings.socialaccount[index]["name"],
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const VerticalDivider(
              indent: 22,
              endIndent: 22,
              thickness: 1,
            );
          },
        ),
      ),
    );
  }
}
