import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/styels/app_colors.dart';
import '../core/styels/app_text_styles.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  final PageController _pageController = PageController();
  final experiences = [
    {
      "company": "Inventory Intel – Capstone Project",
      "role": "Flutter Developer",
      "date": "2025 – present",
      "description":
      "Developed an inventory management app with analytics, charts, and PDF reporting. Applied system analysis with real datasets to align features with business workflows.",
    },
    {
      "company": "Freelance",
      "role": "Flutter Developer",
      "date": "2024 – present",
      "description":
      "Equipped with the skills to handle freelance or client projects — from authentication and REST APIs to payments and deployment — with a focus on clear requirements, collaboration, and polished delivery."
    },
    {
      "company": "Freelance",
      "role": "Frontend Developer",
      "date": "Feb 2022 – Nov 2022",
      "description":
      "Built an agriculture management system with a responsive UI. Worked directly with the client to translate requirements into usable workflows.",
    },
  ];




  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 100,
      ),
      color: AppColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Section title ---
          Row(
            children: [
              Text("02. ", style: AppTextStyles.titleSmall(context)),
              const SizedBox(width: 10),
              Text("Where I've Worked", style: AppTextStyles.titleMedium(context)),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 1,
                  color: AppColors.whiteColor.withOpacity(0.3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),

          // --- Horizontal scroll with PageView ---
          SizedBox(
            height: isMobile ? 240 : 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                final exp = experiences[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: _buildExperienceCard(
                    context: context,
                    company: exp["company"]!,
                    role: exp["role"]!,
                    date: exp["date"]!,
                    description: exp["description"]!,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // --- Dot Indicator ---
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: experiences.length,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.greenColor,
                dotColor: Colors.white24,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
                spacing: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard({
    required BuildContext context,
    required String company,
    required String role,
    required String date,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.95),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(role, style: AppTextStyles.navButtonGreen(context)),
          const SizedBox(height: 8),
          Text(description,
              style: AppTextStyles.bodyGrey(context).copyWith(height: 1.6)),
          const SizedBox(height: 12),
          Text(company, style: AppTextStyles.captionGreen(context)),
          Text(date, style: AppTextStyles.captionWhite(context)),
        ],
      ),
    );
  }
}
