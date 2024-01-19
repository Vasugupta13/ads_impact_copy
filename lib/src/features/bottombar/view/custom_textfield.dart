import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hintText;
  final bool isPassword;
  final Function(String)? onChanged;
  // bool obsecureicon;

  const CustomTextField({
    Key? key,
    this.controller,
    this.focusNode,
    required this.hintText,
    this.isPassword = false,
    this.onChanged,
    // this.obsecureicon = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: Get.width * 0.8,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        // obscureText: widget.isPassword,
        
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: kblack.withOpacity(0.1),
            ),
          ),
          contentPadding: padding16,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: isSelected ? kred : kblack.withOpacity(0.1),
            ),
          ),
          hintText: widget.hintText,
          alignLabelWithHint: true,
          hintStyle: TextStyle(
            fontSize: 12,
            color: kblack.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
