import 'package:flutter/material.dart';
import 'package:tipkle/core/viewmodels/article_viewmodel.dart';
import 'package:tipkle/ui/widget/article_appbar.dart';
import 'package:tipkle/ui/widget/base_widget.dart';

class ArticleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ArticleViewmodel>(
      model: ArticleViewmodel(),
      onModelReady: (ArticleViewmodel model) => model.initModel(),
      builder: (BuildContext context, ArticleViewmodel model, _) {
        return Scaffold(
          appBar: ArticleAppBar(),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text('내용 추가 1'),
                SizedBox(height: 20),
                Text('내용 추가 2'),
                SizedBox(height: 20),
                Text('내용 추가 3'),
                SizedBox(height: 20),
                Text('내용 추가 4'),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
