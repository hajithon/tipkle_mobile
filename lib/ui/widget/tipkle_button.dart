import 'package:flutter/material.dart';
import 'package:tipkle/core/constants/app_values.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';

class TipkleButton extends StatelessWidget {
  const TipkleButton({super.key, required this.buttonText});

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: AppValues.buttonHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius:
              BorderRadius.circular(AppValues.circularBoxBorderRadius),
        ),
        child: Center(
          child: Text(
            '버튼',
            style: AppTextStyles.subhead4SemiBold.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
