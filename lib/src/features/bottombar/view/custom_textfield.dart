import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hintText;
  final bool isPassword;
  final Function(String)? onChanged;
  final VoidCallback? sendonTap;
  final VoidCallback? imageonTap;
  final bool? isSuffix;

  // bool obsecureicon;

  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    required this.hintText,
    this.isPassword = false,
    this.onChanged,
    this.sendonTap,
    this.isSuffix = false,
    this.imageonTap,

    // this.obsecureicon = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      color: kwhite,
      child: SizedBox(
        width: screenWidth * 0.8,
        child: TextFormField(
          style: const TextStyle(
              fontFamily: FontAssets.Poppins,
              fontWeight: FontWeight.w500,
              fontSize: 12
              ),
          controller: widget.controller,
          focusNode: widget.focusNode,
          // obscureText: widget.isPassword,

          onChanged: widget.onChanged,
          decoration: InputDecoration(
            suffixIcon: widget.isSuffix!
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: widget.imageonTap,
                        child: SvgPicture.asset(
                            "assets/images/chat_image_icon.svg"),
                      ),
                      kwidth15,
                      GestureDetector(
                        onTap: widget.sendonTap,
                        child: SvgPicture.asset(
                            "assets/images/chat_send_icon.svg"),
                      ),
                      kwidth15,
                    ],
                  )
                : const SizedBox(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: kblack.withOpacity(0.1),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: isSelected ? kred : kblack.withOpacity(0.1),
              ),
            ),
            hintText: widget.hintText,
            alignLabelWithHint: true,
            hintStyle: TextStyle(
              fontFamily: FontAssets.Poppins,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: kblack.withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }
}
