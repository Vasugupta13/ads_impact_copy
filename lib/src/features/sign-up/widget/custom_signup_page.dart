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
  final bool? istextfield1;
  final bool? istextfield2;
  final bool? istextfield3;
  final bool? istextfield4;
  final String? hinttext1;
  final String? hinttext2;
  final String? hinttext3;
  final String? hinttext4;
  final bool? iscompanyvisible;
  final VoidCallback onTap;
  final TextEditingController? textField1Controller;
  final TextEditingController? textField2Controller;
  final TextEditingController? textField3Controller;
  final TextEditingController? textField4Controller;

  const CustomSignupPage(
      {super.key,
      this.istextfield1 = false,
      this.istextfield2 = false,
      this.istextfield3 = false,
      this.istextfield4 = false,
      this.hinttext1,
      this.hinttext2,
      this.hinttext3,
      this.hinttext4,
      this.iconimage,
      this.title,
      this.iscompanyvisible = false,
      required this.onTap,
      this.textField1Controller,
      this.textField2Controller,
      this.textField3Controller,
      this.textField4Controller});

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
        if (istextfield1!)
          CustomTextField(
              hintText: hinttext1!, controller: textField1Controller),
        height25,
        if (istextfield2!)
          CustomTextField(
              hintText: hinttext2!, controller: textField2Controller),
        height25,
        if (istextfield3!)
          CustomTextField(
              hintText: hinttext3!, controller: textField3Controller),
        height25,
        if (istextfield4!)
          CustomTextField(
              hintText: hinttext4!, controller: textField4Controller),
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
