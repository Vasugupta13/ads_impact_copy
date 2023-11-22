import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/common_widget/overview_insights.dart';
import 'package:ads/src/features/common_widget/plan_snaplistview.dart';
import 'package:ads/src/features/common_widget/take_plan_bar.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'features/common_widget/plan_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showplandetails = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kwhite,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Add your logic here for when Item 1 is tapped
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Add your logic here for when Item 2 is tapped
              },
            ),
            // Add more ListTile widgets as needed
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
