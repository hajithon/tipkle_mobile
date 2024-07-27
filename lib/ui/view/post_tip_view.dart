import 'package:flutter/material.dart';
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
                    model.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
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
