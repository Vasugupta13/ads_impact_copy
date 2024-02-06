// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/menu/audience%20insights/view/audience_nextstep.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:go_router/go_router.dart';

class AudiencePopup extends StatefulWidget {
  const AudiencePopup({super.key});

  @override
  State<AudiencePopup> createState() => _AudiencePopupState();
}

class _AudiencePopupState extends State<AudiencePopup> {
  int tappedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      shadowColor: kwhite,
      backgroundColor: kwhite,
      surfaceTintColor: kwhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: screenHeight * 0.65,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageAssets.audienceSucces),
            height10,
            Divider(color: kblack.withOpacity(0.1), indent: 10, endIndent: 10),
            height10,
            const Text(
              "Your Custom Audience Created Successfully",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            height10,
            Divider(color: kblack.withOpacity(0.1), indent: 10, endIndent: 10),
            height10,
            const Text(
              "As a next steps you need to\nclick the below button",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            height20,
            CommonElevatedButton(
              name: "Next Step",
              buttonwidth: 0.4,
              buttonheight: 0.05,
              textStyle: elevatedtextstyle,
              ontap: () async {
                Get.back();
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shadowColor: kwhite,
                      backgroundColor: kwhite,
                      surfaceTintColor: kwhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        color: kwhite,
                        height: screenHeight * 0.72,
                        width: screenWidth,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Next Steps",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 24),
                            ),
                            height10,
                            Divider(
                              color: kblack.withOpacity(0.1),
                            ),
                            height10,
                            NXTContainer(
                                isSelected: tappedIndex == 0,
                                // onTap: () {
                                //   setState(() {
                                //     tappedIndex = 0;
                                //   });
                                // },
                                title: "Create a Lookalike Audience",
                                icon: CupertinoIcons.person_3,
                                subtitle:
                                    "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."),
                            height20,
                            NXTContainer(
                                isSelected: tappedIndex == 1,
                                // onTap: () {
                                //   setState(() {
                                //     tappedIndex = 1;
                                //   });
                                // },
                                icon: CupertinoIcons.person_2_fill,
                                title: "Create another Audience",
                                subtitle:
                                    "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."),
                            height20,
                            CommonElevatedButton(
                              name: "Create",
                              buttonwidth: 0.4,
                              buttonheight: 42,
                              textStyle: elevatedtextstyle,
                              ontap: () {
                                // context.push(NextButtonView.routerPath);
                                Get.to(() => const NextButtonView());
                              },
                            ),
                            height10,
                            CommonElevatedButton(
                              name: 'Not Now',
                              buttonwidth: 0.4,
                              bordercolor: kblack.withOpacity(0.2),
                              alternatecolor: kwhite,
                              buttonheight: 42,
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: kblack),
                              ontap: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NXTContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;

  const NXTContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                isSelected ? const Color(0xff1A377D) : const Color(0xffE5E5E5),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xff1A377D).withOpacity(0.1),
                  ),
                  child: Icon(icon, size: 18, color: kblack),
                ),
                kwidth15,
                Text(
                  title,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
            height10,
            Divider(
              color: kblack.withOpacity(0.1),
            ),
            height5,
            Text(
              subtitle,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
