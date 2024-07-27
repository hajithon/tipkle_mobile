import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tipkle/core/constants/asset_paths.dart';
import 'package:tipkle/core/viewmodels/post_tip_viewmodel.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/widget/tag_button.dart';

class LastCheckPage extends StatefulWidget {
  const LastCheckPage({super.key, required this.model});

  final PostTipViewmodel model;

  @override
  State<LastCheckPage> createState() => _LastCheckPageState();
}

class _LastCheckPageState extends State<LastCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "마지막으로 확인해주세요",
            style: AppTextStyles.headlineSemiBold,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "카테고리 | IT",
                        style: AppTextStyles.body1Medium.copyWith(
                          color: const Color(0xFF798187),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(widget.model.questionText,
                          style: AppTextStyles.body1Medium),
                      const Spacer(),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        alignment: WrapAlignment.center,
                        children: widget.model.tagData
                            .where((tag) => tag.isSelected)
                            .map(
                              (tag) => TagButton(
                                text: tag.tagtitle,
                                tapped: true,
                                onTapFunction: () {},
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ToggleListCell(
                    text: "구체적으로 질문글을 작성하셨나요?",
                    selected: widget.model.toggleSelected[0],
                    onTapFunction: () {
                      widget.model.changeToggle(0);
                    },
                  ),
                  const SizedBox(height: 5),
                  ToggleListCell(
                    text: "적절한 소주제 키워드를 선택하셨나요?",
                    selected: widget.model.toggleSelected[1],
                    onTapFunction: () {
                      widget.model.changeToggle(1);
                    },
                  ),
                  const SizedBox(height: 5),
                  ToggleListCell(
                    text: "중복된 질문이 있는지 확인하셨나요?",
                    selected: widget.model.toggleSelected[2],
                    onTapFunction: () {
                      widget.model.changeToggle(2);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ToggleListCell extends StatelessWidget {
  const ToggleListCell(
      {super.key,
      required this.selected,
      required this.text,
      required this.onTapFunction});

  final bool selected;
  final String text;
  final void Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Row(
        children: [
          selected
              ? SvgPicture.asset(
                  AssetPaths.selectedIcon,
                  width: 18,
                )
              : SvgPicture.asset(
                  AssetPaths.unSelectedIcon,
                  width: 18,
                ),
          const SizedBox(width: 10),
          Text(
            text,
            style: AppTextStyles.body2Medium.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
