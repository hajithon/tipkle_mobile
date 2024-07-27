import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/core/viewmodels/article_viewmodel.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/widget/tag.dart';

class CustomAppBarShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.85);
    path.lineTo(size.width * 0.08, size.height);
    path.lineTo(size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ArticleAppbar extends StatelessWidget {
  const ArticleAppbar({super.key, required this.model});

  final ArticleViewmodel model;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomAppBarShape(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Transform.rotate(
                    angle: 0.2,
                    child: Image.asset(
                      AssetPaths.tipkleCertImage,
                      width: 130,
                      height: 130,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            model.toggleBookmark();
                          },
                          icon: SvgPicture.asset(model.bookmarked
                              ? AssetPaths.bookmarked
                              : AssetPaths.notBookmarked),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "카테고리 | IT",
                          style: AppTextStyles.body1Medium.copyWith(
                            color: AppColors.gray,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "피그마 꿀 팁 알려주세요",
                      style: AppTextStyles.display1Bold,
                    ),
                    const SizedBox(height: 5),
                    const Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      spacing: 5,
                      runSpacing: 5,
                      children: [
                        Tag(text: "#디자인"),
                        Tag(text: "#플러그인"),
                        Tag(text: "#UX/UI"),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
