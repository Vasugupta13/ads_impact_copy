import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogListView extends StatefulWidget {
  final Function(int index) onTapCallback;
  const CatalogListView({super.key, required this.onTapCallback});

  @override
  State<CatalogListView> createState() => _CatalogListViewState();
}

class _CatalogListViewState extends State<CatalogListView> {
  final List<String> name = [
    "Default View",
    "Website View",
    "Performance View"
  ];

  int listindex = 0;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 44,
        width: Get.width * 0.85,
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
            ]),
        child: ListView.separated(
          itemCount: name.length,
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
                      name[index],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
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
