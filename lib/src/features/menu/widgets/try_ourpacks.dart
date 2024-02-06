import 'package:ads/src/res/assets.dart';
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
            ImageAssets.ourbasicpack,
            () {
              print("Basic Pack");
            },
          )),
          kwidth10,
          Expanded(
              child: PacksUI(
            "Pro Pack",
            ImageAssets.ourpropack,
            () {
              print("Pro Pack");
            },
          )),
          kwidth10,
          Expanded(
              child: PacksUI(
            "Advance Pack",
            ImageAssets.ouradvancepack,
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: screenHeight * 0.15,
          color: kwhite,
          child: Stack(
            children: [
              Container(
                height: screenHeight * 0.15 - 10,
                // width: screenWidth,
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
                        height: screenHeight * 0.04),
                    height10,
                    Text(
                      name,
                      style: const TextStyle(

                          fontWeight: FontWeight.w600,
                          fontSize: 8),
                    ),
                    Divider(
                        thickness: 0.5,
                        color: kblack.withOpacity(0.2),
                        endIndent: 16,
                        indent: 16),
                    const Text(
                      "₹ 10,000",
                      style: TextStyle(

                          fontWeight: FontWeight.w600,
                          fontSize: 8),
                    ),
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
                      style: TextStyle(
                          
                          fontWeight: FontWeight.w400,
                          color: kwhite,
                          fontSize: 6),
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
