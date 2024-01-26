
import 'package:ads/src/common/views/custom_elevatedbutton.dart';
import 'package:ads/src/features/menu/audience%20insights/view/custom_audience_popup.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAudience extends StatefulWidget {
  const CustomAudience({
    super.key,
  });

  @override
  State<CustomAudience> createState() => _CustomAudienceState();
}

class _CustomAudienceState extends State<CustomAudience> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: Get.height * 0.80,
          width: Get.width,
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grid_view_rounded),
                  kwidth20,
                  Text(
                    "Custom Audience",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Divider(endIndent: 14),
              height20,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextForm(
                      name: "Source", icon: Icons.keyboard_arrow_down),
                  height20,
                  const CustomTextForm(name: "Events"),
                  height20,
                  const Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Text(
                      "Retention",
                      style: TextStyle(
                        fontSize: 12,
                        color: kdarkgrey,
                      ),
                    ),
                  ),
                  height5,
                  const CustomTextForm(name: "30Days"),
                  height20,
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xff1A377D),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: kwhite, size: 18),
                              kwidth10,
                              Text(
                                "Include more people",
                                style: TextStyle(
                                  color: kwhite,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      kwidth10,
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xff1A377D),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.remove, color: kwhite, size: 14),
                              kwidth10,
                              Text(
                                "Exclude people",
                                style: TextStyle(
                                  color: kwhite,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  height20,
                  const CustomTextForm(name: "Audience Name"),
                  height20,
                  const CustomTextForm(name: "Description (Optional)"),
                ],
              ),
              height25,
              CommonElevatedButton(
                name: "Create Audience",
                buttonwidth: 0.22,
                buttonheight: 0.05,
                textStyle: const TextStyle(fontSize: 12, color: kwhite),
                ontap: () async {
                  Get.back();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AudiencePopup();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextForm extends StatefulWidget {
  final String name;
  final IconData? icon;
  const CustomTextForm({super.key, required this.name, this.icon});

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  final int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentindex == 0;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: Icon(widget.icon),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: currentindex == 0
                    ? Colors.red
                    : Colors.black.withOpacity(0.2),
              ),
            ),
            hintText: widget.name,
            alignLabelWithHint: true,
            hintStyle: TextStyle(
              fontSize: 12,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }
}
