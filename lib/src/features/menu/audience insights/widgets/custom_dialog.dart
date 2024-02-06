import 'dart:ui';
import 'package:ads/src/common/views/custom_elevatedbutton.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        backgroundColor: kwhite,
        surfaceTintColor: kwhite,
        shadowColor: kwhite,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          color: kwhite,
          height: screenHeight * containerheight,
          width: screenWidth * containerwidth,
          margin: const EdgeInsets.all(6),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: popupDetails.length,
                itemBuilder: (context, index) {
                  final detail = popupDetails[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              detail.icon,
                              size: 20,
                            ),
                            kwidth15,
                            Text(
                              detail.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                        height: 20,
                        indent: 14,
                      ),
                      height5,
                    ],
                  );
                },
              ),
              height10,
              CommonElevatedButton(
                  name: "Next",
                  buttonwidth: 0.4,
                  buttonheight: 0.05,
                  textStyle: elevatedtextstyle,
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
