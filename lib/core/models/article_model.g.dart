// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      title: json['title'] as String,
      dilemma_id: (json['dilemma_id'] as num).toInt(),
      description: json['description'] as String?,
      dilemma1: json['dilemma1'] as String,
      dilemma2: json['dilemma2'] as String,
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
      like: (json['like'] as num).toInt(),
      upload_date: DateTime.parse(json['upload_date'] as String),
      author_nickname: json['author_nickname'] as String,
      author_id: (json['author_id'] as num).toInt(),
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'dilemma_id': instance.dilemma_id,
      'description': instance.description,
      'dilemma1': instance.dilemma1,
      'dilemma2': instance.dilemma2,
      'image1': instance.image1,
      'image2': instance.image2,
      'like': instance.like,
      'upload_date': instance.upload_date.toIso8601String(),
      'author_nickname': instance.author_nickname,
      'author_id': instance.author_id,
    };
