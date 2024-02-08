import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool? value;
  final String? name;
  final MainAxisAlignment mainAxisAlignment;
  final ValueChanged<bool?>? onchanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onchanged,
    this.name,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Container(
          height: 26,
          width: 26,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kblack.withOpacity(0.1)),
          ),
          child: Checkbox(
            side: BorderSide.none,
            activeColor: Colors.transparent,
            checkColor: Colors.black,
            value: value,
            onChanged: onchanged,
          ),
        ),
        kwidth10,
        if (name != null) ...[
          Text(
            name!,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ]
      ],
    );
  }
}
