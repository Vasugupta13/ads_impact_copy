import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/features/menu/audience%20insights/widgets/custom_audience.dart';
import 'package:ads/src/features/menu/audience%20insights/widgets/custom_checkbox.dart';
import 'package:ads/src/features/menu/audience%20insights/widgets/custom_table.dart';
import 'package:ads/src/features/menu/audience%20insights/widgets/custom_dialog.dart';
import 'package:ads/src/features/menu/catalog/widget/catalog_container.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudienceInsights extends StatefulWidget {
  const AudienceInsights({super.key});

  static const routerPath = '/AudienceInsights';

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBar(
                  name: "Audience Insights", imagepath: IconAssets.analysis),
              height20,
              SizedBox(
                width: screenWidth * 0.85,
                child: Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                      borderRadius: 10,
                      containerHeight: 45,
                      hinttext: "Search by name or audience ....",
                      hinTxtstyle: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: kblack.withOpacity(0.4),
                      ),
                      prefixIcon: Icon(CupertinoIcons.search,
                          color: kblack.withOpacity(0.4), size: 18),
                    )),
                    kwidth20,
                    CatalogContainer(
                        onTap: () {},
                        containerColor: kwhite,
                        isBorder: true,
                        textStyle: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                        containerHeight: 45,
                        containerWidth: screenWidth * 0.2,
                        name: "Filter",
                        image: IconAssets.filter)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1,
                    vertical: screenHeight * 0.03),
                child: Column(
                  children: [
                    CustomCheckbox(
                      mainAxisAlignment: MainAxisAlignment.start,
                      value: isAllChecked,
                      onchanged: (newvalue) {
                        setState(() {
                          isAllChecked = newvalue;
                        });
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildButton(
                        "Create Audience",
                        kred,
                        kwhite,
                        icon: const Icon(Icons.people_alt,
                            size: 16, color: kwhite),
                        5, () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            containerheight: 0.4,
                            containerwidth: 0.6,
                            popupDetails: popupdetails,
                            onnexttap: () async {
                              Navigator.pop(context);
                              // Get.back();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return CustomDialog(
                                    containerheight: 0.52,
                                    containerwidth: 0.6,
                                    popupDetails: popupdetails2,
                                    onnexttap: () async {
                                      Navigator.pop(context);
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
      ),
      bottomNavigationBar: const BottomNavBar(),
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
              style: TextStyle(
                  fontSize: 12, color: textColor, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ),
  );
}
