import 'package:ads/src/utils/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CatalogContainer extends StatefulWidget {
  final String name;
  final IconData iconname;
  const CatalogContainer(
      {super.key, required this.name, required this.iconname});

  @override
  State<CatalogContainer> createState() => _CatalogContainerState();
}

class _CatalogContainerState extends State<CatalogContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.07,
      width: Get.width * 0.75,
      decoration: BoxDecoration(
        color: const Color(0xff1A377D),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.iconname,
            color: kwhite,
          ),
          kwidth15,
          Text(
            widget.name,
            style: const TextStyle(
                fontSize: 14,  color: kwhite),
          )
        ],
      ),
    );
  }
}
