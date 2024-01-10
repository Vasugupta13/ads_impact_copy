import 'package:flutter/material.dart';

enum TileName {
  tagallphotos,
  tagasstock,
  tagasoutofstock,
  foremipsum,
  horemipsum,
  boremipsum,
  prfixbrandname,
  suffixbrandname,
  notransformation,
  donotsendvariants,
  variantasvariant,
  variantasindividual
}

class RadioListTileButton extends StatelessWidget {
  TileName? _status = TileName.tagallphotos;
  final TileName valueName;
  final TileName groupValue;
  final Function(TileName?) onChanged;
  final String name;

  RadioListTileButton({
    Key? key,
    required this.valueName,
    required this.groupValue,
    required this.onChanged,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile<TileName>(
      activeColor: const Color(0xff1A377D),
      title: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
      value: valueName,
      groupValue: _status,
      onChanged: (TileName? value) {
        onChanged(value == groupValue ? null : value);
      },
    );
  }
}
