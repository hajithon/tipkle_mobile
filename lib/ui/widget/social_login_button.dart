import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tipkle/core/constants/app_values.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.onTapFunction,
      required this.buttonColor,
      required this.assetName,
      required this.buttonText});

  final void Function() onTapFunction;
  final Color buttonColor;
  final String assetName;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunction();
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: AppValues.buttonHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: buttonColor,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  assetName,
                  width: AppValues.iconSizeMd,
                  height: AppValues.iconSizeMd,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                buttonText,
                style: AppTextStyles.body2Medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
