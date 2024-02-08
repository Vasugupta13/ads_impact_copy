import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

class SliderWithLabels extends StatefulWidget {
  const SliderWithLabels({super.key});

  @override
  _SliderWithLabelsState createState() => _SliderWithLabelsState();
}

class _SliderWithLabelsState extends State<SliderWithLabels> {
  double indexTop = 0;

  @override
  Widget build(BuildContext context) {
    return buildSliderTopLabel();
  }

  Widget buildSliderTopLabel() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final labels = [
      '0%',
      '1%',
      '2%',
      '3%',
      '4%',
      '5%',
      '6%',
      '7%',
      '8%',
      '9%',
      '10%'
    ];
    const double min = 0;
    final double max = labels.length - 1.0;
    final divisions = labels.length - 1;

    return RotatedBox(
      quarterTurns: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: Utils.modelBuilder(
                labels,
                (index, label) {
                  const selectedColor = Colors.black;
                  final unselectedColor = Colors.black.withOpacity(0.5);
                  final isSelected = index <= indexTop;
                  final color = isSelected ? selectedColor : unselectedColor;
                  return buildLabel(label: label, color: color, width: 35);
                },
              ),
            ),
          ),
          height10,
          SizedBox(
            width: screenWidth,
            child: Slider(
              activeColor: kred,
              thumbColor: kwhite,
              inactiveColor: kblack.withOpacity(0.5),
              value: indexTop,
              min: min,
              max: max,
              onChanged: (value) => setState(() => indexTop = value),
            ),
          ),
        ],
      ),
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
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ).copyWith(color: color),
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
