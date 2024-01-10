import 'package:ads/src/res/dashboard_platform_spend.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ViewMoreContainer extends StatefulWidget {
  final List<dynamic> data;

  const ViewMoreContainer({
    super.key,
    required this.data,
  });

  @override
  State<ViewMoreContainer> createState() => _ViewMoreContainerState();
}

class _ViewMoreContainerState extends State<ViewMoreContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            children: [
              height50,
              Divider(
                color: Colors.black.withOpacity(0.1),
                endIndent: 14,
                indent: 14,
              ),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            widget.data[index]["imageurl"] == null
                                ? const SizedBox()
                                : SvgPicture.asset(
                                    widget.data[index]["imageurl"],
                                  ),
                            widget.data[index]["imageurl"] == null
                                ? const SizedBox()
                                : kwidth30,
                            Expanded(
                              child: Text(
                                widget.data[index]["name"],
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const VerticalDivider(color: Colors.black),
                            const Spacer(),
                            Text(
                              widget.data[index]["spend"],
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              widget.data[index]["views"].toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: (Get.width - 76) / 2,
          child: GestureDetector(
            child: Container(
              height: 40,
              width: 76,
              decoration: const BoxDecoration(
                color: Color(0xffE8EBF2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.keyboard_arrow_up),
                  Text(
                    "View More",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
