import 'package:flutter/material.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';

class Tag extends StatelessWidget {
  const Tag({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: AppColors.primary,
      ),
      child: Text(
        text,
        style: AppTextStyles.body1Medium.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
