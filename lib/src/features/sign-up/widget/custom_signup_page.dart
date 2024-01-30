import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomSignupPage extends StatelessWidget {
  final String? iconimage;
  final String? title;
  final List<String?> labelTexts;
  final List<TextEditingController?> controllers;
  final String? Function(String?)? validator;
  final bool? iscompanyvisible;
  final VoidCallback onTap;
  final dynamic Function(String)? textfieldOntap;

  const CustomSignupPage(
      {super.key,
      this.iconimage,
      this.title,
      this.iscompanyvisible = false,
      required this.onTap,
      required this.labelTexts,
      required this.controllers,
      this.validator,
      this.textfieldOntap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        if (iscompanyvisible == true)
          CompanyContainer(
              height: Get.height * 0.15,
              paintwidth: Get.width,
              titlename: "Hello Sai, Let Me\nKnow your Company\nname!",
              textStyle: const TextStyle(
                  color: kwhite,
                  fontSize: 16,
                  fontFamily: FontAssets.Poppins,
                  fontWeight: FontWeight.w500),
              isIcon: true)
        else
          Column(
            children: [
              SvgPicture.asset(iconimage!),
              height10,
              Text(
                title!,
                style: const TextStyle(
                    fontFamily: FontAssets.Poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 26),
              ),
            ],
          ),
        height30,
        for (int i = 0; i < labelTexts.length; i++)
          if (labelTexts[i] != null)
            Column(
              children: [
                CustomTextField(
                  validator: validator,
                  onChanged: textfieldOntap,
                  labelText: labelTexts[i]!,
                  controller: controllers[i],
                ),
                height25,
              ],
            ),
        height30,
        CommonElevatedButton(
          name: "Next",
          buttonwidth: 0.45,
          textStyle: elevatedtextstyle,
          ontap: onTap,
        )
      ]),
    );
  }
}

class CardPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = kred;

    Path path = Path()
      ..lineTo(size.width * 0.90, 0)
      ..lineTo(size.width * 0.70, size.height * 0.5)
      ..lineTo(size.width * 0.90, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CompanyContainer extends StatelessWidget {
  final double height;
  final double paintwidth;
  final bool? isIcon;
  final String titlename;
  final TextStyle textStyle;

  const CompanyContainer(
      {super.key,
      required this.height,
      required this.paintwidth,
      this.isIcon = false,
      required this.titlename,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: height,
      child: Stack(
        children: [
          CustomPaint(
            painter: CardPaint(),
            size: Size(paintwidth, Get.height),
          ),
          Padding(
            padding: EdgeInsets.all(isIcon == true ? 16 : 10),
            child: Row(
              children: [
                isIcon == true
                    ? SvgPicture.asset("assets/images/person_icon_white.svg")
                    : const SizedBox(),
                (isIcon == true ? kwidth20 : kwidth10),
                Expanded(
                  child: Text(
                    titlename,
                    maxLines: 3,
                    style: textStyle,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
