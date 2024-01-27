import 'dart:ui';
import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:ads/src/utils/snackbar_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'create_new_password.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  static const routerPath = '/ForgotPassword';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kwhite,
        surfaceTintColor: kwhite,
        foregroundColor: kwhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // GoRouter.of(context).pop();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp,
              color: kblack, size: 20),
        ),
        title: const Text(
          "Forget Password?",
          style: TextStyle(
              fontFamily: FontAssets.Poppins,
              fontWeight: FontWeight.w600,
              color: kblack,
              fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_sharp, size: 26, color: kblack),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: screenHeight * 0.05),
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    child: const Text(
                      "Enter the email associated with your account\nand we'll send an email with instructions to reset your password.",
                      maxLines: 3,
                      style: TextStyle(
                          fontFamily: FontAssets.Poppins,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff989898),
                          fontSize: 12),
                    ),
                  ),
                  height30,
                  CustomTextField(
                      hintText: "Enter your E-mail address",
                      controller: _emailController),
                  height40,
                  CommonElevatedButton(
                    name: "Send Instructions",
                    buttonwidth: 0.45,
                    textStyle: elevatedtextstyle,
                    ontap: () {
                      final email = _emailController.text;
                      if (email.isEmpty) {
                        SnackBarService.showSnackBar(
                            context: context,
                            message: "Enter Your Email Address");
                      } else {
                        _showPopup(context);
                      }
                    },
                  ),
                  height40,
                  Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(ImageAssets.forgotimage,
                        fit: BoxFit.contain),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            ImageAssets.adslogo,
            width: screenWidth * 0.15,
          ),
          height30,
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
          Navigator.of(context).pop();
        },
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                color: kwhite.withOpacity(0.5),
              ),
            ),
            Dialog(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      height40,
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            color: kblue77D.withOpacity(0.1),
                            shape: BoxShape.circle),
                        child: Center(
                          child: SvgPicture.asset(
                            IconAssets.forgotmailicon,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      height30,
                      Text(
                        "We have sent a link that contain\nemail instructions to reset your\npassword",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: FontAssets.Poppins,
                            fontWeight: FontWeight.w400,
                            color: kblack.withOpacity(0.56),
                            fontSize: 12),
                      ),
                      height40,
                      CommonElevatedButton(
                        name: "Open Mail",
                        buttonwidth: 0.40,
                        textStyle: elevatedtextstyle,
                        ontap: () {
                          // context.push(CreateNewPassword.routerPath);
                          Get.off(() => const CreateNewPassword());
                        },
                      ),
                      height20,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
