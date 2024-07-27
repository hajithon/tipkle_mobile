import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tipkle/core/constants/app_values.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';

class SearchTextField extends StatelessWidget {
  final bool showBackButton;
  final VoidCallback onBackPressed;

  const SearchTextField({
    super.key,
    required this.showBackButton,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: AppColors.primary,
      style: AppTextStyles.body1Regular,
      decoration: InputDecoration(
        hintText: "팁끌보드 제목을 입력해보세요",
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        fillColor: AppColors.cardBackground,
        filled: true,
        prefixIconConstraints: const BoxConstraints(
            minWidth: AppValues.textFieldHeight,
            minHeight: AppValues.textFieldHeight),
        prefixIcon: showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: onBackPressed,
              )
            : Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(AssetPaths.searchIcon),
              ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
