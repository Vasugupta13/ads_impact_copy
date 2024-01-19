import 'package:ads/src/features/bottombar/view/add_new_card.dart';
import 'package:ads/src/features/common_widget/custom_app_bar.dart';
import 'package:ads/src/features/common_widget/custom_elevatedbutton.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
                  name: "Payment", imagepath: "assets/images/payment.svg"),
              Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
              const PaymentList(
                  image: "assets/images/paypal.svg", title: "Paypal"),
              const PaymentList(
                  image: "assets/images/upi.svg", title: "Phonepe/Gpay"),
              const PaymentList(
                  image: "assets/images/mastercard.svg",
                  title: "... ... ... 4356"),
              const PaymentList(
                  image: "assets/images/visa.svg", title: "... ... ... 5347"),
              height20,
              CommonElevatedButton(
                name: "Add new Card",
                buttonwidth: 0.25,
                buttonheight: 0.06,
                textStyle: const TextStyle(fontSize: 12),
                ontap: () {
                  Get.to(() => const AddCard());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: Get.width * 0.3,
                      child: const Divider(
                        color: Color(0xffFF4848),
                        thickness: 1,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      "assets/images/payment_image.svg",
                      height: Get.height * 0.19,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentList extends StatelessWidget {
  final String image;
  final String title;

  const PaymentList({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xff1A377D).withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            // radius: 20,
            backgroundColor: const Color(0xff1A377D),
            child: SvgPicture.asset(image),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
          trailing: Container(
            height: 25,
            width: Get.width * 0.16,
            decoration: BoxDecoration(
              color: const Color(0xff1A377D),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Center(
              child: Text(
                "Select",
                style: TextStyle(color: kwhite, fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
