import 'package:flutter/material.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/core/viewmodels/post_tip_viewmodel.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/view/post_tip_pages/last_check_page.dart';
import 'package:tipkle/ui/view/post_tip_pages/set_categry_page.dart';
import 'package:tipkle/ui/view/post_tip_pages/set_range_page.dart';
import 'package:tipkle/ui/view/post_tip_pages/write_page.dart';
import 'package:tipkle/ui/widget/base_widget.dart';
import 'package:tipkle/ui/widget/tipkle_button.dart';

class PostTipView extends StatefulWidget {
  const PostTipView({super.key});

  @override
  _PostTipViewState createState() => _PostTipViewState();
}

class _PostTipViewState extends State<PostTipView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostTipViewmodel>(
      model: PostTipViewmodel(),
      onModelReady: (PostTipViewmodel model) => model.initModel(),
      builder: (BuildContext context, PostTipViewmodel model, _) {
        return WillPopScope(
          onWillPop: model.onWillPop,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "팁끌보드 만들기",
                style: AppTextStyles.subhead3SemiBold,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  if (model.pageController.page != 0) {
                    model.pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
            body: PageView(
              controller: model.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  model.currentPageIndex = index;
                });
              },
              children: [
                SetCategoryPage(model: model),
                SetRangePage(model: model),
                WritePage(model: model),
                LastCheckPage(model: model),
              ],
            ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TipkleButton(
                  available: model.canGoNext(),
                  buttonText: model.currentPageIndex == 3 ? "완료하기" : "다음으로",
                  onTapFunction: () {
                    if (model.currentPageIndex == 3) {
                      Navigator.of(context).pop();
                      _showToast(context, "끌팁 질문글 올리기 완료!");
                      return;
                    } else {
                      model.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
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
                    "끌팁이 달릴 때까지 기다려보아요",
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
