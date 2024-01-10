import 'package:ads/src/features/connect_account/connect_your_account.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompanyName extends StatefulWidget {
  const CompanyName({super.key});

  @override
  State<CompanyName> createState() => _CompanyNameState();
}

class _CompanyNameState extends State<CompanyName> {
  String name = "";
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SvgPicture.asset("assets/images/Rectangle127.svg"),
              Positioned(
                top: 15,
                left: 20,
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/solar_user-broken.svg"),
                    kwidth30,
                    Text(
                      "Hello $name, Let Me\nKnow your Company\nname!",
                      maxLines: 3,
                      style: const TextStyle(
                          
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                    height20,
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 26),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.2), width: 1.3),
                        ),
                        hintText: "Enter your Company Name",
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(
                          fontSize: 16,

                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    height20,
                    const DetailsField(name: "Enter your Company Website"),
                    height50,
                    ElevatedButton(
                      onPressed: () {
                        Get.off(() => const ConnectYourAccounts(),
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
                  "Step 3",
                  style: TextStyle(
                      fontSize: 14, color: kblack, fontWeight: FontWeight.w600),
                ),
                height5,
                LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(18),
                  minHeight: 10,
                  backgroundColor: Colors.black.withOpacity(0.7),
                  value: 0.6,
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
