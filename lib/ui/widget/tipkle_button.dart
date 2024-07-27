import 'package:flutter/material.dart';
import 'package:tipkle/core/constants/app_values.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';

class TipkleButton extends StatelessWidget {
  const TipkleButton(
      {super.key,
      required this.buttonText,
      required this.onTapFunction,
      required this.available});

  final String buttonText;
  final void Function() onTapFunction;
  final bool available;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: available ? onTapFunction : null,
      child: Container(
        height: AppValues.buttonHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: available ? AppColors.primary : AppColors.gray,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyles.subhead4SemiBold.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
