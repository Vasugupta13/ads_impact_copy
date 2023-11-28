import 'package:flutter/material.dart';

class CatalogMenuView extends StatefulWidget {
  const CatalogMenuView({super.key});

  @override
  State<CatalogMenuView> createState() => _CatalogMenuViewState();
}

class _CatalogMenuViewState extends State<CatalogMenuView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 50,
         color: Colors.red),
        Container(height: 50, color: Colors.black),
        Container(height: 50, color: Colors.blue),
      ],
    );
  }
}
