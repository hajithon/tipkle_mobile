import 'package:flutter/material.dart';
import 'package:tipkle/core/viewmodels/article_viewmodel.dart';
import 'package:tipkle/ui/widget/base_widget.dart';
import 'package:tipkle/ui/widget/bookmarked_question.dart';
import 'package:tipkle/ui/widget/tipkle_appbar.dart';

class BookmarkedQuestionView extends StatelessWidget {
  const BookmarkedQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ArticleViewmodel>(
      model: ArticleViewmodel(),
      onModelReady: (ArticleViewmodel model) => model.initModel(),
      builder: (BuildContext context, ArticleViewmodel model, _) {
        return Scaffold(
          appBar: TipkleAppbar(title: "title"),
          body: const SingleChildScrollView(
            child: Column(
              children: [BookmarkedQuestion()],
            ),
          ),
        );
      },
    );
  }
}
