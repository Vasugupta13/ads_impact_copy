import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/features/menu/automations/view/ad_optimization.dart';
import 'package:ads/src/features/menu/catalog/widget/container_widget.dart';
import 'package:ads/src/homepage/widgets/social_account_list_widget.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ConnectView extends StatefulWidget {
  const ConnectView({super.key});

  @override
  State<ConnectView> createState() => _ConnectViewState();
}

class _ConnectViewState extends State<ConnectView> {
  int listindex = 0;
  bool? isChecked = false;
  List<String> radioitems = ["Conservative", "Enhanced", "Preservance"];

  int? selectedvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 42),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBar(
                name: "Connect", imagepath: "assets/images/connect_logo.svg"),
            height20,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            height5,
            const Text(
              "Choose Platform :",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            height15,
            SocialAccountList(
              onTapCallback: (index) {
                setState(
                  () {
                    listindex = index;
                  },
                );
              },
            ),
            height30,
            if (listindex == 0)
              const CatalogContainer(name: "Facebook Page access")
            else if (listindex == 1)
              const CatalogContainer(name: "Twitter Page access")
            else if (listindex == 2)
              const CatalogContainer(name: "Google Page access")
            else if (listindex == 3)
              const CatalogContainer(name: "Linkedin Page access"),
            height20,
            if (listindex == 0)
              const SocialAccountContainer(
                  image: "assets/images/fb_logo.svg",
                  title: "Facebook",
                  socialname: "Facebook")
            else if (listindex == 1)
              const SocialAccountContainer(
                  image: "assets/images/twitter.svg",
                  title: "Twitter",
                  socialname: "Twitter")
            else if (listindex == 2)
              const SocialAccountContainer(
                  image: "assets/images/google.svg",
                  title: "Twitter",
                  socialname: "Google")
            else if (listindex == 3)
              const SocialAccountContainer(
                  image: "assets/images/link_logo.svg",
                  title: "Twitter",
                  socialname: "Linkedin"),
            height20,
            if (listindex == 0)
              const ConnectDetailsPage(
                  title: "Facebook Page Setting", socialname: "Facebook")
            else if (listindex == 1)
              const ConnectDetailsPage(
                  title: "Twitter Page Setting", socialname: "Twitter")
            else if (listindex == 2)
              const ConnectDetailsPage(
                  title: "Google Page Setting", socialname: "Google")
            else if (listindex == 3)
              const ConnectDetailsPage(
                  title: "Linkedin Page Setting", socialname: "Linkedin"),
            height20,
            if (listindex == 0)
              const ConnectDetailsPage(
                  title: "Facebook AdPage Setting", socialname: "Facebook")
            else if (listindex == 1)
              const ConnectDetailsPage(
                  title: "Twitter AdPage Setting", socialname: "Twitter")
            else if (listindex == 2)
              const ConnectDetailsPage(
                  title: "Google AdPage Setting", socialname: "Google")
            else if (listindex == 3)
              const ConnectDetailsPage(
                  title: "Linkedin AdPage Setting", socialname: "Linkedin"),
            height20,
            if (listindex == 0)
              const ConnectDetailsPage(
                  title: "Facebook Catalog ID", socialname: "Facebook")
            else if (listindex == 1)
              const ConnectDetailsPage(
                  title: "Twitter Catalog ID", socialname: "Twitter")
            else if (listindex == 2)
              const ConnectDetailsPage(
                  title: "Google Catalog ID", socialname: "Google")
            else if (listindex == 3)
              const ConnectDetailsPage(
                  title: "Linkedin Catalog ID", socialname: "Linkedin"),
            height20,
            Container(
              width: Get.width * 0.75,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: kblack.withOpacity(0.1),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "Data Sharing",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color(0xffE5E5E5),
                  ),
                  height20,
                  if (listindex == 0)
                    Text("Facebook Ad Account Share Data", style: prestyle)
                  else if (listindex == 1)
                    Text("Twitter Ad Account Share Data", style: prestyle)
                  else if (listindex == 2)
                    Text("Google Ad Account Share Data", style: prestyle)
                  else if (listindex == 3)
                    Text("Linkedin Ad Account Share Data", style: prestyle),
                  height20,
                  const Text(
                    "Preference",
                    style: TextStyle(fontSize: 16),
                  ),
                  height20,
                  SizedBox(
                    width: Get.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: radioitems.length,
                      itemBuilder: (context, index) {
                        bool isSelected = selectedvalue == index;
                        return Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedvalue = index;
                                  });
                                },
                                child: Container(
                                  width: Get.width * 0.32,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(12),
                                    ),
                                    border: Border.fromBorderSide(
                                      BorderSide(
                                        color: isSelected
                                            ? const Color(0xff1A377D)
                                            : kblack.withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Radio(
                                        value: index,
                                        groupValue: selectedvalue,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedvalue = value;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text(
                                          radioitems[index],
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedvalue = index;
                                  });
                                },
                                child: Container(
                                  height: Get.height * 0.25,
                                  width: Get.width * 0.55,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                    border: Border.all(
                                      color: isSelected
                                          ? const Color(0xff1A377D)
                                          : kblack.withOpacity(0.3),
                                    ),
                                  ),
                                  child: Image.asset(
                                      "assets/images/connect_images.png"),
                                ),
                              ),
                              height30,
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  height20,
                  const Text(
                    "Connect Pixel",
                    style: TextStyle(fontSize: 16),
                  ),
                  height20,
                  const UserDetails(),
                  const UserDetails(),
                  height20,
                  CommonElevatedButton(
                    name: "Confirm",
                    buttonwidth: 0.25,
                    buttonheight: 0.06,
                    textStyle: const TextStyle(color: kwhite, fontSize: 12),
                    ontap: () {},
                  ),
                ],
              ),
            ),
            height20,
            CommonButton(
              onCancelPressed: () {},
              onSavePressed: () {},
            ),
            height20,
            Container(
              width: Get.width * 0.75,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: kblack.withOpacity(0.1),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Terms & Conditions",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  height10,
                  const Divider(
                    thickness: 1,
                    color: Color(0xffE5E5E5),
                  ),
                  height10,
                  if (listindex == 0)
                    _buildCondtionText("Facebook")
                  else if (listindex == 1)
                    _buildCondtionText("Twitter")
                  else if (listindex == 2)
                    _buildCondtionText("Google")
                  else if (listindex == 3)
                    _buildCondtionText("Linkedin"),
                  height10,
                  CheckboxListTile(
                    side: const BorderSide(color: kblack),
                    activeColor: Colors.transparent,
                    checkColor: const Color(0xff0066FF),
                    title: Text(
                      "I agree to the Meta’s Product Policy Terms",
                      style: TextStyle(
                        fontSize: 10,
                        color: kblack.withOpacity(0.7),
                      ),
                    ),
                    value: isChecked,
                    onChanged: (newValue) {
                      setState(() {
                        isChecked = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),
            ),
            height20,
            CommonElevatedButton(
              name: "Submit",
              buttonwidth: 0.25,
              buttonheight: 0.06,
              textStyle: const TextStyle(color: kwhite, fontSize: 12),
              ontap: () {},
            ),
            height30,
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildCondtionText(String socialname) {
    return Text(
      "You need to accept $socialname Catalogue\nTerms to setup Facebook Marketing",
      textAlign: TextAlign.center,
      maxLines: 2,
      style: TextStyle(
        fontSize: 12,
        color: kblack.withOpacity(0.5),
      ),
    );
  }
}

class SocialAccountContainer extends StatelessWidget {
  final String image;
  final String title;
  final String socialname;

  const SocialAccountContainer(
      {super.key,
      required this.image,
      required this.title,
      required this.socialname});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.75,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: kblack.withOpacity(0.1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                color: const Color(0xff5468BE),
                height: 30,
              ),
              kwidth15,
              Text(
                socialname,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          height10,
          const Divider(thickness: 1),
          height20,
          Text(
            "Connect your $title Account",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: kblack.withOpacity(0.5),
            ),
          ),
          height20,
          CommonElevatedButton(
            name: "Connect",
            buttonwidth: 0.25,
            buttonheight: 0.06,
            textStyle: const TextStyle(color: kwhite, fontSize: 12),
            ontap: () {},
          ),
          height10,
        ],
      ),
    );
  }
}

class ConnectDetailsPage extends StatelessWidget {
  final String title;
  final String socialname;

  const ConnectDetailsPage(
      {super.key, required this.title, required this.socialname});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.75,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: kblack.withOpacity(0.1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          height10,
          const Divider(
            thickness: 1,
            color: Color(0xffE5E5E5),
          ),
          height10,
          Text(
            "$socialname page will be used to publish ads",
            style: TextStyle(
              fontSize: 12,
              color: kblack.withOpacity(0.5),
            ),
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.only(left: 10),
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return const UserDetails();
              },
            ),
          )
        ],
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset("assets/images/fbconnect.png"),
          title: Text(
            "Explorust.ricoz.in",
            style: TextStyle(
              fontSize: 10,
              color: kblack.withOpacity(0.5),
            ),
          ),
          subtitle: Text(
            "102453423436464",
            style: TextStyle(
              fontSize: 10,
              color: kblack.withOpacity(0.5),
            ),
          ),
          trailing: TextButton(
            onPressed: () {},
            child: const Text(
              "Connect",
              style: TextStyle(
                fontSize: 10,
                color: Color(0xff1A377D),
              ),
            ),
          ),
        ),
        const Divider(indent: 20, thickness: 0.7),
      ],
    );
  }
}
