import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/adchat/chat_screen.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
        dividerind16,
        height15,
        const Text(
          "Need Help?",
          style: TextStyle(fontSize: 24),
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
            padding: const EdgeInsets.only(left: 16),
            child: RichText(
              text: const TextSpan(
                text: "Here is the ",
                style:
                    TextStyle(fontSize: 28, color: kblack, letterSpacing: -0.3),
                children: [
                  TextSpan(
                    text: "AdChat\n",
                    style: TextStyle(fontSize: 28, color: kred),
                  ),
                  TextSpan(
                    text: "assistance which can help\nyou!",
                    style: TextStyle(
                        fontSize: 28, color: kblack, letterSpacing: -0.3),
                  ),
                ],
              ),
            ),
          ),
        ),
        height40,
        CommonElevatedButton(
            name: "Adchat",
            buttonwidth: 0.45,
            textStyle: elevatedtextstyle,
            ontap: () {
              Get.to(() => const AdChatScreen());
            },
            iconname: Icons.forum_outlined),
        height20,
      ],
    );
  }
}
