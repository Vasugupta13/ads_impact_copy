import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/homepage/plan_listview.dart';
import 'package:ads/src/homepage/take_plan_bar.dart';
import 'package:ads/src/features/menu/main_menu.dart';
import 'package:ads/src/homepage/basic_plan.dart';
import 'package:ads/src/homepage/overview_insights.dart';
import 'package:ads/src/res/global_basicuser.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showplandetails = false;
  bool isLoading = true;

  toggleVisibility() {
    setState(() {
      showplandetails = !showplandetails;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("basic plan $basicPlan");
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kwhite,
        shadowColor: kwhite,
        leading: IconButton(
          onPressed: () {
            _showPopupMenu(context);
          },
          icon: const Icon(CupertinoIcons.line_horizontal_3,
              color: kblack, size: 28),
        ),
        title: Column(
          children: [
            height10,
            SvgPicture.asset("assets/images/homescreen_logo.svg",
                height: Get.height * 0.05 + 5, fit: BoxFit.contain),
          ],
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
              child: Icon(Icons.notifications, color: kblack, size: 22),
            ),
          ),
          kwidth20,
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            height20,
            divider16,
            basicPlan == true
                ? const BasicPlan()
                : TakePlanBar(
                    toggle: () => toggleVisibility(),
                    isvisible: showplandetails),
            height10,
            if (!showplandetails)
              Column(
                children: [
                  basicPlan == true ? const SizedBox() : const PlanList(),
                  height10,
                  const HomeDetailsPage(),
                  height10,
                ],
              )
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
      color: kwhite,
      shadowColor: kwhite,
      surfaceTintColor: kwhite,
      context: context,
      position: RelativeRect.fromLTRB(
        overlay.size.width / 8,
        overlay.size.height / 10,
        overlay.size.width / 8,
        overlay.size.height / 10,
      ),
      items: [
        const PopupMenuItem(
          padding: EdgeInsets.zero,
          child: MainMenuPopup(),
        ),
      ],
    );
  }
}
