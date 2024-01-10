import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShoppingListSlider extends StatefulWidget {
  const ShoppingListSlider({Key? key}) : super(key: key);

  @override
  _ShoppingListSliderState createState() => _ShoppingListSliderState();
}

class _ShoppingListSliderState extends State<ShoppingListSlider> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  List<String> imageList = [
    "assets/images/ck.png",
    "assets/images/nike.png",
    "assets/images/bmw.png",
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: kblack.withOpacity(0.2), endIndent: 8, indent: 8),
        height15,
        const Text(
          "Our Branding Partners",
          style: TextStyle(
              fontSize: 24, letterSpacing: -0.3),
        ),
        height20,
        SizedBox(
          height: 150,
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
                  activeDotColor: Color(0xffFF4848),
                ),
              ),
            ],
          ),
        ),
        height15,
      ],
    );
  }
}
