import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../const.dart';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Forget Password?",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help_sharp,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 34),
                    child: Column(
                      children: [
                        const Text(
                          "Enter the email associated with your account and we'll send an email with instructions to reset your password.",
                          maxLines: 3,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff989898),
                            fontSize: 15,
                          ),
                        ),
                        height50,
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 13,
                              horizontal: 26,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                                width: 1.3,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            hintText: "Enter your E-mail address",
                            alignLabelWithHint: true,
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                        ),
                        height50,
                        ElevatedButton(
                          onPressed: () {
                            _showPopup(context);
                          },
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            elevation: 0,
                            fixedSize: Size(
                              MediaQuery.of(context).size.height * 0.26,
                              MediaQuery.of(context).size.height * 0.06,
                            ),
                            backgroundColor: const Color(0xffFF4848),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            "Send Instructions",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height30,
                  Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      "assets/images/pana.svg",
                      height: MediaQuery.of(context).size.height * 0.32,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          height15,
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset("assets/images/Vector.svg"),
          ),
          height20,
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
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
            Dialog(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
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
                    ElevatedButton(
                      onPressed: () {
                        Get.off(() => const CreateNewPassword(),
                            transition: Transition.zoom);
                      },
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        elevation: 0,
                        fixedSize: const Size(170, 46),
                        backgroundColor: const Color(0xffFF4848),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Open Mail",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
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
