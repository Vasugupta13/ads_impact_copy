import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogListView extends StatefulWidget {
  final Function(int index) onTapCallback;
  final List<String> names;
  final AlignmentGeometry alignment;
  final double containerwidth;
  const CatalogListView({
    Key? key,
    required this.onTapCallback,
    required this.names,
    this.alignment = Alignment.centerRight, required this.containerwidth,
  }) : super(key: key);

  @override
  State<CatalogListView> createState() => _CatalogListViewState();
}

class _CatalogListViewState extends State<CatalogListView> {
  int listindex = 0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Container(
        height: 44,
        width: Get.width * widget.containerwidth,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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
            return GestureDetector(
              onTap: () {
                setState(() {
                  listindex = index;
                  widget.onTapCallback(index);
                });
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Text(
                      widget.names[index],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const VerticalDivider(
              indent: 16,
              endIndent: 16,
              thickness: 1,
              width: 50,
            );
          },
        ),
      ),
    );
  }
}