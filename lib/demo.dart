import 'package:ads/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Demo extends StatefulWidget {
  final String titlename;
  final String subtitlename;
  final String imageUrl;
  final String accountname;

  const Demo({
    super.key,
    required this.titlename,
    required this.subtitlename,
    required this.imageUrl,
    required this.accountname,
  });

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final PageController _pageController = PageController(initialPage: 0);
  String? valuechoose;
  List listitem = [
    "Sharechat",
    "Instagram",
    "Yahoo",
    "Telegram",
    "Whatsapp",
    "Social",
    "Media"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: PageView(
            onPageChanged: (int page) {
              setState(() {});
            },
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              SizedBox(
                height: 200,
                width: Get.width,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 160,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: const Color(0xff1A377D).withOpacity(0.10),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            widget.titlename,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          height5,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Divider(
                              color: kblack.withOpacity(0.20),
                              thickness: 1,
                            ),
                          ),
                          height5,
                          Text(
                            widget.subtitlename,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: TextStyle(
                              color: kblack.withOpacity(0.60),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff1A377D),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  widget.imageUrl,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  widget.accountname,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: kwhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 200,
                width: Get.width,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 160,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: const Color(0xff1A377D).withOpacity(0.10),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Connect your Facebook Account",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          height5,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Divider(
                              color: kblack.withOpacity(0.20),
                              thickness: 1,
                            ),
                          ),
                          height20,
                          Container(
                            height: 36,
                            width: 260,
                            decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButton(
                              focusColor: Colors.red,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 23),
                              underline: Container(),
                              borderRadius: BorderRadius.circular(18),
                              value: valuechoose,
                              hint: Text(
                                "Choose your Ad Account",
                                style: TextStyle(
                                    color: kblack.withOpacity(0.4),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                              ),
                              alignment: Alignment.center,
                              dropdownColor: Colors.white,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: kblack.withOpacity(0.4),
                              ),
                              iconSize: 26,
                              isExpanded: true,
                              style: TextStyle(
                                  color: kblack.withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                              items: listitem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: valueItem == valuechoose
                                            ? const Color(0xffFF4848)
                                            : kblack),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    valuechoose = newValue as String?;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut);
                            },
                            child: Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xff1A377D),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    widget.imageUrl,
                                    fit: BoxFit.contain,
                                  ),
                                  const Text(
                                    "Connect",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: kwhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        height10,
        SmoothPageIndicator(
          controller: _pageController,
          count: 2,
          effect: const ExpandingDotsEffect(
            dotColor: Color(0xff1A377D),
            activeDotColor: Color(0xff1A377D),
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ],
    );
  }
}
