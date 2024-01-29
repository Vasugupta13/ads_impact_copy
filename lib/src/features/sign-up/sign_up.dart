import 'package:ads/src/features/connect_account/connect_your_account.dart';
import 'package:ads/src/features/sign-up/widget/custom_signup_page.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:ads/src/utils/snackbar_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  static const routerPath = '/Signup';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _mobilenumberController = TextEditingController();
  final TextEditingController _companynameController = TextEditingController();
  final TextEditingController _companywebsiteController =
      TextEditingController();

  final PageController _pageController = PageController();
  int _currentpage = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
          backgroundColor: kwhite,
          elevation: 0,
          automaticallyImplyLeading: false),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentpage = index;
                });
              },
              children: [
                CustomSignupPage(
                    onTap: () {
                      final email = _emailController.text;
                      final username = _usernameController.text;
                      final password = _passwordController.text;
                      final confirmpassword = _confirmpasswordController.text;
                      if (email.isEmpty) {
                        SnackBarService.showSnackBar(
                            context: context, message: "Enter your E-mail");
                      } else if (username.isEmpty) {
                        SnackBarService.showSnackBar(
                            context: context, message: "Enter your Username");
                      } else if (password.isEmpty) {
                        SnackBarService.showSnackBar(
                            context: context, message: "Enter your Passowrd");
                      } else if (confirmpassword.isEmpty) {
                        SnackBarService.showSnackBar(
                            context: context, message: "Confirm your Password");
                      } else if (password != confirmpassword) {
                        SnackBarService.showSnackBar(
                            context: context, message: "Password do not Match");
                      } else {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }
                    },
                    iconimage: IconAssets.loginicon,
                    title: "Sign-up",
                    istextfield1: true,
                    labelText1: "Enter your E-mail",
                    textField1Controller: _emailController,
                    istextfield2: true,
                    labelText2: "Enter your Username",
                    istextfield3: true,
                    textField2Controller: _usernameController,
                    labelText3: "Password",
                    istextfield4: true,
                    textField3Controller: _passwordController,
                    labelText4: "Confirm Password",
                    textField4Controller: _confirmpasswordController),
                CustomSignupPage(
                    onTap: () {
                      final firstname = _firstnameController.text;
                      final lastname = _lastnameController.text;
                      final mobile = _mobilenumberController.text;
                      if (firstname.isEmpty) {
                        SnackBarService.showSnackBar(
                            context: context, message: "Enter your First Name");
                      } else if (lastname.isEmpty) {
                        SnackBarService.showSnackBar(
                            context: context, message: "Enter your Last Name");
                      } else if (mobile.isEmpty) {
                        SnackBarService.showSnackBar(
                            context: context,
                            message: "Enter your Mobile Number");
                      } else {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }
                    },
                    iconimage: IconAssets.loginicon,
                    title: "About Yourself",
                    labelText1: "Enter your First Name",
                    textField1Controller: _firstnameController,
                    labelText2: "Enter your Last Name",
                    textField2Controller: _lastnameController,
                    labelText3: "Enter your Mobile Number",
                    textField3Controller: _mobilenumberController,
                    istextfield1: true,
                    istextfield2: true,
                    istextfield3: true),
                CustomSignupPage(
                    onTap: () {
                      // context.push(ConnectYourAccounts.routerPath);
                      final company = _companynameController.text;
                      final companywebsite = _companywebsiteController.text;
                      if (company.isEmpty) {
                        SnackBarService.showSnackBar(
                            context: context,
                            message: "Enter your Company Name");
                      } else if (companywebsite.isEmpty) {
                        SnackBarService.showSnackBar(
                            context: context,
                            message: "Enter your Company Website");
                      } else {
                        Get.to(
                          () => const ConnectYourAccounts(),
                        );
                      }
                    },
                    iscompanyvisible: true,
                    labelText1: "Enter your Company Name",
                    textField1Controller: _companynameController,
                    labelText2: "Enter your Company Website",
                    textField2Controller: _companywebsiteController,
                    istextfield1: true,
                    istextfield2: true),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Step ${_currentpage + 1}",
                style: const TextStyle(
                    fontFamily: FontAssets.Poppins,
                    fontSize: 14,
                    color: kblack,
                    fontWeight: FontWeight.w600),
              ),
              height5,
              SizedBox(
                width: screenWidth * 0.8,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(12),
                  minHeight: 10,
                  backgroundColor: Colors.black.withOpacity(0.7),
                  value: _calculateLinearProgress(),
                  valueColor: const AlwaysStoppedAnimation(kred),
                ),
              ),
            ],
          ),
          height40,
        ],
      ),
    );
  }

  double _calculateLinearProgress() {
    if (_currentpage == 0) {
      return 0.2;
    } else if (_currentpage == 1) {
      return 0.4;
    } else {
      return 0.6;
    }
  }
}
