import 'package:ads/src/features/common_widget/elevatedbutton.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../adchat/chat_page.dart';

class NeedHelp extends StatefulWidget {
  const NeedHelp({super.key});

  @override
  State<NeedHelp> createState() => _NeedHelpState();
}

class _NeedHelpState extends State<NeedHelp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: kblack.withOpacity(0.3), endIndent: 8, indent: 8),
        height15,
        const Text(
          "Need Help",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: -0.3),
        ),
        height20,
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset("assets/images/chatbot.svg"),
        ),
        height15,
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 28),
            child: RichText(
              text: const TextSpan(
                text: "Here is the ",
                style: TextStyle(
                    fontSize: 28,
                    color: kblack,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.3),
                children: [
                  TextSpan(
                    text: "AdChat\n",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFF4848),
                        letterSpacing: -0.3),
                  ),
                  TextSpan(
                    text: "assistance which can help\nyou!",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: kblack,
                        letterSpacing: -0.3),
                  ),
                ],
              ),
            ),
          ),
        ),
        height40,
        ElevatedButton.icon(
          style: ButtonStyle(
            alignment: Alignment.center,
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            fixedSize: MaterialStateProperty.all<Size>(
              const Size(160, 44),
            ),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xffFF4848),
            ),
          ),
          onPressed: () {
            Get.to(() => const AdChat());
          },
          icon: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(CupertinoIcons.text_bubble),
          ),
          label: const Text(
            "Adchat",
          ),
        ),
        height20,
      ],
    );
  }
}
