import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/core/constants/route_paths.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/widget/tag.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard(
      {super.key,
      required this.bookMarked,
      required this.tags,
      required this.title});

  final bool bookMarked;
  final List<String> tags;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RoutePaths.Article);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Transform.rotate(
                  angle: 0.15,
                  child: Image.asset(
                    "assets/images/tipkle_cert.png",
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20),
                  child: Text(
                    title,
                    style: AppTextStyles.body3Medium.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    height: 25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tags.length,
                      itemBuilder: (context, index) {
                        double paddingVal = index == 0 ? 20 : 5;

                        return Padding(
                          padding: EdgeInsets.only(left: paddingVal),
                          child: Tag(text: tags[index]),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            bookMarked
                ? Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        AssetPaths.bookmarkSharp,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
