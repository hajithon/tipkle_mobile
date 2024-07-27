import 'package:flutter/material.dart';
import 'package:tipkle/ui/widget/tag.dart';

class ArticlePostit extends StatelessWidget {
  const ArticlePostit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Tag(text: "디자인"),
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
              angle: 0.1,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey,
                child: Column(
                  children: [
                    Text("제목"),
                    Text("내용"),
                  ],
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: Column(
                children: [
                  Text("제목"),
                  Text("내용"),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: Column(
                children: [
                  Text("제목"),
                  Text("내용"),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
