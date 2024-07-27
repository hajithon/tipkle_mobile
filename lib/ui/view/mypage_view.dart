import 'package:flutter/material.dart';
import 'package:tipkle/core/viewmodels/article_viewmodel.dart';
import 'package:tipkle/ui/widget/base_widget.dart';
import 'package:tipkle/ui/widget/tipkle_appbar.dart';

class MypageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ArticleViewmodel>(
      model: ArticleViewmodel(),
      onModelReady: (ArticleViewmodel model) => model.initModel(),
      builder: (BuildContext context, ArticleViewmodel model, _) {
        return const Scaffold(
          appBar: TipkleAppbar(
            title: "마이페이지",
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
        );
      },
    );
  }
}
