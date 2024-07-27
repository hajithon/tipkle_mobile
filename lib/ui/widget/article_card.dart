import 'package:flutter/material.dart';
import 'package:tipkle/core/constants/route_paths.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RoutePaths.Article);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '제목',
              style: AppTextStyles.body3Medium.copyWith(
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const _Tag();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          '태그',
          style: AppTextStyles.body1Medium.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
