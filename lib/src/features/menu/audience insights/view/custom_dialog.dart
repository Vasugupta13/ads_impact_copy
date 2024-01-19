import 'dart:ui';

import 'package:ads/src/features/common_widget/custom_elevatedbutton.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final List<dynamic> popupDetails;
  final VoidCallback onnexttap;
  final double containerheight;
  final double containerwidth;

  const CustomDialog({
    super.key,
    required this.popupDetails,
    required this.onnexttap,
    required this.containerheight,
    required this.containerwidth,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          height: Get.height * containerheight,
          width: Get.width * containerwidth,
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              ListView.builder(
                padding: const EdgeInsets.all(12),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: popupDetails.length,
                itemBuilder: (context, index) {
                  final detail = popupDetails[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            detail.icon,
                            size: 20,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            detail.name,
                            style: const TextStyle(
                              fontSize: 16,

                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Divider(color: Colors.black.withOpacity(0.1)),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              CommonElevatedButton(
                  name: "Next",
                  buttonwidth: 0.22,
                  buttonheight: 0.05,
                  textStyle: const TextStyle(
                      fontSize: 12,  color: kwhite),
                  ontap: onnexttap)
            ],
          ),
        ),
      ),
    );
  }
}

class PopupDetail {
  final String name;
  final IconData icon;

  PopupDetail({
    required this.name,
    required this.icon,
  });
}

class PopupDetails2 {
  final String name;
  final IconData icon;

  PopupDetails2({
    required this.name,
    required this.icon,
  });
}
