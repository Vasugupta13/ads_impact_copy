import 'package:ads/src/features/common_widget/custom_app_bar.dart';
import 'package:ads/src/features/common_widget/elevatedbutton.dart';
import 'package:ads/src/features/menu/audience%20insights/audience_insights.dart';
import 'package:ads/src/features/menu/automations/view/ad_optimization.dart';
import 'package:ads/src/features/menu/catalog/widget/container_widget.dart';
import 'package:ads/src/homepage/social_account_list_widget.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
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
            const CatalogContainer(name: "Facebook Page access"),
            height20,
            const SocialAccountContainer(
                image: "assets/images/fb_logo.svg",
                title: "Facebook",
                socialname: "Connect your Facebook Account"),
            height20,
            const ConnectDetailsPage(title: "Facebook Page Settings"),
            height20,
            const ConnectDetailsPage(title: "Facebook AdPage Setting"),
            height20,
            const ConnectDetailsPage(title: "Facebook Catalog ID"),
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
                  Text(
                    "Facebook Ad Account Share Data",
                    style: TextStyle(
                      fontSize: 12,
                      color: kblack.withOpacity(0.5),
                    ),
                  ),
                  height20,
                  const Text(
                    "Preference",
                    style: TextStyle(fontSize: 16),
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
                  Text(
                    "You need to accept Facebook Catalogue\nTerms to setup Facebook Marketing",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12,
                      color: kblack.withOpacity(0.5),
                    ),
                  ),
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
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          height10,
          const Divider(thickness: 1),
          height20,
          Text(
            socialname,
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
  const ConnectDetailsPage({super.key, required this.title});

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
            "Facebook page will be used to publish ads",
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
