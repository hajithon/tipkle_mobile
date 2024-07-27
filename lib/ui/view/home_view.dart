import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tipkle/core/constants/app_values.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/core/constants/route_paths.dart';
import 'package:tipkle/core/viewmodels/home_viewmodel.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/widget/article_card.dart';
import 'package:tipkle/ui/widget/base_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      model: HomeViewModel(),
      onModelReady: (HomeViewModel model) => model.initModel(),
      builder: (BuildContext context, HomeViewModel model, _) {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(110),
              child: AppBar(
                flexibleSpace: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Image.asset(
                              AssetPaths.titleImage,
                              width: 100,
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(RoutePaths.Mypage);
                              },
                              child: SvgPicture.asset(AssetPaths.userIcon),
                            ),
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
            body: Stack(
              children: [
                TabBarView(
                  children: <Widget>[
                    ///////////IT////////////
                    ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppValues.horizontalPadding),
                      children: [
                        ArticleCard(
                          bookMarked: model.bookmarked[0],
                          tags: const ['#디자인', '#플러그인', '#UX/UI'],
                          title: '피그마 꿀 팁 알려주세요.',
                        ),
                        ArticleCard(
                          bookMarked: model.bookmarked[1],
                          tags: const ['#소프트웨어'],
                          title: '클라우드 비용 절감 방법 추천해주세요',
                        ),
                        ArticleCard(
                          bookMarked: model.bookmarked[2],
                          tags: const ['#디자인', '#웹', '#모바일'],
                          title: '효과적인 데이터 시각화 툴은?',
                        ),
                        ArticleCard(
                          bookMarked: model.bookmarked[3],
                          tags: const ['#인공지능', '#데이터베이스', '#코딩'],
                          title: 'AI 학습 자료 추천해주세요',
                        ),
                        ArticleCard(
                          bookMarked: model.bookmarked[4],
                          tags: const ['#데이터베이스', '#소프트웨어', '#인공지능'],
                          title: '최신 사이버 보안 트렌드는?',
                        ),
                        const SizedBox(height: 300),
                      ],
                    ),
                    ///////////IT////////////
                    Center(
                      child: Container(
                        height: 300,
                        width: 200,
                        child: Column(
                          children: [
                            Image.asset(
                              AssetPaths.expertImage,
                              width: 100,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "아직 데이터가 없어요.",
                              style: AppTextStyles.body1Medium,
                            )
                          ],
                        ),
                      ),
                    ),
                    ///////////IT////////////
                    Center(
                      child: Container(
                        height: 300,
                        width: 200,
                        child: Column(
                          children: [
                            Image.asset(
                              AssetPaths.expertImage,
                              width: 100,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "아직 데이터가 없어요.",
                              style: AppTextStyles.body1Medium,
                            )
                          ],
                        ),
                      ),
                    ),
                    ///////////IT////////////
                    Center(
                      child: Container(
                        height: 300,
                        width: 200,
                        child: Column(
                          children: [
                            Image.asset(
                              AssetPaths.expertImage,
                              width: 100,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "아직 데이터가 없어요.",
                              style: AppTextStyles.body1Medium,
                            )
                          ],
                        ),
                      ),
                    ),
                    ///////////IT////////////
                    Center(
                      child: Container(
                        height: 300,
                        width: 200,
                        child: Column(
                          children: [
                            Image.asset(
                              AssetPaths.expertImage,
                              width: 100,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "아직 데이터가 없어요.",
                              style: AppTextStyles.body1Medium,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0),
                          Colors.white.withOpacity(0.8),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: Container(
              width: 70,
              height: 70,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RoutePaths.PostTip);
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
          ),
        );
      },
    );
  }
}
