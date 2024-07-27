import 'package:flutter/material.dart';

class AppTextStyles {
  static const double _baseLetterSpacing = -0.5;

  static TextStyle _pretendardStyle(double size, FontWeight weight) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      fontFamily: 'Pretendard',
      letterSpacing: _baseLetterSpacing,
    );
  }

  static final TextStyle display2Bold = _pretendardStyle(28, FontWeight.w700);
  static final TextStyle display2SemiBold =
      _pretendardStyle(28, FontWeight.w600);
  static final TextStyle display1Bold = _pretendardStyle(24, FontWeight.w700);
  static final TextStyle display1SemiBold =
      _pretendardStyle(24, FontWeight.w600);
  static final TextStyle headlineBold = _pretendardStyle(20, FontWeight.w700);
  static final TextStyle headlineSemiBold =
      _pretendardStyle(20, FontWeight.w600);
  static final TextStyle subhead4Bold = _pretendardStyle(18, FontWeight.w700);
  static final TextStyle subhead4SemiBold =
      _pretendardStyle(18, FontWeight.w600);
  static final TextStyle subhead3Bold = _pretendardStyle(16, FontWeight.w700);
  static final TextStyle subhead3SemiBold =
      _pretendardStyle(16, FontWeight.w600);
  static final TextStyle subhead2Bold = _pretendardStyle(14, FontWeight.w700);
  static final TextStyle subhead2SemiBold =
      _pretendardStyle(14, FontWeight.w600);
  static final TextStyle subhead1Bold = _pretendardStyle(12, FontWeight.w700);
  static final TextStyle subhead1SemiBold =
      _pretendardStyle(12, FontWeight.w600);
  static final TextStyle body3Medium = _pretendardStyle(18, FontWeight.w500);
  static final TextStyle body3Regular = _pretendardStyle(18, FontWeight.w400);
  static final TextStyle body2Medium = _pretendardStyle(16, FontWeight.w500);
  static final TextStyle body2Regular = _pretendardStyle(16, FontWeight.w400);
  static final TextStyle body1Medium = _pretendardStyle(14, FontWeight.w500);
  static final TextStyle body1Regular = _pretendardStyle(14, FontWeight.w400);
  static final TextStyle captionMedium = _pretendardStyle(12, FontWeight.w500);
  static final TextStyle captionRegular = _pretendardStyle(12, FontWeight.w400);
  static final TextStyle descriptionMedium =
      _pretendardStyle(10, FontWeight.w500);
  static final TextStyle descriptionRegular =
      _pretendardStyle(10, FontWeight.w400);
}
