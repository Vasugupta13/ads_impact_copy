import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TryOurPacks extends StatelessWidget {
  const TryOurPacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: PacksUI(
            "Basic Pack",
            "assets/images/basicpack.png",
            () {
              print("Basic Pack");
            },
          )),
          kwidth10,
          Expanded(
              child: PacksUI(
            "Pro Pack",
            "assets/images/propack.png",
            () {
              print("Pro Pack");
            },
          )),
          kwidth10,
          Expanded(
              child: PacksUI(
            "Advance Pack",
            "assets/images/advancepack.png",
            () {
              print("Advance Pack");
            },
          )),
        ],
      ),
    );
  }
}

class PacksUI extends StatelessWidget {
  final String name;
  final String imagePath;
  final VoidCallback onTap;

  const PacksUI(this.name, this.imagePath, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: Get.height * 0.15,
          color: kwhite,
          child: Stack(
            children: [
              Container(
                height: Get.height * 0.15 - 10,
                // width: Get.width,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                        color: kblack.withOpacity(0.25),
                        spreadRadius: 0),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(imagePath,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.medium,
                        height: Get.height * 0.1 / 2.5),
                    height5,
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 8),
                    ),
                    Divider(
                        color: kblack.withOpacity(0.2),
                        endIndent: 16,
                        indent: 16),
                    const Text("₹ 10,000",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 8)),
                    height2,
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 16,
                child: Container(
                  height: 18,
                  width: 46,
                  decoration: const BoxDecoration(
                    color: kred,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Buy Now",
                      style: TextStyle(color: kwhite, fontSize: 6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
