// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  final String title;
  final int dilemma_id;
  final String? description;
  final String dilemma1;
  final String dilemma2;
  final String? image1;
  final String? image2;
  final int like;
  final DateTime upload_date;
  final String author_nickname;
  final int author_id;

  ArticleModel({
    required this.title,
    required this.dilemma_id,
    this.description,
    required this.dilemma1,
    required this.dilemma2,
    this.image1,
    this.image2,
    required this.like,
    required this.upload_date,
    required this.author_nickname,
    required this.author_id,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
