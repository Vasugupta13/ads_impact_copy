import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/bottombar/view/payment.dart';
import 'package:ads/src/homepage/customapp_bar.dart';
import 'package:ads/src/homepage/common_plan_container.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 42),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBar(
                name: "Cart", imagepath: "assets/images/cart.svg"),
            height20,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            Container(
              width: Get.width,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffE5E5E5)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonContainerPlanDetals(
                        containerwidth: Get.width * 0.35,
                        containerheight: Get.height * 0.25,
                        customfontsize: 6,
                        titlenamesize: 12,
                        titlewordsize: 12,
                        titlewordcolor: const Color(0xffFF0000),
                        imageurl: "assets/images/basic_plan_chart.svg",
                        titlename: "asic Plac",
                        titleletter: "B",
                      ),
                      const VerticalDivider(color: kblack),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Basic Plan AdsImpact -\n10 User Help with full\nsupport",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            height10,
                            Divider(
                              color: kdarkgrey.withOpacity(0.1),
                            ),
                            height10,
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "MRP - ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: kdarkgrey,
                                  ),
                                ),
                                Text(
                                  "₹ 14,000  ",
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: kdarkgrey,
                                  ),
                                ),
                                Text(
                                  "•   5 % OFF",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    color: kdarkgrey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Divider(
                              color: kdarkgrey.withOpacity(0.1),
                            ),
                            height10,
                            const Text(
                              "₹ 10,150/-",
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Color(0xffFF0000),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  height10,
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildOption("View Other Plans",
                          iconPath: "assets/images/book.svg"),
                      const VerticalDivider(),
                      buildOption(
                        "Remove",
                        iconPath: "assets/images/trash.svg",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            height10,
            const Divider(),
            const Text(
              "Order Payment Details",
              style: TextStyle(fontSize: 18),
            ),
            height15,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  buildOption("Order Amount",
                      fontwght: FontWeight.w400, amount: "₹ 14,000.00"),
                  height5,
                  buildOption(
                    "Order Saving",
                    fontwght: FontWeight.w400,
                    amount: "₹ 3850.00",
                    txtcolor: const Color(0xff55BC7C),
                  ),
                  height5,
                  buildOption("Order Total",
                      fontwght: FontWeight.w700,
                      amount: "₹ 10,150.00",
                      fontwght2: FontWeight.w700),
                  height5,
                ],
              ),
            ),
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            const Text(
              "Promocode",
              style: TextStyle(fontSize: 20),
            ),
            height10,
            SizedBox(
              height: 45,
              width: Get.width * 0.7,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: kblack.withOpacity(0.2),
                    ),
                  ),
                  labelText: "Enter your Promocode",
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: kblack.withOpacity(0.2),
                  ),
                  alignLabelWithHint: true,
                  contentPadding: const EdgeInsets.only(left: 26, top: 5),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Apply",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            height15,
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: CommonElevatedButton(
                      name: "View other Plans",
                      buttonwidth: 0.5,
                      buttonheight: 0.06,
                      textStyle: const TextStyle(fontSize: 12, color: kblack),
                      ontap: () {},
                      alternatecolor: kwhite,
                      bordercolor: kblack.withOpacity(0.1),
                    ),
                  ),
                  kwidth20,
                  Expanded(
                    child: CommonElevatedButton(
                      name: "Buy Now",
                      buttonwidth: 0.5,
                      buttonheight: 0.06,
                      textStyle: const TextStyle(fontSize: 12),
                      ontap: () {
                        Get.to(() => const Payment());
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget buildOption(String text,
      {String? iconPath,
      String? amount,
      Color? txtcolor,
      FontWeight? fontwght,
      FontWeight? fontwght2}) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: (text != null || amount != null)
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          if (iconPath != null) ...[SvgPicture.asset(iconPath), kwidth10],
          Text(
            text,
            style: TextStyle(
                fontSize: 12,
                color: txtcolor ?? Colors.black,
                fontWeight: fontwght ?? FontWeight.w500),
          ),
          if (amount != null) ...[
            Text(
              amount,
              style: TextStyle(
                  fontSize: 12,
                  color: txtcolor ?? Colors.black,
                  fontWeight: fontwght2 ?? FontWeight.w500),
            ),
          ],
        ],
      ),
    );
  }
}
