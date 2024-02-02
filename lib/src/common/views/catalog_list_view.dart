import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogListView extends StatefulWidget {
  final Function(int index) onTapCallback;
  final List<String> names;
  final AlignmentGeometry alignment;

  const CatalogListView({
    super.key,
    required this.onTapCallback,
    required this.names,
    this.alignment = Alignment.centerRight,
  });

  @override
  State<CatalogListView> createState() => _CatalogListViewState();
}

class _CatalogListViewState extends State<CatalogListView> {
  int listindex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 44,
        width: screenWidth * 0.95,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000040).withOpacity(0.25),
              blurRadius: 16,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ListView.separated(
          itemCount: widget.names.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 16, right: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            bool isSelected = index == listindex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  listindex = index;
                  widget.onTapCallback(index);
                });
              },
              child: SizedBox(
                width: screenWidth * 0.25 + 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.names[index],
                          style: const TextStyle(
                            fontFamily: FontAssets.Poppins,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    Container(
                        height: 1,
                        color: isSelected
                            ? const Color(0xffFF6B00)
                            : Colors.transparent),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return VerticalDivider(
              color: kblack.withOpacity(0.1),
              endIndent: 10,
              indent: 10,
            );
          },
        ),
      ),
    );
  }
}
