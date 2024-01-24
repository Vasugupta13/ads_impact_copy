import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/common_widget/custom_elevatedbutton.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountHelpSupport extends StatefulWidget {
  const AccountHelpSupport({super.key});

  @override
  State<AccountHelpSupport> createState() => _AccountHelpSupportState();
}

class _AccountHelpSupportState extends State<AccountHelpSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: const Text(
          "Help and Support",
          style: TextStyle(fontSize: 18, color: kblack),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Divider(color: kblack.withOpacity(0.2), endIndent: 0, indent: 26),
            height10,
            const Text(
              "Frequently Asked Questions",
              style: TextStyle(fontSize: 18),
            ),
            height10,
            Container(
              width: Get.width,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(left: 16, top: 16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: kblack.withOpacity(0.2),
                    offset: const Offset(2, 4),
                  ),
                  BoxShadow(
                    blurRadius: 4,
                    color: kblack.withOpacity(0.25),
                    offset: const Offset(-2, -1),
                  ),
                ],
                color: kwhite,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/help_icon.svg"),
                      kwidth15,
                      const Text(
                        "FAQ'S",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const FAQList("1.     What is ROAS?"),
                  const FAQList("2.     Norem ipsum dolor sit"),
                  const FAQList("3.     Norem ipsum dolor"),
                  const FAQList("4.     korem ipsum dolor sit"),
                  const FAQList("5.     Porem ipsum dolor"),
                  height20,
                  CommonElevatedButton(
                    alternatecolor: kwhite,
                    bordercolor: kblack.withOpacity(0.1),
                    name: "View more",
                    buttonwidth: 0.25,
                    buttonheight: 0.06,
                    textStyle: const TextStyle(color: kblack, fontSize: 12),
                    ontap: () {},
                  ),
                  height20,
                ],
              ),
            ),
            height30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/support_icon.svg"),
                kwidth10,
                const Text(
                  "Support",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
            height10,
            _buildSupportDetail("Name : ", " Isabella Anderson"),
            height2,
            _buildSupportDetail("Phone : ", " +1 (555) 123-4567"),
            height30,
            CommonElevatedButton(
                name: "Adchat",
                buttonwidth: 0.20,
                buttonheight: 0.06,
                textStyle: const TextStyle(color: kwhite, fontSize: 12),
                ontap: () {},
                iconname: Icons.chat_bubble_outline),
            height30,
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildSupportDetail(String name, String detail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            color: kdarkgrey,
          ),
        ),
        Text(
          detail,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ],
    );
  }
}

class FAQList extends StatelessWidget {
  final String text;

  const FAQList(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: kblack.withOpacity(0.1),
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: kdarkgrey.withOpacity(0.7)),
          ),
        ],
      ),
    );
  }
}
