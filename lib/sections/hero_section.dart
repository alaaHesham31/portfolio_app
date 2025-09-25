import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../core/styels/app_colors.dart';
import '../core/styels/app_text_styles.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onCheckWork;

  const HeroSection({super.key, required this.onCheckWork});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: isMobile ? 80 : 120,
      ),
      color: AppColors.primaryColor,
      child: Column(
        crossAxisAlignment:
        isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          // Small green intro text
          Text(
            "Hi, my name is",
            style: AppTextStyles.navButtonGreen(context).copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),

          // Animated Name
          AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TyperAnimatedText(
                "Alaa Elkeshki",
                textStyle: AppTextStyles.nameLarge(context),
                speed: const Duration(milliseconds: 120),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Body text
          SizedBox(
            width: isMobile ? double.infinity : 600,
            child: Text(
              "I'm a Mobile Software Engineer specializing in Flutter, building high-quality cross-platform apps with great UX, reliable performance, and clean architecture.",
              style: AppTextStyles.bodyGrey(context).copyWith(height: 1.6),
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
            ),
          ),

          const SizedBox(height: 30),

          // CTA button
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.greenColor, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              foregroundColor: AppColors.greenColor,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 32,
                vertical: isMobile ? 14 : 20,
              ),
            ),
            onPressed: onCheckWork,
            child: Text(
              "Check out my work",
              style: AppTextStyles.navButtonGreen(context).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
