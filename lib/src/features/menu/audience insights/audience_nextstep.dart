import 'package:ads/src/features/common_widget/custom_app_bar.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Event { purchase, otherevent }

Event? _value = Event.purchase;

String? selectedvalue;

class NextButtonView extends StatefulWidget {
  const NextButtonView({super.key});

  @override
  State<NextButtonView> createState() => _NextButtonViewState();
}

class _NextButtonViewState extends State<NextButtonView> {
  int indexTop = 0;
  double valueBottom = 20;
  double progressvalue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 42),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
                name: "Audience Insights",
                imagepath: "assets/images/campaign_analysis.svg"),
            height20,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            height5,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select your lookalike source",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                  Container(
                    height: 40,
                    width: Get.width * 0.5,
                    decoration: BoxDecoration(
                      color: const Color(0xffE3E3E3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Create New Source",
                          style: TextStyle(
                            fontSize: 12,
                            color: kblack.withOpacity(0.5),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: kblack.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  height25,
                  const Text(
                    "Select an event with value",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  height10,
                  RadioListTile<Event>(
                    activeColor: const Color(0xffFF4848),
                    title: const Text(
                      "Purchase (recommended)",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                      ),
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
                    activeColor: const Color(0xffFF4848),
                    title: const Text(
                      "Other event with value",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                      ),
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
                ],
              ),
            ),
            height10,
            Container(
              height: Get.height * 0.62,
              width: Get.width,
              margin: const EdgeInsets.all(16),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Divider(
                    color: kblack.withOpacity(0.1),
                  ),
                  height15,
                  const Text(
                    "Highest Value Passed",
                    style: TextStyle(fontSize: 14),
                  ),
                  height10,
                  const Text(
                    "₹ 500.00",
                    style: TextStyle(fontSize: 36),
                  ),
                  height10,
                  const Text(
                    "Lowest Value Passed",
                    style: TextStyle(fontSize: 14),
                  ),
                  height10,
                  const Text(
                    "₹ 200.00",
                    style: TextStyle(fontSize: 36),
                  ),
                  height10,
                  const Text(
                    "Unique Customers",
                    style: TextStyle(fontSize: 14),
                  ),
                  height10,
                  const Text(
                    "678",
                    style: TextStyle(fontSize: 36),
                  ),
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
                              fontSize: 12, color: kblack.withOpacity(0.5)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select audience location",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  height20,
                  Container(
                    height: 40,
                    width: Get.width * 0.7,
                    decoration: BoxDecoration(
                      color: const Color(0xffE3E3E3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Number of lookalike audience",
                          style: TextStyle(
                            fontSize: 12,
                            color: kblack.withOpacity(0.5),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: kblack.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  height10,

                  // SizedBox(
                  //   height: Get.height * 0.7,
                  //   child: RotatedBox(
                  //     quarterTurns: 1,
                  //     child: Slider(
                  //       value: progressvalue,
                  //       min: 0.0,
                  //       max: 10.0,
                  //       thumbColor: kwhite,
                  //       onChanged: (value) {
                  //         setState(
                  //           () {
                  //             progressvalue = value;
                  //           },
                  //         );
                  //       },
                  //       divisions: 10,
                  //       label: progressvalue.toStringAsFixed(2),
                  //       activeColor: const Color(0xffFF4848),
                  //       inactiveColor: Colors.black.withOpacity(0.5),
                  //       onChangeStart: (value) {},
                  //       onChangeEnd: (value) {},
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSliderSideLabel() {
    const double min = 20;
    const double max = 80;
    const divisions = 4;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          buildSideLabel(min),
          Expanded(
            child: Slider(
              value: valueBottom,
              min: min,
              max: max,
              divisions: divisions,
              label: valueBottom.round().toString(),
              onChanged: (value) => setState(() => valueBottom = value),
            ),
          ),
          buildSideLabel(max),
        ],
      ),
    );
  }

  Widget buildSliderTopLabel() {
    final labels = ['0', '18', '30', '50', '+'];
    const double min = 0;
    final double max = labels.length - 1.0;
    final divisions = labels.length - 1;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Utils.modelBuilder(
              labels,
              (index, label) {
                const selectedColor = Colors.black;
                final unselectedColor = Colors.black.withOpacity(0.3);
                final isSelected = index <= indexTop;
                final color = isSelected ? selectedColor : unselectedColor;

                return buildLabel(label: label, color: color, width: 30);
              },
            ),
          ),
        ),
        Slider(
          value: indexTop.toDouble(),
          min: min,
          max: max,
          divisions: divisions,
          // label: labels[indexTop],
          onChanged: (value) => setState(() => indexTop = value.toInt()),
        ),
      ],
    );
  }

  Widget buildLabel({
    required String label,
    required double width,
    required Color color,
  }) =>
      SizedBox(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );

  Widget buildSideLabel(double value) => SizedBox(
        width: 25,
        child: Text(
          value.round().toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
}

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}
