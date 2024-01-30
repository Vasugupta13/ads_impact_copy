import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../model/social_media_info.dart';

class SocialMediaOverview extends StatefulWidget {
  final List<SocialMediaInfo> dataList;
  final Axis scrollDirection;

  const SocialMediaOverview({
    super.key,
    required this.dataList,
    this.scrollDirection = Axis.vertical,
  });

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: widget.scrollDirection == Axis.vertical
          ? screenHeight * 0.2 - 15
          : screenHeight * 0.2 - 15,
      width: widget.scrollDirection == Axis.vertical
          ? screenWidth * 0.9
          : screenWidth * 0.6,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffEAEDF7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.dataList[index].name,
                style: widget.scrollDirection == Axis.horizontal
                    ? const TextStyle(
                        fontFamily: FontAssets.Poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 14)
                    : const TextStyle(
                        fontFamily: FontAssets.Poppins,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
              ),
              SvgPicture.asset(widget.dataList[index].imageurl,
                  color: widget.scrollDirection == Axis.horizontal
                      ? kblue77D
                      : const Color(0xff5468BE))
            ],
          ),
          if (widget.scrollDirection == Axis.horizontal)
            Align(
              alignment: Alignment.centerLeft,
              heightFactor: 10,
              child: Container(
                  height: 1, width: screenWidth * 0.2 - 10, color: kred),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "₹${widget.dataList[index].amount}",
                style: widget.scrollDirection == Axis.horizontal
                    ? const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: FontAssets.Poppins)
                    : const TextStyle(
                        fontFamily: FontAssets.Poppins,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
              ),
              widget.scrollDirection == Axis.horizontal
                  ? const SizedBox()
                  : const Spacer(),
              Expanded(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_upward_sharp,
                    color: kgreen,
                    size: 20,
                  ),
                  label: Text(
                    widget.dataList[index].percentage,
                    style: const TextStyle(
                        fontSize: 11,
                        fontFamily: FontAssets.Poppins,
                        color: kgreen,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          height5,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "From Last 7 days : ${widget.dataList[index].daysamount}",
              style: TextStyle(
                fontSize: 6,
                fontFamily: FontAssets.Poppins,
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
