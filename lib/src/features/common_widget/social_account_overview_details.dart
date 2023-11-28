import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../src/model/social_media_info.dart';

class SocialMediaOverview extends StatefulWidget {
  final List<SocialMediaInfo> dataList;
  final Axis scrollDirection;

  const SocialMediaOverview({
    Key? key,
    required this.dataList,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  @override
  State<SocialMediaOverview> createState() => _SocialMediaOverviewState();
}

class _SocialMediaOverviewState extends State<SocialMediaOverview> {
  @override
  Widget build(BuildContext context) {
    return widget.scrollDirection == Axis.vertical
        ? _buildVerticalList()
        : _buildHorizontalList();
  }

  Widget _buildVerticalList() {
    return Column(
      children: [
        ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: widget.dataList.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return _buildItem(index);
          },
        ),
      ],
    );
  }

  Widget _buildHorizontalList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          widget.dataList.length,
          (index) => _buildItem(index),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    return Container(
      height: 150,
      width: 260,
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SvgPicture.asset(
                widget.dataList[index].imageurl,
                // ignore: deprecated_member_use
                color: const Color(0xff5468BE),
              )
            ],
          ),
          if (widget.scrollDirection == Axis.horizontal)
            const Divider(
              color: Color(0xffFF0000),
              endIndent: 140,
              thickness: 0.5,
            ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
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
          const SizedBox(height: 5),
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
  }
}
