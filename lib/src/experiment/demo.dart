import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        SvgPicture.asset("assets/images/chat.svg"),
                        Positioned(
                          top: 0,
                          left: 30,
                          right: 30,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff1A377D).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: Text("Ad Chat")),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
