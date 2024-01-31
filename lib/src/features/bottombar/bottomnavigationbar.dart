// bottom_nav_bar.dart
import 'package:ads/src/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;
}

final BottomNavController bottomNavController = Get.put(BottomNavController());

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static const routePath = '/CustomNavBar';

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
          unselectedLabelStyle: const TextStyle(
              fontFamily: FontAssets.Poppins,
              fontWeight: FontWeight.w500,
              fontSize: 10),
          selectedLabelStyle: const TextStyle(
              fontFamily: FontAssets.Poppins,
              fontWeight: FontWeight.w500,
              fontSize: 10),
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff383838),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.homebottom),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.analysisbottom),
              label: "Analysis",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.cartbottom),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.accountbottom),
              label: "My Account",
            ),
          ],
        ),
      ),
    );
  }
}
