import 'package:ads/src/utils/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CatalogCommonButton extends StatefulWidget {
  final String name;
  final String subname;
  final VoidCallback ontapcancel;
  final VoidCallback ontapsave;

  const CatalogCommonButton(
      {super.key,
      required this.name,
      required this.subname,
      required this.ontapcancel,
      required this.ontapsave});

  @override
  State<CatalogCommonButton> createState() => _CatalogCommonButtonState();
}

class _CatalogCommonButtonState extends State<CatalogCommonButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: widget.ontapcancel,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.4), width: 0.5),
                ),
                child: Center(
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      color: kblack,
                    ),
                  ),
                ),
              ),
            ),
          ),
          kwidth10,
          Expanded(
            child: GestureDetector(
              onTap: widget.ontapsave,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xff1A377D),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.4), width: 0.5),
                ),
                child: Center(
                  child: Text(
                    widget.subname,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
