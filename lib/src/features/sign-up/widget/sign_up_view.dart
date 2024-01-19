import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/features/common_widget/custom_elevatedbutton.dart';
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
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        if (iscompanyvisible == true)
          const CompanyContainer()
        else
          Column(
            children: [
              SvgPicture.asset(iconimage!),
              height10,
              Text(
                title!,
                style: const TextStyle(fontSize: 26),
              ),
            ],
          ),
        height30,
        if (istextfield1!) CustomTextField(hintText: hinttext1!),
        height25,
        if (istextfield2!) CustomTextField(hintText: hinttext2!),
        height25,
        if (istextfield3!) CustomTextField(hintText: hinttext3!),
        height25,
        if (istextfield4!) CustomTextField(hintText: hinttext4!),
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
  const CompanyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.15,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: CardPaint(),
            size: Size(Get.width, Get.height),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                SvgPicture.asset("assets/images/person_icon_white.svg"),
                kwidth20,
                const Expanded(
                  child: Text(
                    "Hello Sai, Let Me\nKnow your Company\nname!",
                    maxLines: 3,
                    style: TextStyle(color: kwhite, fontSize: 16),
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
