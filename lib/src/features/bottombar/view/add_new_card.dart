import 'dart:ui';
import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/homepage/homepage.dart';
import 'package:ads/src/res/global_basicuser.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
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
          "Add new card",
          style: TextStyle(fontSize: 18, color: kblack),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Divider(color: kblack.withOpacity(0.2), endIndent: 0, indent: 26),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Get.height * 0.25,
                  width: Get.width * 0.7,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xffE8EBF2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "5678 9012 3456 1234",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expiry Date",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "09/20",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "CVV",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "980",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Ella Lewis",
                            style: TextStyle(fontSize: 18),
                          ),
                          SvgPicture.asset(
                            "assets/images/mastercard.svg",
                            height: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height * 0.25,
                  width: Get.width * 0.1,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xff1A377D),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: const RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      "SBI DEBIT CARD",
                      style: TextStyle(color: kwhite, fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
            height10,
            // CustomTextField(hinttext: "Name on Card",),
            // CustomTextField(hinttext: "Card number"),
            // CustomTextField(hinttext: "Expiry date"),
            // CustomTextField(hinttext: "CVV"),
            height30,
            CommonElevatedButton(
              name: "Add new Card",
              buttonwidth: 0.25,
              buttonheight: 0.06,
              textStyle: const TextStyle(fontSize: 12),
              ontap: () {
                _showPopup(
                  context,
                  () {
                    basicPlan = true;
                    setState(() {});
                    print("basic plan $basicPlan");
                    Get.to(() => const HomePage());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

_showPopup(BuildContext context, Function() ontap) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
            Dialog(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/images/add_cart_popup.png",
                        height: Get.height * 0.25),
                    height5,
                    Divider(color: kblack.withOpacity(0.1), thickness: 1),
                    height20,
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "Congratulations! ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffFF0000),
                        ),
                        children: [
                          TextSpan(
                            text: "You are now a\nBasic Plan User",
                            style: TextStyle(fontSize: 16, color: kblack),
                          ),
                        ],
                      ),
                    ),
                    height30,
                    CommonElevatedButton(
                      name: "Next",
                      buttonwidth: 0.25,
                      buttonheight: 0.06,
                      textStyle: const TextStyle(fontSize: 12),
                      ontap: ontap,
                    ),
                    height20,
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
