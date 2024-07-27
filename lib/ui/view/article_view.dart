import 'package:flutter/material.dart';
import 'package:tipkle/core/constants/app_values.dart';
import 'package:tipkle/core/viewmodels/article_viewmodel.dart';
import 'package:tipkle/ui/widget/article_appbar.dart';
import 'package:tipkle/ui/widget/article_postit.dart';
import 'package:tipkle/ui/widget/base_widget.dart';

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
                      padding: EdgeInsets.symmetric(
                        horizontal: AppValues.horizontalPadding,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: _appBarHeight,
                          ),
                          SizedBox(height: 20),
                          ArticlePostit(),
                          SizedBox(height: 20),
                          ArticlePostit(),
                          SizedBox(height: 20),
                          ArticlePostit(),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Column(
                children: [
                  ArticleAppbar(key: _appBarKey),
                  Spacer(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
