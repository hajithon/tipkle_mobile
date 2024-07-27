import 'package:flutter/material.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';

class TipkleAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TipkleAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.body1Medium,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
