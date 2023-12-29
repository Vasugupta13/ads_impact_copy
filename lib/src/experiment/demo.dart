import 'package:flutter/material.dart';
import 'package:flyout/flyout.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Some Screen"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => flyout(context, () => const ImAFlyoutScreen()),
            child: const Text("Show Flyout"),
          ),
        ),
      );
}

class ImAFlyoutScreen extends StatelessWidget {
  const ImAFlyoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SizedBox(
          height: 50,
          child: ListView(
            controller: flyoutController(context),
            children: const [
              SizedBox(
                height: 40,
                child: Text("data"),
              )
            ],
          ),
        ),
      );
}
