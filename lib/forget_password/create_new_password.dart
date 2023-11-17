import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../const.dart';
import '../screen/login_page.dart';
import 'forget_password.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController passwordController = TextEditingController();
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.off(() => const ForgotPassword(),
                transition: Transition.rightToLeftWithFade);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Create new password",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  height20,
                  const Text(
                    "Your new password must be different\nfrom previously used passwords.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                      fontSize: 15,
                    ),
                  ),
                  height25,
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  height5,
                  TextFormField(
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: obscureText
                            ? const Icon(
                                Icons.visibility_off_rounded,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.visibility_rounded,
                                color: Colors.black.withOpacity(0.5),
                              ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 26),
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
                      hintText: "Enter your new password",
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                  ),
                  height5,
                  Text(
                    "Must be at least 8 characters",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.60)),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Confirm Password",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  height5,
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 26),
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
                      hintText: "Confirm your new password",
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                  ),
                  height5,
                  Text(
                    "Both passwords must match",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.60)),
                  ),
                  height30,
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.off(() => const LoginPage(),
                            transition: Transition.leftToRight);
                      },
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        elevation: 0,
                        fixedSize:
                            Size(screenHeight * 0.26, screenHeight * 0.06),
                        backgroundColor: const Color(0xffFF4848),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Reset Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: kwhite,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(
              "assets/images/rafiki.svg",
              height: screenHeight * 0.26,
              fit: BoxFit.contain,
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
