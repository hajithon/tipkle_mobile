import 'package:flutter/material.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/core/viewmodels/post_tip_viewmodel.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';

class SetRangePage extends StatefulWidget {
  const SetRangePage({super.key, required this.model});

  final PostTipViewmodel model;

  @override
  State<SetRangePage> createState() => _SetRangePageState();
}

class _SetRangePageState extends State<SetRangePage> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "팁끌 작성 가능 범위를 선택해주세요.",
            style: AppTextStyles.headlineSemiBold,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ToggleOption(
                    title: "누구나\n팁끌을 쓸 수 있어요!",
                    description:
                        "해당 카테고리의 전문가와 비전문가 모두 댓글을\n쓸 수 있어 조금 더 광범위한 정보를 얻을 수 있어요.",
                    assetName: AssetPaths.normalImage,
                    isSelected: widget.model.isSelected[0],
                    onTapFunction: () {
                      widget.model.selectRange(0);
                    },
                  ),
                  const SizedBox(height: 16),
                  ToggleOption(
                    title: "전문가만\n팁끌을 쓸 수 있어요!",
                    description:
                        "해당 카테고리의 검증된 전문가만 댓글을 쓸 수 있어\n조금 더 전문적인 정보를 얻을 수 있어요.",
                    assetName: AssetPaths.expertImage,
                    isSelected: widget.model.isSelected[1],
                    onTapFunction: () {
                      widget.model.selectRange(1);
                    },
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

class ToggleOption extends StatelessWidget {
  const ToggleOption(
      {super.key,
      required this.title,
      required this.description,
      required this.isSelected,
      required this.onTapFunction,
      required this.assetName});

  final String title;
  final String description;
  final bool isSelected;
  final Function() onTapFunction;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.cardBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 33),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    title,
                    style: AppTextStyles.subhead4SemiBold.copyWith(
                        color: isSelected ? AppColors.white : AppColors.black),
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  Image.asset(
                    assetName,
                    width: 100,
                    height: 80,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 43),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                description,
                style: AppTextStyles.body1Medium.copyWith(
                    color:
                        isSelected ? AppColors.white : const Color(0xFF798187)),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
