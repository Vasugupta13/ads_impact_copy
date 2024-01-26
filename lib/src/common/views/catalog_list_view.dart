import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogListView extends StatefulWidget {
  final Function(int index) onTapCallback;
  final List<String> names;
  final AlignmentGeometry alignment;
 

  const CatalogListView({
    Key? key,
    required this.onTapCallback,
    required this.names,
    this.alignment = Alignment.centerRight,

  }) : super(key: key);

  @override
  State<CatalogListView> createState() => _CatalogListViewState();
}

class _CatalogListViewState extends State<CatalogListView> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Container(
        height: 44,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
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
                  selectedindex = index;
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
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        decoration: selectedindex == index
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: selectedindex == index
                            ? const Color(0xffFF6B00)
                            : Colors.transparent,
                        decorationThickness: 2,
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
