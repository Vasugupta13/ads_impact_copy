import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/common_widget/overview_insights.dart';
import 'package:ads/src/features/common_widget/plan_snaplistview.dart';
import 'package:ads/src/features/common_widget/take_plan_bar.dart';
import 'package:ads/src/features/dashboard/dashboard_view.dart';
import 'package:ads/src/features/menu/menu.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'features/common_widget/plan_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showplandetails = false;
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
          onPressed: () {
            _showPopupMenu(context);
          },
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
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            height10,
            TakePlanBar(),
            height10,
            PlanList(),
            height20,
            Divider(
              endIndent: 18,
              indent: 18,
              thickness: 1.6,
            ),
            height10,
            HomeDetailsPage(),
            height10,
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        overlay.size.width / 8,
        overlay.size.height / 10,
        overlay.size.width / 8,
        overlay.size.height / 10,
      ),
      items: [
        const PopupMenuItem(
          child: PopupMenuView(),
        ),
      ],
      elevation: 8.0,
    );
  }
}
