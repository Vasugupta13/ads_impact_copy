import 'dart:ui';

import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/common/views/customdropdown.dart';
import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/features/menu/campaign/campaign_create.dart';
import 'package:ads/src/features/menu/catalog/widget/cancel_save_button.dart';
import 'package:ads/src/features/menu/catalog/widget/categories_default_variant.dart';
import 'package:ads/src/features/menu/catalog/widget/categories_image_padding.dart';
import 'package:ads/src/features/menu/catalog/widget/categories_image_spec.dart';
import 'package:ads/src/features/menu/catalog/widget/categories_product_detail.dart';
import 'package:ads/src/features/menu/catalog/widget/categories_stock_status.dart';
import 'package:ads/src/features/menu/catalog/widget/title_container.dart';
import 'package:ads/src/features/menu/catalog/widget/custom_radiolisttile.dart';
import 'package:ads/src/homepage/widgets/social_account_list_widget.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuCatalogInformation extends StatefulWidget {
  const MenuCatalogInformation({super.key});
  static const routerPath = '/MenuCatalogInformation';

  @override
  State<MenuCatalogInformation> createState() => _MenuCatalogInformationState();
}

class _MenuCatalogInformationState extends State<MenuCatalogInformation> {
  final TileName _status = TileName.tagallphotos;

  int currentindex = 1;
  String selectedOption = '';
  int listindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(elevation: 0, toolbarHeight: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBar(
                  name: "Catalog Configuration",
                  imagepath: IconAssets.editicon),
              height10,
              const Text(
                "Choose Platform:",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              height20,
              SocialAccountList(
                onTapCallback: (index) {
                  setState(
                    () {},
                  );
                },
              ),
              height30,
              const StockStatus(),
              const ImageSpecifications(),
              const ImagePadding(),
              const ProductDetails(),
              const DefaultVariant(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class CompanyDetails extends StatelessWidget {
  final String detailname;
  final String details;
  const CompanyDetails({
    super.key,
    required this.detailname,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          detailname,
          style: const TextStyle(
            fontFamily: FontAssets.Poppins,
            fontWeight: FontWeight.w500,
            fontSize: 8,
          ),
        ),
        kwidth10,
        Text(
          details,
          style: TextStyle(
            fontFamily: FontAssets.Poppins,
            fontWeight: FontWeight.w500,
            fontSize: 8,
            color: kblack.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
