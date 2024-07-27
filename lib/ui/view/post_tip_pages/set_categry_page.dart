import 'package:flutter/material.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/core/viewmodels/post_tip_viewmodel.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';

class SetCategoryPage extends StatefulWidget {
  const SetCategoryPage({super.key, required this.model});

  final PostTipViewmodel model;

  @override
  State<SetCategoryPage> createState() => _SetCategoryPageState();
}

class _SetCategoryPageState extends State<SetCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "원하는 카테고리를 선택해주세요.",
            style: AppTextStyles.headlineSemiBold,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              children: [
                CategoryButton(
                  assetName: AssetPaths.financialImage,
                  tapped: widget.model.categorySelected[0],
                  onTapFunction: () {
                    widget.model.changeCategoryToggle(0);
                  },
                ),
                CategoryButton(
                  assetName: AssetPaths.itImage,
                  tapped: widget.model.categorySelected[1],
                  onTapFunction: () {
                    widget.model.changeCategoryToggle(1);
                  },
                ),
                CategoryButton(
                  assetName: AssetPaths.foodImage,
                  tapped: widget.model.categorySelected[2],
                  onTapFunction: () {
                    widget.model.changeCategoryToggle(2);
                  },
                ),
                CategoryButton(
                  assetName: AssetPaths.artImage,
                  tapped: widget.model.categorySelected[3],
                  onTapFunction: () {
                    widget.model.changeCategoryToggle(3);
                  },
                ),
                CategoryButton(
                  assetName: AssetPaths.travelImage,
                  tapped: widget.model.categorySelected[4],
                  onTapFunction: () {
                    widget.model.changeCategoryToggle(4);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {super.key,
      required this.tapped,
      required this.onTapFunction,
      required this.assetName});

  final bool tapped;
  final void Function() onTapFunction;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: tapped ? AppColors.primary : AppColors.cardBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Image.asset(assetName),
        ),
      ),
    );
  }
}
