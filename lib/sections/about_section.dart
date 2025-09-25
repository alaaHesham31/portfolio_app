import 'package:flutter/material.dart';
import '../core/styels/app_colors.dart';
import '../core/styels/app_text_styles.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;
    final isTablet = width >= 800 && width < 1200;

    // 🔹 Adaptive padding
    final double horizontalPadding = isMobile ? 20 : (isTablet ? 60 : 100);
    final double verticalPadding = isMobile ? 60 : (isTablet ? 80 : 100);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      color: AppColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Row(
            children: [
              Text("01. ", style: AppTextStyles.titleSmall(context)),
              const SizedBox(width: 10),
              Text("About Me", style: AppTextStyles.titleLarge(context)),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 1,
                  color: AppColors.whiteColor.withOpacity(0.3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Layout responsive
          isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextContent(context),
              const SizedBox(height: 40),
              _buildImage(),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: _buildTextContent(context)),
              const SizedBox(width: 40),
              Expanded(flex: 2, child: _buildImage()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, I’m Alaa — a Mobile Software Engineer who loves turning ideas into polished apps that people actually enjoy using. "
              "I don’t just write code; I think through the whole journey — from understanding requirements and designing workflows, "
              "to building smooth features, testing for reliability, and ensuring a great user experience.\n\n"
              "I’ve built apps in e-commerce, inventory, lifestyle, and event planning — "
              "covering authentication, payments, Google Maps, offline access, Firebase, notifications, and more. "
              "My focus is always on delivering real, usable products that feel professional and reliable.\n",
          style: AppTextStyles.bodyGrey(context).copyWith(height: 1.6),
        ),

        // 🎓 Education & Training
        Text("Education & Training", style: AppTextStyles.titleSmall(context)),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEduItem(
              context,
              "B.Sc. in Computer Engineering",
              "Graduated 2025 — Menoufia University",
            ),
            _buildEduItem(
              context,
              "Flutter Development Diploma",
              "Route IT Training Center • 4 months",
            ),
            _buildEduItem(
              context,
              "Digital Egypt Pioneers Initiative (DEPI)",
              "Mobile App Development Track • 6 months",
            ),
          ],
        ),
        const SizedBox(height: 32),

        Text("Core Skills", style: AppTextStyles.titleSmall(context)),
        const SizedBox(height: 16),
        _buildTechList(context),
      ],
    );
  }

  Widget _buildEduItem(BuildContext context, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.school, size: 18, color: AppColors.greenColor),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "$title\n",
                style: AppTextStyles.bodyGreen(context).copyWith(
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: subtitle,
                    style: AppTextStyles.bodyGrey(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechList(BuildContext context) {
    final techs = [
      "Flutter",
      "State Management",
      "APIs & Payments",
      "Firebase",
      "Clean Architecture",
      "Testing",
    ];


    return Wrap(
      spacing: 40,
      runSpacing: 10,
      children: techs
          .map(
            (t) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.play_arrow,
                size: 16, color: AppColors.greenColor),
            const SizedBox(width: 6),
            Text(t, style: AppTextStyles.bodyGrey(context)),
          ],
        ),
      )
          .toList(),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greenColor, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          "assets/images/profile.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
