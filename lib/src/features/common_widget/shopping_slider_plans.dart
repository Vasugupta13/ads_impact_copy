import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShoppingListSlider extends StatefulWidget {
  const ShoppingListSlider({Key? key}) : super(key: key);

  @override
  _ShoppingListSliderState createState() => _ShoppingListSliderState();
}

class _ShoppingListSliderState extends State<ShoppingListSlider> {
  int currentIndex = 0;
  final CarouselController _controller = CarouselController();
  List<String> imageList = [
    "assets/images/ck.svg",
    "assets/images/nike.svg",
    "assets/images/bmw.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imageList.map((imageUrl) {
            return SvgPicture.asset(
              imageUrl,
              fit: BoxFit.cover,
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(currentIndex == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
