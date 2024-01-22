import 'dart:ui';
import 'package:ads/src/features/bottombar/account/view/edit_profile.dart';
import 'package:ads/src/features/bottombar/account/view/help_support.dart';
import 'package:ads/src/features/bottombar/account/view/notifications.dart';
import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/homepage/customapp_bar.dart';
import 'package:ads/src/features/common_widget/custom_elevatedbutton.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAppBar(
                  name: "My Account",
                  imagepath: "assets/images/my_account.svg"),
              Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
              AccountList(
                imagepath: "assets/images/edit_icon.svg",
                title: "Edit Profile",
                onTap: () {
                  Get.to(() => const AccountEditProfile());
                },
              ),
              AccountList(
                imagepath: "assets/images/notifications_icon.svg",
                title: "Notifications",
                onTap: () {
                  Get.to(() => const AccountNotificatons());
                },
              ),
              AccountList(
                imagepath: "assets/images/change_icon.svg",
                title: "Change Password",
                onTap: () {
                  _showPopup(context);
                },
              ),
              AccountList(
                imagepath: "assets/images/help_icon.svg",
                title: "Help and Support",
                onTap: () {
                  Get.to(() => const AccountHelpSupport());
                },
              ),
              height50,
              CommonElevatedButton(
                  name: "Logout",
                  buttonwidth: 0.20,
                  buttonheight: 0.06,
                  textStyle: const TextStyle(fontSize: 12, color: kwhite),
                  ontap: () {},
                  iconname: Icons.logout),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),

    );
  }
}

class AccountList extends StatelessWidget {
  final String imagepath;
  final String title;
  final VoidCallback onTap;

  const AccountList(
      {super.key,
      required this.imagepath,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            minVerticalPadding: 0,
            horizontalTitleGap: 4,
            onTap: onTap,
            leading: SvgPicture.asset(imagepath),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded,
                color: kblack, size: 20),
          ),
        ),
        divider16,
      ],
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
                color: Colors.white.withOpacity(0.3),
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
                    const Text(
                      "Change Password",
                      style: TextStyle(fontSize: 18),
                    ),
                    height5,
                    Divider(color: kblack.withOpacity(0.1), thickness: 0.5),
                    height10,
                    // CustomTextField(hinttext: "Enter your old password"),
                    // CustomTextField(hinttext: "Enter your new password"),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Password must contains a uppercase letters",
                          style: TextStyle(
                            letterSpacing: -0.3,
                            fontSize: 8,
                            color: Color(0xff878787),
                          ),
                        ),
                      ),
                    ),
                    height5,
                    // CustomTextField(hinttext: "Confirm your password"),
                    height20,
                    CommonElevatedButton(
                      name: "Update",
                      buttonwidth: 0.25,
                      buttonheight: 0.06,
                      textStyle: const TextStyle(fontSize: 12),
                      ontap: () {},
                    ),
                    height10,
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
