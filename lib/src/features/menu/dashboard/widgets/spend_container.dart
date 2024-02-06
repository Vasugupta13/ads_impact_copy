import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SpendContainer extends StatefulWidget {
  final List<dynamic> data;

  const SpendContainer({
    super.key,
    required this.data,
  });

  @override
  State<SpendContainer> createState() => _SpendContainerState();
}

class _SpendContainerState extends State<SpendContainer> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          width: screenWidth,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: kblack.withOpacity(0.25),
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
              divider161,
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
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

                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              widget.data[index]["spend"],
                              style: const TextStyle(

                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
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
                        height30,
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
          left: (screenWidth - 76) / 2,
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

                        fontWeight: FontWeight.w500,
                        fontSize: 10),
                  ),
                  height2,
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
