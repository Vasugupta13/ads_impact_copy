import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../screen/login_page.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  static const routerPath = '/CreateNewPassword';

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp,
              color: kblack, size: 20),
        ),
        title: const Text(
          "Create new password",
          style: TextStyle(
              fontFamily: FontAssets.Poppins,
              fontWeight: FontWeight.w600,
              color: kblack,
              fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: screenHeight * 0.01),
              child: Column(
                children: [
                  height20,
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.07),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Your new password must be different\nfrom previously used passwords.",
                        style: TextStyle(
                            fontFamily: FontAssets.Poppins,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ),
                  ),
                  height25,
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontFamily: FontAssets.Poppins,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                        height5,
                        const CustomTextField(
                            hintText:
                                "Enter New password"), //! need to add the obsecureicon
                        height2,
                        Text(
                          "Must be at least 8 characters",
                          style: TextStyle(
                              fontFamily: FontAssets.Poppins,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: kblack.withOpacity(0.60)),
                        ),
                        height20,
                        const Text(
                          "Confirm Password",
                          style: TextStyle(
                              fontFamily: FontAssets.Poppins,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                        height5,
                        const CustomTextField(
                            hintText: "Confirm your new password"),
                        height2,

                        Text(
                          "Both passwords must match",
                          style: TextStyle(
                              fontFamily: FontAssets.Poppins,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: kblack.withOpacity(0.60)),
                        ),
                      ],
                    ),
                  ),
                  height40,
                  CommonElevatedButton(
                    name: "Reset Password",
                    buttonwidth: 0.45,
                    textStyle: elevatedtextstyle,
                    ontap: () {
                      // context.push(LoginPage.routerPath);
                      Get.to(() => const LoginPage());
                    },
                  ),
                  height40,
                  Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      ImageAssets.createpassimage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(ImageAssets.adslogo, width: screenWidth * 0.15),
          height30,
        ],
      ),
    );
  }
}
