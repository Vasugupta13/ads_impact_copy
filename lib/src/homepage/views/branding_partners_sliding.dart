import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShoppingListSlider extends StatefulWidget {
  const ShoppingListSlider({super.key});

  @override
  _ShoppingListSliderState createState() => _ShoppingListSliderState();
}

class _ShoppingListSliderState extends State<ShoppingListSlider> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  List<String> imageList = [
    "assets/images/ck.png",
    "assets/images/nike.png",
    "assets/images/bmw.png"
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        dividerind16,
        height15,
        const Text(
          "Our Branding Partners",
          style: TextStyle(
              fontFamily: FontAssets.Poppins,
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        height20,
        SizedBox(
          height: screenHeight * 0.2,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imageList.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(imageList[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
              height30,
              SmoothPageIndicator(
                controller: _pageController,
                count: imageList.length,
                effect: const ExpandingDotsEffect(
                    expansionFactor: 2.5,
                    dotWidth: 16,
                    dotHeight: 10,
                    activeDotColor: kred),
              ),
            ],
          ),
        ),
        height15,
      ],
    );
  }
}
