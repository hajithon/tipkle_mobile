import 'package:flutter/material.dart';
import 'package:tipkle/core/viewmodels/article_viewmodel.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/widget/base_widget.dart';

class BookmarkedQuestionView extends StatelessWidget {
  const BookmarkedQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ArticleViewmodel>(
      model: ArticleViewmodel(),
      onModelReady: (ArticleViewmodel model) => model.initModel(),
      builder: (BuildContext context, ArticleViewmodel model, _) {
        return DefaultTabController(
          initialIndex: 0,
          length: 5,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(115),
              child: AppBar(
                title: Text("작성한 팁끌보드", style: AppTextStyles.subhead3SemiBold),
                flexibleSpace: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const Spacer(),
                      TabBar(
                        splashFactory: NoSplash.splashFactory,
                        dividerColor: AppColors.lightGray,
                        indicatorColor: AppColors.primary,
                        indicatorWeight: 2.5,
                        indicatorSize: TabBarIndicatorSize.tab,
                        isScrollable: false,
                        labelColor: AppColors.primary,
                        unselectedLabelColor: AppColors.gray,
                        labelStyle: AppTextStyles.subhead4Bold,
                        unselectedLabelStyle: AppTextStyles.subhead4SemiBold,
                        tabs: const <Widget>[
                          Tab(text: 'IT'),
                          Tab(text: '예술'),
                          Tab(text: '금융'),
                          Tab(text: '음식'),
                          Tab(text: '여행'),
                        ],
                      ),
                    ],
                  ),
                ),
                automaticallyImplyLeading: false,
              ),
            ),
            body: TabBarView(children: <Widget>[
              ListView(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("클라우드 비용 절감 방법 추천해주세요",
                              style: AppTextStyles.body2Regular),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(),
              Container(),
              Container(),
              Container(),
            ]),
          ),
        );
      },
    );
  }
}
