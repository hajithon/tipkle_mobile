import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/widget/tag.dart';

class ArticlePostit extends StatelessWidget {
  const ArticlePostit(
      {super.key,
      required this.index,
      required this.tagText,
      required this.contents});

  final int index;
  final String tagText;
  final List<String> contents;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Tag(text: tagText),
            Spacer(),
            Text(
              "전체보기",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.rotate(
              angle: index.isEven ? 0.1 : -0.1,
              child: PostIt(
                content: contents[0],
              ),
            ),
            PostIt(
              content: contents[1],
            ),
            PostIt(
              content: contents[2],
            ),
          ],
        )
      ],
    );
  }
}

class PostIt extends StatelessWidget {
  PostIt({super.key, required this.content});

  final String content;

  final List<Color> colors = [
    Color(0xFFFFEEE2),
    Color(0xFFC0E0F8),
    Color(0xFFECEFF1),
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final randomColor = colors[random.nextInt(colors.length)];

    return Container(
      width: 100,
      height: 100,
      color: randomColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            content,
            style: AppTextStyles.body1Regular,
          ),
        ),
      ),
    );
  }
}
