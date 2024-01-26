import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/homepage/insights_graph.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsightView extends StatefulWidget {
  final int value;
  const InsightView({super.key, required this.value});

  @override
  State<InsightView> createState() => _InsightViewState();
}

class _InsightViewState extends State<InsightView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height20,
        CommonElevatedButton(
          name: "Impressions",
          buttonwidth: 0.7,
          textStyle: elevatedtextstyle,
          ontap: () {},
        ),
        height20,
        // Stack(   //! for future use (for adding the graph intit)
        //   children: [
        //     Container(
        //       height: 210,
        //       width: Get.width,
        //       margin: const EdgeInsets.all(10),
        //       decoration: BoxDecoration(
        //         boxShadow: [
        //           BoxShadow(
        //             blurRadius: 4,
        //             color: kblack.withOpacity(0.25),
        //             offset: const Offset(0, 4),
        //           ),
        //         ],
        //         color: kwhite,
        //         borderRadius: const BorderRadius.only(
        //           bottomRight: Radius.circular(12),
        //           bottomLeft: Radius.circular(12),
        //           topRight: Radius.circular(12),
        //         ),
        //       ),
        //     ),
        //     Positioned(
        //       top: 10,
        //       left: (Get.width - 76) / 2,
        //       child: GestureDetector(
        //         child: Container(
        //           height: 40,
        //           width: 76,
        //           decoration: const BoxDecoration(
        //             color: Color(0xffE8EBF2),
        //             borderRadius: BorderRadius.only(
        //               bottomLeft: Radius.circular(14),
        //               bottomRight: Radius.circular(14),
        //             ),
        //           ),
        //           child: const Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Icon(Icons.keyboard_arrow_up),
        //               Text(
        //                 "View More",
        //                 style: TextStyle(
        //                     fontSize: 10, ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        const CommonGraph(
          imagepath: "assets/images/GraphComponent.svg",
        ),
        height20,
        CommonElevatedButton(
          name: "Spend",
          buttonwidth: 0.7,
          textStyle: elevatedtextstyle,
          ontap: () {},
        ),
        height20,
        const CommonGraph(imagepath: "assets/images/GraphComponent.svg"),
        height20,
        CommonElevatedButton(
          name: "Cost Per 1000 Impression (CPM)",
          buttonwidth: 0.7,
          textStyle: elevatedtextstyle,
          ontap: () {},
        ),
        height20,
        const CommonGraph(imagepath: "assets/images/Graph_Component2.svg"),
        height20,
        CommonElevatedButton(
          name: "Link Clicks",
          buttonwidth: 0.7,
          textStyle: elevatedtextstyle,
          ontap: () {},
        ),
        height20,
        const CommonGraph(imagepath: "assets/images/GraphComponent.svg"),
      ],
    );
  }
}
