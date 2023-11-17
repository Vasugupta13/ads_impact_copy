import 'package:ads/const.dart';
import 'package:ads/home_page/widget/plan_snaplistview.dart';
import 'package:ads/home_page/bottombar/bottomnavigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'widget/tab_bar.dart';
import 'widget/take_plan_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.line_horizontal_3,
            color: kblack,
            size: 28,
          ),
        ),
        title: SvgPicture.asset(
          "assets/images/Group5.svg",
          fit: BoxFit.contain,
        ),
        actions: [
          Container(
            height: 34,
            width: 34,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffD9D9D9),
            ),
            child: const Center(
              child: Icon(
                Icons.notifications,
                color: kblack,
                size: 22,
              ),
            ),
          ),
          kwidth20,
        ],
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            TakePlanBar(),
            height10,
            PlanList(),
            height20,
            Divider(
              thickness: 1.6,
            ),
            height10,
            HomePageTabBar(),
          ],
        ),
      ),
      drawer: const Drawer(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
