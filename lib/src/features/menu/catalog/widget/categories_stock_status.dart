import 'package:ads/src/features/menu/catalog/widget/cancel_save_button.dart';
import 'package:ads/src/features/menu/catalog/widget/custom_radiolisttile.dart';
import 'package:ads/src/features/menu/catalog/widget/catalog_container.dart';
import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';

class StockStatus extends StatefulWidget {
  const StockStatus({super.key});

  @override
  State<StockStatus> createState() => _StockStatusState();
}

class _StockStatusState extends State<StockStatus> {
  TileName _status = TileName.tagallphotos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CatalogContainer(
            image: IconAssets.stockstatus, name: "Stock Status"),
        height20,
        RadioListTileButton(
          value: TileName.tagallphotos,
          title: 'Tag all Photos in catalog as In Stock',
          groupValue: _status,
          onChanged: (TileName? value) {
            setState(() {
              _status = value!;
            });
          },
        ),
        RadioListTileButton(
          value: TileName.tagasstock,
          title: 'Tag as In Stock, if lorem epsum in',
          groupValue: _status,
          onChanged: (TileName? value) {
            setState(() {
              _status = value!;
            });
          },
        ),
        RadioListTileButton(
          value: TileName.tagasoutofstock,
          title: 'Tag as Out of Stock Porem ipsum dolor sit amet',
          groupValue: _status,
          onChanged: (TileName? value) {
            setState(() {
              _status = value!;
            });
          },
        ),
        RadioListTileButton(
          value: TileName.foremipsum,
          title: 'Forem ipsum dolor sit',
          groupValue: _status,
          onChanged: (TileName? value) {
            setState(() {
              _status = value!;
            });
          },
        ),
        RadioListTileButton(
          value: TileName.horemipsum,
          title: 'Horem ipsum dolor sit amet consectetur',
          groupValue: _status,
          onChanged: (TileName? value) {
            setState(() {
              _status = value!;
            });
          },
        ),
        RadioListTileButton(
          value: TileName.boremipsum,
          title: 'Borem ipsum dolor sit amet consectetur',
          groupValue: _status,
          onChanged: (TileName? value) {
            setState(() {
              _status = value!;
            });
          },
        ),
        height10,
        CatalogCommonButton(
          ontapcancel: () {},
          ontapsave: () {},
          name: 'Cancel',
          subname: "Save",
        ),
        height30
      ],
    );
  }
}
