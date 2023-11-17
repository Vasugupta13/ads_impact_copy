import 'package:ads/const.dart';
import 'package:flutter/material.dart';

class InsightsView extends StatefulWidget {
  const InsightsView({super.key});

  @override
  State<InsightsView> createState() => _InsightsViewState();
}

class _InsightsViewState extends State<InsightsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        child: Column(
          children: [Text("data")],
        ),
      ),
    );
  }
}
