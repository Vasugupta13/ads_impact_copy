import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OurPlansContainer extends StatelessWidget {
  final double containerheight;
  final double containerwidth;
  final String titleletter;
  final String titlename;
  final double titlewordsize;
  final double titlenamesize;
  final double customfontsize;
  final Color titlewordcolor;
  final String imageurl;
  final VoidCallback onTap;

  const OurPlansContainer(
      {super.key,
      required this.imageurl,
      required this.titleletter,
      required this.titlename,
      required this.containerheight,
      required this.containerwidth,
      this.customfontsize = 12,
      this.titlewordsize = 24,
      this.titlenamesize = 24,
      this.titlewordcolor = kblue77D, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: containerheight,
          width: containerwidth,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kwhite,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 16,
                  color: kblack.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  spreadRadius: 0),
            ],
          ),
          child: Column(
            children: [
              height10,
              SvgPicture.asset(imageurl, height: Get.height * 0.15),
              height5,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: titleletter,
                  style: TextStyle(
                      fontFamily: FontAssets.Poppins,
                      color: titlewordcolor,
                      fontSize: titlewordsize,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: titlename,
                      style: TextStyle(
                          fontFamily: FontAssets.Poppins,
                          fontSize: titlenamesize,
                          fontWeight: FontWeight.w600,
                          color: kblack),
                    ),
                  ],
                ),
              ),
              height5,
              Divider(
                  color: kblack.withOpacity(0.1), endIndent: 20, indent: 20),
              height5,
              for (var item in [
                "10 + Users Help and support",
                "Qorem ipsum dolor sit",
                "Porem ipsum dolor sit amet",
                "Porem ipsum dolor sit amet",
                "Porem ipsum dolor sit amet",
              ])
                Column(
                  children: [
                    Text(
                      item,
                      style: TextStyle(
                        fontFamily: FontAssets.Poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: customfontsize,
                        color: kblack.withOpacity(0.4),
                      ),
                    ),
                    height5,
                  ],
                ),
            ],
          ),
        ),
        height20,
        CommonElevatedButton(
          name: "Buy Now",
          buttonwidth: 0.45,
          textStyle: elevatedtextstyle,
          ontap: onTap,
        ),
        height20,
      ],
    );
  }
}
