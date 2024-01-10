import 'dart:ui';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  customPopUpMenu(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StatefulBuilder(builder: (context, fn) {
                  GlobalKey key = GlobalKey();

                  return ListTile(
                    key: key,
                    leading: const Icon(Icons.abc),
                    onTap: () {
                      showSubMenuItemsList(context, 1, key);
                    },
                  );
                }),
                StatefulBuilder(builder: (context, fn) {
                  GlobalKey key = GlobalKey();

                  return ListTile(
                    key: key,
                    leading: const Icon(Icons.abc),
                    onTap: () {
                      showSubMenuItemsList(context, 1, key);
                    },
                  );
                })
              ],
            ),
          ),
        );
      },
    );
  }

  showSubMenuItemsList(BuildContext context, int menuNumber, key) {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    double y = position.dy;
    double x = position.dx;
    print("${position.dx}, $y ");

    final overlay = Overlay.of(context).context;
    final overlayBox = overlay.findRenderObject() as RenderBox;
    final overlayPosition = overlayBox.localToGlobal(Offset.zero);
    double adjustedX = x - overlayPosition.dx;
    double adjustedY = y - overlayPosition.dy;

    return showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, fn) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      color: const Color.fromARGB(0, 75, 75, 75),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: adjustedX,
                top: adjustedY,
                child: Container(
                  width: 80,
                  height: 80,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.abc),
                    ],
                  ),
                ),
              )
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Your widget build logic here
    return Container();
  }
}
