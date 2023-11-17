import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../const.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: kblack.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 10),
        ),
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/home_icon.svg',
                height: 20,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/chart_icon.svg',
                height: 20,
              ),
              label: "Analysis",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/shopping-cart.svg',
                height: 20,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/person_icon.svg',
                height: 20,
              ),
              label: "My Account",
            ),
          ],
        ),
      ),
    );
  }
}
