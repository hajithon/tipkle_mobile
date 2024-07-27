import 'package:flutter/material.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/core/viewmodels/article_viewmodel.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';

import 'package:tipkle/ui/widget/base_widget.dart';
import 'package:tipkle/ui/widget/social_login_button.dart';
import 'package:tipkle/ui/widget/tipkle_appbar.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ArticleViewmodel>(
      model: ArticleViewmodel(),
      onModelReady: (ArticleViewmodel model) => model.initModel(),
      builder: (BuildContext context, ArticleViewmodel model, _) {
        return Scaffold(
          appBar: const TipkleAppbar(
            title: '',
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SocialLoginButton(
                      buttonColor: AppColors.kakao,
                      assetName: AssetPaths.kakaoIcon,
                      onTapFunction: () {},
                    ),
                    SocialLoginButton(
                      buttonColor: AppColors.naver,
                      assetName: AssetPaths.naverIcon,
                      onTapFunction: () {},
                    )
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
