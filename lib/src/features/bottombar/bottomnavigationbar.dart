// bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;
}

final BottomNavController bottomNavController = Get.put(BottomNavController());

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BottomNavigationBar(
          currentIndex: bottomNavController.currentIndex.value,
          onTap: (index) {
            bottomNavController.currentIndex.value = index;
            switch (index) {
              case 0:
                Get.toNamed('/home');
                break;
              case 1:
                Get.toNamed('/analysis');
                break;
              case 2:
                Get.toNamed('/cart');
                break;
              case 3:
                Get.toNamed('/account');
                break;
              default:
                break;
            }
          },
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
