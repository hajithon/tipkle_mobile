import 'package:flutter/material.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';

class BookmarkedQuestion extends StatelessWidget {
  const BookmarkedQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.gray,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text("IT"),
              VerticalDivider(
                color: AppColors.black,
                thickness: 1,
              ),
              Text("피그마 꿀 팁 알려주세요."),
            ],
          ),
          Divider(
            color: AppColors.black,
            thickness: 1,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 100,
                  height: 100,
                  color: AppColors.white,
                  child: const Column(
                    children: [
                      Text("제목"),
                      Text("내용"),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
