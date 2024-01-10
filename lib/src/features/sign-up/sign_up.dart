import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'about_yourself.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/icon.svg"),
                    height10,
                    const Text(
                      "Sign-up",
                      style:
                          TextStyle(fontSize: 26, ),
                    ),
                    height30,
                    const DetailsField(name: "Enter your E-mail"),
                    height20,
                    const DetailsField(name: "Enter your Username"),
                    height20,
                    const DetailsField(name: "Password"),
                    height20,
                    const DetailsField(name: "Confirm Password"),
                    height30,
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => const AboutYourself(),
                            transition: Transition.rightToLeftWithFade);
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
                        "Next",
                        style: TextStyle(

                          color: kwhite,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60, left: 34, right: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Step 1",
                  style: TextStyle(
                      fontSize: 14, color: kblack, fontWeight: FontWeight.w600),
                ),
                height5,
                LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(18),
                  minHeight: 10,
                  backgroundColor: Colors.black.withOpacity(0.7),
                  value: 0.2,
                  valueColor: const AlwaysStoppedAnimation(Color(0xffFF4848)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DetailsField extends StatelessWidget {
  final String name;

  const DetailsField({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 13, horizontal: 26),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(color: Colors.black.withOpacity(0.2), width: 1.3),
        ),
        hintText: name,
        alignLabelWithHint: true,
        hintStyle: TextStyle(
          fontSize: 16,
          
          color: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }
}
