import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/core/viewmodels/home_viewmodel.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/widget/base_widget.dart';
import 'package:tipkle/ui/widget/tipkle_search_textfield.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isSearching = false;

  void _onSearchFieldFocusChange(bool hasFocus) {
    setState(() {
      _isSearching = hasFocus;
    });
  }

  void _exitSearch() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isSearching = false;
    });
  }

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
              preferredSize: const Size.fromHeight(115),
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
                            Expanded(
                              child: Focus(
                                onFocusChange: _onSearchFieldFocusChange,
                                child: SizedBox(
                                  height: 40,
                                  child: SearchTextField(
                                    showBackButton: _isSearching,
                                    onBackPressed: _exitSearch,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: SvgPicture.asset(AssetPaths.userIcon),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      if (!_isSearching) ...[
                        TabBar(
                          splashFactory: NoSplash.splashFactory,
                          dividerColor: AppColors.lightGray,
                          indicatorColor: AppColors.black,
                          indicatorWeight: 2.5,
                          indicatorSize: TabBarIndicatorSize.tab,
                          isScrollable: false,
                          labelColor: AppColors.black,
                          unselectedLabelColor: AppColors.lightGray,
                          labelStyle: AppTextStyles.body3Medium,
                          tabs: const <Widget>[
                            Tab(text: 'IT'),
                            Tab(text: '예술'),
                            Tab(text: '금융'),
                            Tab(text: '음식'),
                            Tab(text: '여행'),
                          ],
                        ),
                      ] else ...[
                        const Center(
                          child: Text('검색 중...'),
                        ),
                      ],
                    ],
                  ),
                ),
                automaticallyImplyLeading: false,
              ),
            ),
            body: _isSearching
                ? const Center(child: Text('검색 결과를 보여줍니다.'))
                : TabBarView(
                    children: <Widget>[
                      Center(child: Text('탭 1의 내용')),
                      Center(child: Text('탭 2의 내용')),
                      Center(child: Text('탭 3의 내용')),
                      Center(child: Text('탭 4의 내용')),
                      Center(child: Text('탭 5의 내용')),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
