import 'package:ads/src/features/common_widget/elevatedbutton.dart';
import 'package:ads/src/features/common_widget/insights_graph.dart';
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
    return widget.value == 0
        ? const Column(
            children: [
              height20,
              CommonElevatedButton(
                  name: "Impressions",textStyle:  TextStyle(
            fontWeight: FontWeight.w500,
            color: kwhite,
            fontSize: 14,
          ),buttonwidth: 0.40, buttonheight: 0.06),

              height10,
              // Stack(   //! for future use (for adding the graph intoit)
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
              //                     fontSize: 10, fontWeight: FontWeight.w500),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              CommonGraph(
                imagepath: "assets/images/GraphComponent.svg",
              ),
              height20,
              CommonElevatedButton(
                  name: "Spend", textStyle:  TextStyle(
            fontWeight: FontWeight.w500,
            color: kwhite,
            fontSize: 14,
          ),buttonwidth: 0.40, buttonheight: 0.06),
              height15,
              CommonGraph(imagepath: "assets/images/GraphComponent.svg"),
              height20,
              CommonElevatedButton(
                  name: "Cost Per 1000 Impression (CPM)",textStyle:  TextStyle(
            fontWeight: FontWeight.w500,
            color: kwhite,
            fontSize: 14,
          ),
                  buttonwidth: 0.40,
                  buttonheight: 0.06),
              height15,
              CommonGraph(imagepath: "assets/images/Graph_Component2.svg"),
              height20,
              CommonElevatedButton(
                  name: "Link Clicks",textStyle:  TextStyle(
            fontWeight: FontWeight.w500,
            color: kwhite,
            fontSize: 14,
          ), buttonwidth: 0.40, buttonheight: 0.06),
              height15,
              CommonGraph(imagepath: "assets/images/GraphComponent.svg"),
            ],
          )
        : const Text("Another Widget");
  }
}
