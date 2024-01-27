import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/features/menu/insights/view/adset_analysis.dart';
import 'package:ads/src/homepage/homepage.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:ads/src/utils/snackbar_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../forget_password/forget_password.dart';
import '../sign-up/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routerPath = '/LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: screenHeight * 0.05),
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageAssets.adslogo,
                    fit: BoxFit.contain,
                    width: screenWidth * 0.15,
                  ),
                  height50,
                  SvgPicture.asset(IconAssets.loginicon),
                  height20,
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: FontAssets.Poppins,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: kred),
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Enter your Email address",
                    onChanged: (value) {},
                  ),
                  height25,
                  CustomTextField(
                    controller: _passwordController,
                    hintText: "Password",
                    isPassword: true,
                    onChanged: (value) {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.07),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(0),
                        ),
                        onPressed: () {
                          // context.push(ForgotPassword.routerPath);
                          Get.to(() => const ForgotPassword());
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            fontFamily: FontAssets.Poppins,
                            fontWeight: FontWeight.w500,
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
                    buttonwidth: 0.40,
                    textStyle: elevatedtextstyle,
                    ontap: () {
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      if (email.isEmpty) {
                        SnackBarService.showSnackBar(
                            context: context, message: "Enter Email Address");
                      } else if (password.isEmpty) {
                        SnackBarService.showSnackBar(
                            context: context, message: "Enter Your Password");
                      } else {
                        // authController.loginUser();
                        Get.off(() => const HomePage());
                      }
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
                  fontFamily: FontAssets.Poppins,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff585858),
                ),
              ),
              TextButton(
                onPressed: () {
                  // context.push(Signup.routerPath);
                  Get.to(() => const Signup());
                },
                child: const Text(
                  "Sign-Up",
                  style: TextStyle(
                      fontFamily: FontAssets.Poppins,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: kred),
                ),
              ),
            ],
          ),
          height30,
        ],
      ),
    ));
  }
}
