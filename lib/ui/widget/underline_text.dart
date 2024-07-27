import 'package:flutter/material.dart';

class UnderlinedText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color color;
  final double underlineThickness;

  const UnderlinedText({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.color,
    required this.underlineThickness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Stack(
        children: [
          Text(
            text,
            style: textStyle.copyWith(color: color),
          ),
          Positioned(
            bottom: -underlineThickness / 2,
            left: 0,
            right: 0,
            child: Container(
              height: underlineThickness,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
