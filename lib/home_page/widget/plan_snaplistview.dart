import 'package:ads/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      "imagepath": "assets/images/amico.svg"
    },
    {
      "planname": "Advance Plan",
      "Desc": "Keep booking Liveasy to earn more.",
      "imagepath": "assets/images/pana.svg"
    },
    {
      "planname": "Premium Plan",
      "Desc": "Refer Liveasy To get Premium Account.",
      "imagepath": "assets/images/plan3.svg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 140,
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
      ],
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return SizedBox(
      width: 260,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Card(
          elevation: 0,
          color: const Color(0xff1A377D).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            takeplandeatails[index]["planname"],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          height5,
                          Text(
                            takeplandeatails[index]["Desc"],
                            maxLines: 3,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.3),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      takeplandeatails[index]["imagepath"],
                      fit: BoxFit.contain,
                      height: 80,
                    )
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
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
