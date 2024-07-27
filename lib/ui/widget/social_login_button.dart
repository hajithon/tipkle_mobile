import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tipkle/core/constants/app_values.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.onTapFunction,
      required this.buttonColor,
      required this.assetName});

  final void Function() onTapFunction;
  final Color buttonColor;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        width: AppValues.socialButtonSize,
        height: AppValues.socialButtonSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonColor,
        ),
        child: Center(
          child: SvgPicture.asset(
            assetName,
            width: AppValues.iconSizeSm,
            height: 24,
          ),
        ),
      ),
    );
  }
}
