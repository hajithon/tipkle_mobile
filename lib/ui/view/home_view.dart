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
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppValues.horizontalPadding),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 9) {
                          return const SizedBox(height: 200, width: 300);
                        }
                        return const ArticleCard();
                      },
                    ),
                    Center(child: Text('탭 2의 내용')),
                    Center(child: Text('탭 3의 내용')),
                    Center(child: Text('탭 4의 내용')),
                    Center(child: Text('탭 5의 내용')),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0),
                          Colors.white.withOpacity(0.4),
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
