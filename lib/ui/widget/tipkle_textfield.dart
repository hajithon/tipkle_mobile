import 'package:flutter/material.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';

class TipkleTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const TipkleTextField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 1.0),
        ),
        hintText: hintText,
      ),
    );
  }
}
