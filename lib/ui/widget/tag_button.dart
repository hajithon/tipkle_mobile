import 'package:flutter/material.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';

class TagButton extends StatelessWidget {
  const TagButton(
      {super.key,
      required this.text,
      required this.onTapFunction,
      required this.tapped});

  final String text;
  final void Function() onTapFunction;
  final bool tapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: tapped ? AppColors.primary : const Color(0xFFFFDDC3),
        ),
        child: Text(
          text,
          style: AppTextStyles.body1Medium.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
