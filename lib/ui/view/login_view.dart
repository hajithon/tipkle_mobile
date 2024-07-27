import 'package:flutter/material.dart';
import 'package:tipkle/core/constants/app_values.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/core/constants/route_paths.dart';
import 'package:tipkle/core/viewmodels/login_viewmodel.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/widget/base_widget.dart';
import 'package:tipkle/ui/widget/social_login_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(),
      onModelReady: (LoginViewModel model) => model.initModel(),
      builder: (BuildContext context, LoginViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80.0),
                      child: Image.asset(AssetPaths.titleImage),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "작은 팁이 모여 지식의 산이 된다!\n팁끌 모아 태산",
                      style: AppTextStyles.body1Medium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppValues.horizontalPadding),
                  child: Column(
                    children: [
                      SocialLoginButton(
                        buttonText: "카카오로 계속하기",
                        buttonColor: AppColors.kakao,
                        assetName: AssetPaths.kakaoIcon,
                        onTapFunction: () {
                          Navigator.of(context)
                              .popAndPushNamed(RoutePaths.Home);
                        },
                      ),
                      const SizedBox(height: 14),
                      SocialLoginButton(
                        buttonText: "네이버로 계속하기",
                        buttonColor: AppColors.naver,
                        assetName: AssetPaths.naverIcon,
                        onTapFunction: () {
                          Navigator.of(context)
                              .popAndPushNamed(RoutePaths.Home);
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
