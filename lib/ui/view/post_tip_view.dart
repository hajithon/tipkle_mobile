import 'package:flutter/material.dart';
import 'package:tipkle/core/viewmodels/post_tip_viewmodel.dart';
import 'package:tipkle/ui/widget/base_widget.dart';

class PostTipView extends StatefulWidget {
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
        return Scaffold(
          appBar: AppBar(
            title: Text("질문 글 올리기"),
          ),
        );
      },
    );
  }
}
