import 'package:flutter/material.dart';

class UnderlinedText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color underlineColor;
  final double underlineThickness;

  const UnderlinedText({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.underlineColor,
    required this.underlineThickness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: textStyle,
        ),
        Positioned(
          bottom: -underlineThickness / 2,
          left: 0,
          right: 0,
          child: Container(
            height: underlineThickness,
            color: underlineColor,
          ),
        ),
      ],
    );
  }
}
