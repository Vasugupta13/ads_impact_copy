import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/features/common_widget/elevatedbutton.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

class AccountEditProfile extends StatelessWidget {
  const AccountEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontSize: 18, color: kblack),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Divider(color: kblack.withOpacity(0.2), endIndent: 0, indent: 26),
            CustomTextField(hinttext: "Isabella Anderson"),
            CustomTextField(hinttext: "isabella.lee@example.com"),
            CustomTextField(hinttext: "William Davis"),
            CustomTextField(hinttext: "Mia Taylor"),
            CustomTextField(hinttext: "+1 (555) 234-5678"),
            CustomTextField(hinttext: "Ricoz"),
            CustomTextField(hinttext: "https://ricoz.in"),
            height30,
            CommonElevatedButton(
              name: "Update",
              buttonwidth: 0.25,
              buttonheight: 0.06,
              textStyle: const TextStyle(fontSize: 12, color: kwhite),
              ontap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
