import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../src/model/social_media_info.dart';

class SocialMediaOverview extends StatefulWidget {
  final List<SocialMediaInfo> dataList;

  const SocialMediaOverview({Key? key, required this.dataList})
      : super(key: key);

  @override
  State<SocialMediaOverview> createState() => _SocialMediaOverviewState();
}

class _SocialMediaOverviewState extends State<SocialMediaOverview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: widget.dataList.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              height: 140,
              width: Get.width,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xff1A377D).withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.dataList[index].name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SvgPicture.asset(
                        widget.dataList[index].imageurl,
                        // ignore: deprecated_member_use
                        color: const Color(0xff5468BE),
                      )
                    ],
                  ),
                  height5,
                  Padding(
                    padding: const EdgeInsets.only(right: 36),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹${widget.dataList[index].amount}",
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_upward_sharp,
                            color: Color(0xff00CA39),
                            size: 20,
                          ),
                          label: Text(
                            widget.dataList[index].percentage,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xff00CA39),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height5,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "From Last 7 days : ${widget.dataList[index].daysamount}",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: kblack.withOpacity(0.67),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}