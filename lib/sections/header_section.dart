import 'package:flutter/material.dart';
import '../core/styels/app_colors.dart';
import '../core/styels/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String number;
  final String title;

  const SectionHeader({
    super.key,
    required this.number,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          style: AppTextStyles.bodyGreen(context),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTextStyles.titleMedium(context),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Divider(
            color: AppColors.greyColor.withOpacity(0.3),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
