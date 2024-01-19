import 'dart:ui';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/features/common_widget/custom_elevatedbutton.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'create_new_password.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp,
              color: kblack, size: 20),
        ),
        title: const Text(
          "Forget Password?",
          style: TextStyle(
              fontWeight: FontWeight.w600, color: kblack, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_sharp, size: 26, color: kblack),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            height30,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Enter the email associated with your account\nand we'll send an email with instructions to reset your password.",
                maxLines: 3,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: textcolor,
                    fontSize: 12),
              ),
            ),
            height30,
            const CustomTextField(hintText: "Enter your E-mail address"),
            height40,
            CommonElevatedButton(
              name: "Send Instructions",
              buttonwidth: 0.45,
              textStyle: elevatedtextstyle,
              ontap: () {
                _showPopup(context);
              },
            ),
            SizedBox(height: Get.height * 0.05),
            Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset("assets/images/forgot_password.svg",
                  fit: BoxFit.contain),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset("assets/images/Vector.svg"),
          height40,
        ],
      ),
    );
  }
}

void _showPopup(BuildContext context) {
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
                color: kwhite.withOpacity(0.5),
              ),
            ),
            Dialog(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    height40,
                    SvgPicture.asset("assets/images/Group18292.svg"),
                    height30,
                    Text(
                      "We have sent a link that contain\nemail instructions to reset your\npassword",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: kblack.withOpacity(0.56),
                          fontSize: 14),
                    ),
                    height40,
                    CommonElevatedButton(
                      name: "Open Mail",
                      buttonwidth: 0.45,
                      textStyle: elevatedtextstyle,
                      ontap: () {
                        Get.off(() => const CreateNewPassword());
                      },
                    ),
                    height30,
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
