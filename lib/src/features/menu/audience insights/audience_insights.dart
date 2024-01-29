import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/homepage/customapp_bar.dart';
import 'package:ads/src/features/menu/audience%20insights/view/custom_audience.dart';
import 'package:ads/src/features/menu/audience%20insights/view/custom_dialog.dart';
import 'package:ads/src/features/menu/audience%20insights/view/custom_table.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AudienceInsights extends StatefulWidget {
  const AudienceInsights({super.key});

  @override
  State<AudienceInsights> createState() => _AudienceInsightsState();
}

class _AudienceInsightsState extends State<AudienceInsights> {
  bool? isAllChecked = false;
  bool? isExpiringChecked = true;
  List<MyTableRowData> tableData = [
    MyTableRowData(name: 'saichittala portfolio', status: 'Ready'),
    MyTableRowData(name: 'ricoz - website', status: 'Ready'),
    MyTableRowData(name: 'makeuphub Website', status: 'Ready'),
    MyTableRowData(name: 'ricoz Website', status: 'Ready'),
    MyTableRowData(name: 'ricoz Website', status: 'Ready'),
    MyTableRowData(name: 'ricoz Website', status: 'Ready'),
    MyTableRowData(name: 'ricoz Website', status: 'Ready'),
    MyTableRowData(name: 'ricoz Website', status: 'Expiring Soon'),
  ];
  List<PopupDetail> popupdetails = [
    PopupDetail(name: "Create Audience", icon: Icons.people_alt_rounded),
    PopupDetail(name: "Custom Audience", icon: Icons.grid_view_rounded),
    PopupDetail(name: "Lookalike Audience", icon: Icons.people),
    PopupDetail(name: "Saved Audience", icon: Icons.note),
  ];

  List<PopupDetails2> popupdetails2 = [
    PopupDetails2(name: "Custom Audience", icon: Icons.grid_view_rounded),
    PopupDetails2(name: "Website", icon: CupertinoIcons.globe),
    PopupDetails2(name: "Customer List", icon: CupertinoIcons.person_alt),
    PopupDetails2(
        name: "App Activity", icon: CupertinoIcons.rectangle_grid_1x2),
    PopupDetails2(name: "Offline Activity", icon: Icons.cloud_off_outlined),
    PopupDetails2(name: "Catalouge", icon: CupertinoIcons.square_on_square)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 42),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CustomAppBar(
                name: "Audience Insights",
                imagepath: "assets/images/campaign_analysis.svg"),
            height20,
            Divider(color: kblack.withOpacity(0.1), endIndent: 0, indent: 26),
            height5,
            Padding(
              padding: const EdgeInsets.only(right: 32, left: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                          color: kblack.withOpacity(0.4),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 26),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.1), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.1), width: 1),
                        ),
                        labelText: "Search by name or audience ....",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                  kwidth20,
                  Container(
                    width: 100,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kwhite,
                      border: Border.all(
                        color: kblack.withOpacity(0.1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/filter_icon.svg"),
                        kwidth10,
                        const Text(
                          "Filter",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                children: [
                  CustomCheckbox(
                    mainAxisAlignment: MainAxisAlignment.start,
                    value: isAllChecked,
                    onchanged: (newvalue) {
                      isAllChecked = newvalue;
                    },
                    name: "All Audience",
                  ),
                  height15,
                  CustomCheckbox(
                    mainAxisAlignment: MainAxisAlignment.start,
                    value: isExpiringChecked,
                    onchanged: (newbool) {
                      setState(() {
                        isExpiringChecked = newbool;
                      });
                    },
                    name: "Expiring Soon",
                  )
                ],
              ),
            ),
            const MyTableWidget(),
            height20,
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  _buildButton(
                      "Create Audience",
                      const Color(0xffFF4848),
                      kwhite,
                      icon:
                          const Icon(Icons.people_alt, size: 16, color: kwhite),
                      5, () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          containerheight: 0.40,
                          containerwidth: 0.70,
                          popupDetails: popupdetails,
                          onnexttap: () async {
                            Get.back();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                  containerheight: 0.52,
                                  containerwidth: 0.70,
                                  popupDetails: popupdetails2,
                                  onnexttap: () async {
                                    Get.back();
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const CustomAudience();
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  }, Colors.transparent),
                  kwidth10,
                  _buildButton("Edit", kwhite, kblack, 3, () {},
                      const Color(0xffE5E5E5)),
                  kwidth10,
                  _buildButton("Cancel", kwhite, kblack, 3, () {},
                      const Color(0xffE5E5E5)),
                ],
              ),
            ),
            height30,
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool? value;
  final String? name;
  final MainAxisAlignment mainAxisAlignment;

  final ValueChanged<bool?>? onchanged;
  const CustomCheckbox(
      {super.key,
      required this.value,
      required this.onchanged,
      this.name,
      this.mainAxisAlignment = MainAxisAlignment.center});

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
            border: Border.all(color: kblack),
          ),
          child: Checkbox(
              side: BorderSide.none,
              activeColor: Colors.transparent,
              checkColor: Colors.black,
              value: value,
              onChanged: onchanged),
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

Widget _buildButton(String name, Color bgColor, Color textColor, int flex,
    VoidCallback onTap, Color? bdcolor,
    {Icon? icon}) {
  return Expanded(
    flex: flex,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: bdcolor!,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon, kwidth5],
            Text(
              name,
              style: TextStyle(fontSize: 12, color: textColor),
            ),
          ],
        ),
      ),
    ),
  );
}
