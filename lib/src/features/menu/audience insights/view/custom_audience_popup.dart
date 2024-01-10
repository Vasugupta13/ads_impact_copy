import 'package:ads/src/features/common_widget/elevatedbutton.dart';
import 'package:ads/src/features/menu/audience%20insights/audience_nextstep.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AudiencePopup extends StatefulWidget {
  const AudiencePopup({super.key});

  @override
  State<AudiencePopup> createState() => _AudiencePopupState();
}

class _AudiencePopupState extends State<AudiencePopup> {
  int tappedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: Get.height * 0.62,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/bubbles.svg"),
            height10,
            Divider(
              color: kblack.withOpacity(0.1),
            ),
            height10,
            const Text(
              "Your Custom Audience Created Successfully",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            height10,
            Divider(
              color: kblack.withOpacity(0.1),
            ),
            height10,
            const Text(
              "As a next steps you need to\nclick the below button",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            height20,
            CommonElevatedButton(
              name: "Next Step",
              buttonwidth: 0.22,
              buttonheight: 0.05,
              textStyle: const TextStyle(fontSize: 12, color: kwhite),
              ontap: () async {
                Get.back();
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Container(
                        height: Get.height * 0.75,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Next Steps",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            height10,
                            Divider(
                              color: kblack.withOpacity(0.1),
                            ),
                            height10,
                            const NXTContainer(
                                title: "Create a Lookalike Audience",
                                icon: CupertinoIcons.person_3,
                                subtitle:
                                    "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."),
                            height20,
                            const NXTContainer(
                                icon: CupertinoIcons.person_2_fill,
                                title: "Create another Audience",
                                subtitle:
                                    "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."),
                            height20,
                            CommonElevatedButton(
                              name: "Create",
                              buttonwidth: 0.22,
                              buttonheight: 0.05,
                              textStyle:
                                  const TextStyle(fontSize: 12, color: kwhite),
                              ontap: () {
                                Get.to(() => const NextButtonView());
                              },
                            ),
                            height10,
                            CommonElevatedButton(
                              name: "Not Now",
                              buttonwidth: 0.22,
                              buttonheight: 0.05,
                              textStyle:
                                  const TextStyle(fontSize: 12, color: kblack),
                              ontap: () {},
                              alternatecolor: kwhite,
                              bordercolor: kblack.withOpacity(0.2),
                            ),
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

class NXTContainer extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const NXTContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  State<NXTContainer> createState() => _NXTContainerState();
}

class _NXTContainerState extends State<NXTContainer> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: Get.height * 0.20,
        width: Get.width,
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
                  child: Icon(widget.icon, size: 18),
                ),
                kwidth15,
                Text(
                  widget.title,
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
              widget.subtitle,
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
