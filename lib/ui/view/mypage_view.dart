import 'package:flutter/material.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/core/constants/route_paths.dart';
import 'package:tipkle/core/viewmodels/article_viewmodel.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/widget/base_widget.dart';
import 'package:tipkle/ui/widget/tipkle_appbar.dart';

class MypageView extends StatelessWidget {
  const MypageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ArticleViewmodel>(
      model: ArticleViewmodel(),
      onModelReady: (ArticleViewmodel model) => model.initModel(),
      builder: (BuildContext context, ArticleViewmodel model, _) {
        return Scaffold(
          appBar: const TipkleAppbar(
            title: "마이페이지",
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  AssetPaths.expertImage,
                  width: 100,
                ),
                const SizedBox(height: 20),
                Text("닉네임", style: AppTextStyles.display1Bold),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MypageButton(
                      imagePath: AssetPaths.bookmarkedTipkleImage,
                      text: "북마크한 팁끌보드",
                      onTapFuction: () {
                        Navigator.of(context)
                            .pushNamed(RoutePaths.BookmarkedQuestion);
                      },
                    ),
                    MypageButton(
                      imagePath: AssetPaths.bookmarkedTipImage,
                      text: "북마크한 팁끌",
                      onTapFuction: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class MypageButton extends StatelessWidget {
  const MypageButton(
      {super.key,
      required this.onTapFuction,
      required this.imagePath,
      required this.text});

  final void Function() onTapFuction;
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFuction,
      child: Container(
        width: 160,
        height: 160,
        decoration: const BoxDecoration(
          color: Color(0xFFFFF5DD),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, width: 90, height: 90),
              const SizedBox(height: 10),
              Text(text, style: AppTextStyles.body1Medium),
            ],
          ),
        ),
      ),
    );
  }
}
