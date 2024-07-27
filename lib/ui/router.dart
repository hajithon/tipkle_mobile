import 'package:tipkle/core/constants/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:tipkle/ui/view/article_view.dart';
import 'package:tipkle/ui/view/home_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.Article:
        return MaterialPageRoute(builder: (_) => ArticleView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
