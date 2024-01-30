import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/adchat/chat_screen.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

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
          style: TextStyle(
              fontFamily: FontAssets.Poppins,
              fontWeight: FontWeight.w500,
              fontSize: 24),
        ),
        height20,
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(ImageAssets.chatbot),
        ),
        height20,
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: RichText(
              text: const TextSpan(
                text: "Here is the ",
                style: TextStyle(
                    fontFamily: FontAssets.Poppins,
                    fontSize: 24,
                    color: kblack,
                    fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: "AdChat\n",
                    style: TextStyle(
                        fontFamily: FontAssets.Poppins,
                        fontSize: 24,
                        color: kred,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: "assistance which can help\nyou!",
                    style: TextStyle(
                        fontFamily: FontAssets.Poppins,
                        fontSize: 24,
                        color: kblack,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
        height40,
        CommonElevatedButton(
            name: "Adchat",
            buttonwidth: 0.35,
            textStyle: elevatedtextstyle,
            ontap: () {
              // context.push(AdChatScreen.routerpath);
              Get.to(() => const AdChatScreen());
            },
            preifxicon: IconAssets.message),
        height20,
      ],
    );
  }
}
