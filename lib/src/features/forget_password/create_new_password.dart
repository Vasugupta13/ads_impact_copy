import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../screen/login_page.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
          "Create new password",
          style: TextStyle(
              fontWeight: FontWeight.w600, color: kblack, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            height20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your new password must be different\nfrom previously used passwords.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                height25,
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 12),
                ),
                height5,
                const CustomTextField(
                    hintText:
                        "Enter New password"), //! need to add the obsecureicon
                Text(
                  "Must be at least 8 characters",
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: kblack.withOpacity(0.60)),
                ),
                height20,
                const Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 12),
                ),
                height5,
                const CustomTextField(hintText: "Confirm your new password"),
                height5,
                Text(
                  "Both passwords must match",
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: kblack.withOpacity(0.60)),
                ),
              ],
            ),
            height30,
            CommonElevatedButton(
              name: "Reset Password",
              buttonwidth: 0.45,
              textStyle: elevatedtextstyle,
              ontap: () {
                Get.to(() => const LoginPage());
              },
            ),
            SizedBox(height: Get.height * 0.05),
            Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                "assets/images/rafiki.svg",
                fit: BoxFit.contain,
              ),
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
