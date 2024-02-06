import 'package:ads/src/class/campaign_products.dart';
import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/common/views/customdropdown.dart';
import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/features/menu/campaign/campaign_dashboard.dart';
import 'package:ads/src/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/utils/const.dart';
import 'package:go_router/go_router.dart';

class CampaignCreate extends StatefulWidget {
  const CampaignCreate({super.key});
  static const routerPath = '/CampaingCreate';
  @override
  State<CampaignCreate> createState() => _CampaignCreateState();
}

class _CampaignCreateState extends State<CampaignCreate> {
  final List<String> createItems = ["example", "example 1", "example 2"];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBar(
                  name: "Create", imagepath: IconAssets.menucampaign),
              height10,
              CustomDropDown(
                  containerheight: 42,
                  containerwidth: screenWidth * 0.9,
                  dropdownItems: createItems,
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  hinticon: true,
                  hint: "Viewed but not purchased in last 1 day(s)"),
              height20,
              const CustomTextField(
                hinttext: 'Enter your Adtext',
              ),
              height25,
              const CustomTextField(
                  hinttext:
                      'Enter your description about that Ad. And this is also a good place to share COUPON codes. '),
              height20,
              divider161,
              height20,
              const Text("Preview",
                  style: TextStyle(

                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  )),
              height20,
              Container(
                height: screenHeight * 0.54,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: kblack.withOpacity(0.2)),
                ),
                margin: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    ListTile(
                      titleAlignment: ListTileTitleAlignment.threeLine,
                      leading: Image.asset(ImageAssets.danielhall),
                      title: const Text(
                        "Daniel Hall",
                        style: TextStyle(

                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            "Sponsored   •",
                            style: TextStyle(

                                fontSize: 8,
                                color: kblack.withOpacity(0.4)),
                          ),
                          kwidth5,
                          const Icon(
                            CupertinoIcons.globe,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                        color: kblack.withOpacity(0.2),
                        indent: 26,
                        endIndent: 0),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: CampaignProducts.products.length,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                      CampaignProducts.products[index]
                                          ["imageurl"],
                                      height: screenHeight * 0.3),
                                ),
                                height5,
                                Row(
                                  children: [
                                    Text(
                                      CampaignProducts.products[index]["price"],
                                      style: const TextStyle(

                                          fontSize: 8,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      CampaignProducts.products[index]["desc"],
                                      style: const TextStyle(

                                          fontSize: 8,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                height10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 20,
                                        width: screenWidth * 0.2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: kblack.withOpacity(0.1),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Add to Cart",
                                            style: TextStyle(

                                              fontWeight: FontWeight.w500,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    kwidth20,
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 20,
                                        width: screenWidth * 0.2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: const Color(0xffFF4949),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Buy Now",
                                            style: TextStyle(
                                              
                                              fontWeight: FontWeight.w500,
                                              color: kwhite,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              height30,
              CommonElevatedButton(
                  name: 'Create',
                  buttonwidth: 0.45,
                  textStyle: elevatedtextstyle,
                  ontap: () {
                    // context.push(CampaignDashboard.routerPath);
                    Get.to(() => const CampaignDashboard());
                  },
                  alternatecolor: kblue77D,
                  preifxicon: IconAssets.create),
              height30,
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
