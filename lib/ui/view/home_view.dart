import 'package:flutter/material.dart';
import 'package:tipkle/core/viewmodels/home_viewmodel.dart';
import 'package:tipkle/ui/widget/base_widget.dart';
import 'package:tipkle/ui/widget/search_textfield.dart';

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
              preferredSize: const Size.fromHeight(125),
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
                                child: SearchTextField(
                                  showBackButton: _isSearching,
                                  onBackPressed: _exitSearch,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.settings),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      if (!_isSearching) ...[
                        const TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          isScrollable: false,
                          tabs: <Widget>[
                            Tab(text: '탭 1'),
                            Tab(text: '탭 2'),
                            Tab(text: '탭 3'),
                            Tab(text: '탭 4'),
                            Tab(text: '탭 5'),
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
