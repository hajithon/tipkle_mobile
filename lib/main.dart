import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipkle/ui/router.dart' as router;
import 'package:tipkle/core/constants/route_paths.dart';
import 'package:tipkle/provider_setting.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'tipkle',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.background,
            iconTheme: IconThemeData(
              color: AppColors.primary,
            ),
            actionsIconTheme: IconThemeData(
              color: AppColors.white,
            ),
          ),
        ),
        initialRoute: RoutePaths.Home,
        onGenerateRoute: router.Router.generateRoute,
      ),
    );
  }
}
