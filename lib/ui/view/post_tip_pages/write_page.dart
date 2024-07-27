import 'package:flutter/material.dart';
import 'package:tipkle/core/viewmodels/post_tip_viewmodel.dart';
import 'package:tipkle/ui/design_system/app_colors.dart';
import 'package:tipkle/ui/design_system/font_styles.dart';
import 'package:tipkle/ui/widget/tag_button.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key, required this.model});

  final PostTipViewmodel model;

  @override
  State<WritePage> createState() => _SetRangePageState();
}

class _SetRangePageState extends State<WritePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "질문글 제목을 작성해주세요",
            style: AppTextStyles.headlineSemiBold,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: QuestionTextField(
            questionController: widget.model.questionEditingController,
            onChangedFunction: widget.model.changeQuestionTextState,
          ),
        ),
        const SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "관련 소주제 키워드를 선택해주세요",
            style: AppTextStyles.headlineSemiBold,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            alignment: WrapAlignment.center,
            children: widget.model.tagData.asMap().entries.map(
              (entry) {
                final index = entry.key;
                final tag = entry.value;
                return TagButton(
                  text: tag.tagtitle,
                  tapped: tag.isSelected,
                  onTapFunction: () {
                    widget.model.changeTagState(index);
                  },
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}

class QuestionTextField extends StatelessWidget {
  const QuestionTextField(
      {super.key,
      required this.questionController,
      required this.onChangedFunction});
  final TextEditingController questionController;
  final void Function(String) onChangedFunction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 150,
          child: TextField(
            controller: questionController,
            maxLength: 100,
            maxLines: 20,
            onChanged: onChangedFunction,
            decoration: InputDecoration(
              hintText: '질문글은 최대한 구체적으로 작성해주세요',
              hintStyle: AppTextStyles.body1Medium
                  .copyWith(color: const Color(0xFFB7C0C6)),
              fillColor: AppColors.cardBackground,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              counterText: '',
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, bottom: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "100자 이내",
                style: AppTextStyles.body1Medium.copyWith(
                  color: const Color(0xFF798187),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
