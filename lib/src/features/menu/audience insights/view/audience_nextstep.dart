import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/common/views/customdropdown.dart';
import 'package:ads/src/features/menu/audience%20insights/widgets/slider.dart';
import 'package:ads/src/homepage/homepage.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

enum Event { purchase, otherevent }

Event? _value = Event.purchase;

String? selectedvalue;

class NextButtonView extends StatefulWidget {
  const NextButtonView({super.key});
  static const routerPath = '/NextButtonView';

  @override
  State<NextButtonView> createState() => _NextButtonViewState();
}

class _NextButtonViewState extends State<NextButtonView> {
  final List<String> audience = [""];

  int indexTop = 0;
  double valueBottom = 20;
  double progressvalue = 0.0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                  name: "Audience Insights", imagepath: IconAssets.analysis),
              height20,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Select your lookalike source",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    height20,
                    Row(
                      children: [
                        Text(
                          "Select an exisiting audience or data source",
                          style: TextStyle(
                            fontSize: 12,
                            color: kblack.withOpacity(0.5),
                          ),
                        ),
                        kwidth10,
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: kblack.withOpacity(0.5),
                        ),
                      ],
                    ),
                    Divider(
                      color: kblack.withOpacity(0.1),
                      endIndent: 30,
                    ),
                    height10,
                    CustomDropDown(
                        alternatecolor: const Color(0xffE3E3E3),
                        borderRadius: 6,
                        isBorderColor: Colors.transparent,
                        hint: "Create new source",
                        containerwidth: screenWidth * 0.45,
                        containerheight: 40,
                        hinttxtStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kblack.withOpacity(0.5),
                        ),
                        dropdownItems: audience),
                    height25,
                    const Text(
                      "Select an event with value",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    height10,
                    RadioListTile<Event>(
                      activeColor: kred,
                      title: const Text(
                        "Purchase (recommended)",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      value: Event.purchase,
                      groupValue: _value,
                      onChanged: (Event? value) {
                        setState(
                          () {
                            _value = value;
                          },
                        );
                      },
                    ),
                    RadioListTile<Event>(
                      activeColor: kred,
                      title: const Text(
                        "Other event with value",
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      value: Event.otherevent,
                      groupValue: _value,
                      onChanged: (Event? value) {
                        setState(
                          () {
                            _value = value;
                          },
                        );
                      },
                    ),
                    height10,
                    Container(
                      height: screenHeight * 0.62,
                      width: screenWidth,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: kblack.withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Frequency and recency of the selected event, that it contains values",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Divider(color: kblack.withOpacity(0.1)),
                          height15,
                          const Text(
                            "Highest Value Passed",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                          height10,
                          const Text(
                            "₹ 500.00",
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.w600),
                          ),
                          height10,
                          const Text(
                            "Lowest Value Passed",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          height10,
                          const Text(
                            "₹ 200.00",
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.w600),
                          ),
                          height10,
                          const Text(
                            "Unique Customers",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          height10,
                          const Text(
                            "678",
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.w600),
                          ),
                          height20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.star_sharp,
                                color: Color(0xff1ABA00),
                              ),
                              Expanded(
                                child: Text(
                                  "We’ve recieved 200 purchase events that contain value from your pixel in the last 60days!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: kblack.withOpacity(0.5)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    height20,
                    const Text(
                      "Select audience location",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    height20,
                    Row(
                      children: [
                        Text(
                          "Select an exisiting audience or data source",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: kblack.withOpacity(0.5),
                          ),
                        ),
                        kwidth10,
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: kblack.withOpacity(0.5),
                        )
                      ],
                    ),
                    Divider(
                      color: kblack.withOpacity(0.1),
                      endIndent: 30,
                    ),
                    height10,
                    const Text(
                      "Select audience size",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    height20,
                    CustomDropDown(
                        alternatecolor: const Color(0xffE3E3E3),
                        borderRadius: 6,
                        isBorderColor: Colors.transparent,
                        hint: "Number of lookalike audience",
                        containerwidth: screenWidth * 0.8,
                        containerheight: 40,
                        hinttxtStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kblack.withOpacity(0.5),
                        ),
                        dropdownItems: audience),
                    height10,
                    const SliderWithLabels(),
                  ],
                ),
              ),
              height10,
              CommonElevatedButton(
                name: "Create Now",
                buttonwidth: 0.4,
                buttonheight: 42,
                textStyle: elevatedtextstyle,
                ontap: () {},
              ),
              height10,
              CommonElevatedButton(
                name: 'Cancel',
                buttonwidth: 0.4,
                bordercolor: kblack.withOpacity(0.2),
                alternatecolor: kwhite,
                buttonheight: 42,
                textStyle: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500, color: kblack),
                ontap: () {
                  // context.push(HomePage.routerPath);
                },
              ),
              height30,
            ],
          ),
        ),
      ),
    );
  }
}
