import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class PlanList extends StatefulWidget {
  const PlanList({super.key});

  @override
  State<PlanList> createState() => _PlanListState();
}

class _PlanListState extends State<PlanList> {
  List takeplandeatails = [
    {
      "planname": "Basic Plan",
      "Desc": "Torem ipsum dolor sit\namet, consectetur\nadipiscing elit.",
      "imagepath": "assets/images/homebasic.png"
    },
    {
      "planname": "Advance Plan",
      "Desc": "Keep booking Liveasy to earn more.",
      "imagepath": "assets/images/homeadvance.png"
    },
    {
      "planname": "Premium Plan",
      "Desc": "Refer Liveasy To get Premium Account.",
      "imagepath": "assets/images/homepremium.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: screenHeight * 0.2,
          child: ScrollSnapList(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            initialIndex: 1,
            itemBuilder: _buildListItem,
            duration: 100,
            itemCount: takeplandeatails.length,
            itemSize: screenWidth * 0.6,
            onItemFocus: (index) {},
            dynamicItemSize: true,
          ),
        ),
        height20,
        divider16,
        height10,
      ],
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: screenWidth * 0.6,
          decoration: BoxDecoration(
            color: kblue77D.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            takeplandeatails[index]["planname"],
                            style: const TextStyle(

                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          height10,
                          Text(
                            takeplandeatails[index]["Desc"],
                            maxLines: 3,
                            style: const TextStyle(

                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(takeplandeatails[index]["imagepath"],
                        height: screenHeight * 0.1, fit: BoxFit.contain)
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View More",
                    style: TextStyle(

                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: kblack),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
