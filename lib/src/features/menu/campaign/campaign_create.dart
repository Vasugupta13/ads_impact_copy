import 'package:ads/src/class/campaign_products.dart';
import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/menu/campaign/campaign_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/utils/const.dart';

class CampaignCreate extends StatefulWidget {
  const CampaignCreate({Key? key}) : super(key: key);
  static const routerPath = '/CampaingCreate';
  @override
  State<CampaignCreate> createState() => _CampaignCreateState();
}

class _CampaignCreateState extends State<CampaignCreate> {
  final List<String> createItems = ["example", "example 1", "example 2"];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(elevation: 0, toolbarHeight: 0),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
        child: Column(
          children: [
            const CustomAppBar(
                name: "Create", imagepath: "assets/images/campaign_create.svg"),
            height20,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            height5,
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: const Row(
                  children: [
                    Icon(Icons.visibility_outlined, size: 20, color: kdarkgrey),
                    kwidth10,
                    Expanded(
                      child: Text(
                        'Viewed but not purchased in last 1 day(s)',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          color: kdarkgrey,
                        ),
                      ),
                    ),
                  ],
                ),
                items: createItems
                    .map((String countryList) => DropdownMenuItem<String>(
                          value: countryList,
                          child: Text(
                            countryList,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: kblack.withOpacity(0.1), width: 1.5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  height: 50,
                  width: Get.width * 0.9,
                ),
                iconStyleData: const IconStyleData(
                  icon:
                      Icon(Icons.keyboard_arrow_down, color: kblack, size: 30),
                ),
                menuItemStyleData: const MenuItemStyleData(height: 40),
              ),
            ),
            height20,
             CustomTextForm(
                labelText: "Enter your Adtext", maxline: 1, verticalpad: 12),
            height25,
            const CustomTextForm(
              maxline: 3,
              labelText:
                  "Enter your description about that Ad. And this is also a good place to share COUPON codes.",
              verticalpad: 50,
            ),
            height20,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            height20,
            const Text("Preview",
                style: TextStyle(
                  fontSize: 18,
                )),
            height20,
            Container(
              height: Get.height * 0.54,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: kblack.withOpacity(0.2)),
              ),
              margin: const EdgeInsets.all(12),
              child: Column(
                children: [
                  ListTile(
                    titleAlignment: ListTileTitleAlignment.threeLine,
                    leading: Image.asset("assets/images/daniel.png"),
                    title: const Text(
                      "Daniel Hall",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "Sponsored   •",
                          style: TextStyle(
                              fontSize: 8, color: kblack.withOpacity(0.4)),
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
                      color: kblack.withOpacity(0.2), indent: 26, endIndent: 0),
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
                                child: Image.asset(CampaignProducts
                                    .products[index]["imageurl"]),
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
                                  Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: kblack.withOpacity(0.1),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                          fontSize: 8,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: const Color(0xffFF4949),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Buy Now",
                                        style: TextStyle(
                                          color: kwhite,
                                          fontSize: 8,
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
            SizedBox(
              width: Get.width * 0.4,
              height: 40,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1A377D),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Get.to(() => const CampaignDashboard());
                },
                icon: const Icon(Icons.volume_up_outlined, size: 16),
                label: const Text(
                  "Create",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            height50,
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class CustomTextForm extends StatelessWidget {
  final int maxline;
  final String labelText;
  final double verticalpad;
  const CustomTextForm({
    Key? key,
    required this.labelText,
    required this.verticalpad,
    required this.maxline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.7,
      child: TextFormField(
        maxLines: maxline,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: verticalpad, horizontal: 26),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.2), width: 1.3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xffFF4848), width: 1.3),
          ),
          labelText: labelText,
          alignLabelWithHint: true,
          hintStyle: TextStyle(
            fontSize: 12,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
