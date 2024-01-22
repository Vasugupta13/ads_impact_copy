import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
      "Desc": "Torem ipsum dolor sit amet, consectetur adipiscing elit.",
      "imagepath": "assets/images/basic_plan.svg"
    },
    {
      "planname": "Advance Plan",
      "Desc": "Keep booking Liveasy to earn more.",
      "imagepath": "assets/images/advance_plan.svg"
    },
    {
      "planname": "Premium Plan",
      "Desc": "Refer Liveasy To get Premium Account.",
      "imagepath": "assets/images/premium_plan.svg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * 0.23,
          child: ScrollSnapList(
            itemBuilder: _buildListItem,
            duration: 100,
            scrollPhysics: const BouncingScrollPhysics(),
            itemCount: takeplandeatails.length,
            itemSize: 260,
            onItemFocus: (index) {},
            dynamicItemSize: true,
          ),
        ),
        divider16,
        height10,
      ],
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Column(
      children: [
        Container(
          width: Get.width * 0.6,
          decoration: BoxDecoration(
            color: kblue77D.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          height5,
                          Text(
                            takeplandeatails[index]["Desc"],
                            maxLines: 3,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(takeplandeatails[index]["imagepath"],
                        fit: BoxFit.contain, height: 80)
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View More",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
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
