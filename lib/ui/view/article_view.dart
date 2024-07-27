import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tipkle/core/constants/app_values.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/core/viewmodels/article_viewmodel.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/widget/article_appbar.dart';
import 'package:tipkle/ui/widget/article_postit.dart';
import 'package:tipkle/ui/widget/base_widget.dart';
import 'package:tipkle/ui/widget/tipkle_button.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({super.key});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final GlobalKey _appBarKey = GlobalKey();
  double _appBarHeight = 0;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ArticleViewmodel>(
      model: ArticleViewmodel(),
      onModelReady: (ArticleViewmodel model) => model.initModel(),
      builder: (BuildContext context, ArticleViewmodel model, _) {
        return Scaffold(
          body: Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    final appBarRenderBox = _appBarKey.currentContext
                        ?.findRenderObject() as RenderBox?;
                    if (appBarRenderBox != null) {
                      final appBarHeight = appBarRenderBox.size.height;
                      if (_appBarHeight != appBarHeight) {
                        setState(() {
                          _appBarHeight = appBarHeight;
                        });
                      }
                    }
                  });

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppValues.horizontalPadding,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: _appBarHeight,
                          ),
                          const SizedBox(height: 20),
                          const ArticlePostit(
                            index: 0,
                            tagText: "#디자인",
                            contents: [
                              "스마트 애니메이션으로 자연스러운 전환 만들기",
                              "컴포넌트 활용으로 반복 작업 줄이기",
                              "팀 라이브러리 공유로 일관성 유지하기",
                            ],
                          ),
                          const SizedBox(height: 20),
                          const ArticlePostit(
                            index: 1,
                            tagText: "#플러그인",
                            contents: [
                              "스타일 가이드를 미리 설정해두기",
                              "Auto Layout으로 반응형 디자인 구현",
                              "마스터 컴포넌트로 전체 변경 간편하게",
                            ],
                          ),
                          const SizedBox(height: 20),
                          const ArticlePostit(
                            index: 2,
                            tagText: "#UX/UI",
                            contents: [
                              "Autoflow라는 플러그인 좋아요",
                              "Re Named It으로 레이어 이름 자동으로 편리하고 명확히 설정하기",
                              "색상 스타일 미리 정의해두기",
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Column(
                children: [
                  ArticleAppbar(key: _appBarKey, model: model),
                  Spacer(),
                ],
              ),
            ],
          ),
          floatingActionButton: Container(
            width: 70,
            height: 70,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: const Color(0xF01A1A1A),
                          child: Column(
                            children: [
                              const Spacer(),
                              Text(
                                "소주제를 선택한 후\n나의 끌팁을 작성해주세요",
                                style: AppTextStyles.display1Bold
                                    .copyWith(color: AppColors.white),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppValues.horizontalPadding),
                                child: TipTextField(
                                    tipController: TextEditingController(),
                                    onChangedFunction: (String value) {}),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    TipkleButton(
                                      buttonText: "나의 꿀팁 붙이기",
                                      onTapFunction: () {
                                        Navigator.of(context).pop();
                                        _showToast(context, "꿀팁 붙이기 완료!");
                                      },
                                      available: true,
                                    ),
                                    const SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: AppValues.buttonHeight,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: AppColors.gray,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "취소하기",
                                            style: AppTextStyles
                                                .subhead4SemiBold
                                                .copyWith(
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                            ],
                          ));
                    },
                  );
                },
                backgroundColor: AppColors.primary,
                shape: const CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AssetPaths.addIcon),
                ),
                elevation: 0,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}

class TipTextField extends StatelessWidget {
  const TipTextField(
      {super.key,
      required this.tipController,
      required this.onChangedFunction});
  final TextEditingController tipController;
  final void Function(String) onChangedFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: TextField(
        controller: tipController,
        maxLength: 100,
        maxLines: 20,
        onChanged: onChangedFunction,
        decoration: InputDecoration(
          hintText: '당신의 끌팁을 마음껏 공유해주세요!',
          hintStyle: AppTextStyles.body1Medium
              .copyWith(color: const Color(0xFFB7C0C6)),
          fillColor: AppColors.cardBackground,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          counterText: '',
        ),
      ),
    );
  }
}

void _showToast(BuildContext context, String message) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  scaffoldMessenger.showSnackBar(
    SnackBar(
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AssetPaths.tipImage,
              width: 40,
              height: 40,
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: AppTextStyles.headlineBold,
                  ),
                  Text(
                    "다른 끌팁도 둘러볼까요?",
                    style: AppTextStyles.body1Regular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xFF373D42),
      duration: const Duration(seconds: 2),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 280,
        right: 20,
        left: 20,
      ),
    ),
  );
}
