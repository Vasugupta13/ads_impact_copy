import 'package:ads/src/res/assets.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  final double? containerHeight;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hinttext;
  final bool isPassword;
  final Function(String)? onChanged;
  final VoidCallback? sendonTap;
  final VoidCallback? imageonTap;
  final bool? isSuffix;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.isPassword = false,
    this.onChanged,
    this.sendonTap,
    this.isSuffix = false,
    this.imageonTap,
    this.validator,
    this.obscureText = false,
    this.containerHeight,
    this.hinttext,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isSelected = true;
  bool isPasswordvisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.8,
      height: widget.containerHeight,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
            fontFamily: FontAssets.Poppins,
            fontWeight: FontWeight.w500,
            fontSize: 12),
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: InputDecoration(
          suffixIcon: widget.isSuffix!
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: widget.imageonTap,
                      child:
                          SvgPicture.asset("assets/images/chat_image_icon.svg"),
                    ),
                    kwidth15,
                    GestureDetector(
                      onTap: widget.sendonTap,
                      child:
                          SvgPicture.asset("assets/images/chat_send_icon.svg"),
                    ),
                    kwidth15,
                  ],
                )
              : const SizedBox(),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: kblack.withOpacity(0.1),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 16, vertical: widget.hinttext != null ? 14 : 0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: isSelected ? kred : kblack.withOpacity(0.1),
            ),
          ),
          hintText: widget.hinttext,
          hintMaxLines: 20,
          hintStyle: const TextStyle(
              fontFamily: FontAssets.Poppins,
              fontWeight: FontWeight.w400,
              color: kgrey,
              fontSize: 14),
          labelText: widget.labelText,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            fontFamily: FontAssets.Poppins,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: kblack.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
