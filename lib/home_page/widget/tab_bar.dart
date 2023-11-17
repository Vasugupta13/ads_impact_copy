import 'package:ads/const.dart';
import 'package:ads/home_page/widget/view/insights.dart';
import 'package:ads/home_page/widget/view/overview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageTabBar extends StatefulWidget {
  const HomePageTabBar({super.key});

  @override
  State<HomePageTabBar> createState() => _HomePageTabBarState();
}

class _HomePageTabBarState extends State<HomePageTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              unselectedLabelColor: kblack,
              labelColor: kwhite,
              controller: _tabController,
              indicatorColor: const Color(0xff1A377D),
              indicator: BoxDecoration(
                color: const Color(0xff1A377D),
                borderRadius: BorderRadius.circular(16),
              ),
              tabs: const [
                Tab(
                  text: "Overview",
                ),
                Tab(
                  text: "Insights",
                ),
              ],
            ),
          ),
          height20,
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                OverViewPage(),
                InsightsView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
