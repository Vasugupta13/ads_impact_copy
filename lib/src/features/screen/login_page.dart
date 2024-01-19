import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/features/common_widget/custom_elevatedbutton.dart';
import 'package:ads/src/homepage/homepage.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../forget_password/forget_password.dart';
import '../sign-up/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kwhite,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/Vector.svg",
                      fit: BoxFit.contain),
                  height50,
                  SvgPicture.asset("assets/images/icon.svg"),
                  height20,
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w600, color: kred),
                  ),
                  height50,
                  CustomTextField(
                    hintText: "Enter your Email address",
                    onChanged: (p0) {},
                  ),
                  height25,
                  CustomTextField(
                    hintText: "Password",
                    isPassword: true,
                    onChanged: (p0) {},
                  ),
                  SizedBox(
                    width: Get.width * 0.8,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => const ForgotPassword());
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  height30,
                  CommonElevatedButton(
                    name: "Login",
                    buttonwidth: 0.45,
                    textStyle: elevatedtextstyle,
                    ontap: () {
                      Get.off(() => const HomePage());
                    },
                  ),
                ],
              ),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff585858),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const Signup());
                },
                child: const Text(
                  "Sign-Up",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14, color: kred),
                ),
              ),
            ],
          ),
          height40,
        ],
      ),
    );
  }
}
