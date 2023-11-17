import 'package:ads/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverViewPage extends StatefulWidget {
  const OverViewPage({super.key});

  @override
  State<OverViewPage> createState() => _OverViewPageState();
}

class _OverViewPageState extends State<OverViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: Column(
        children: [
          SizedBox(
            height: 40,
            width: Get.width,
          )
        ],
      ),
    );
  }
}
