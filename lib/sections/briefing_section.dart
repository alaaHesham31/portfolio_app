import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../core/styels/app_colors.dart';
import '../core/styels/app_text_styles.dart';

class BriefingSection extends StatefulWidget {
  const BriefingSection({super.key});

  @override
  State<BriefingSection> createState() => _BriefingSectionState();
}

class _BriefingSectionState extends State<BriefingSection>
    with TickerProviderStateMixin {
  final List<Map<String, dynamic>> _caseFiles = [
    {
      'title': 'Deep Specialist — Flutter',
      'detail':
      'I build production-ready Flutter apps with focus on performance, state management, and reliable cross-platform delivery.',
      'chips': ['Flutter', 'State Management', 'Cross-platform']
    },
    {
      'title': 'UX Principles',
      'detail':
      'Backed by formal UX coursework — I design apps that feel intuitive and smooth, balancing responsive layouts, theming, and localization.',
      'chips': ['UX Course', 'Responsive UI', 'Localization']
    },
    {
      'title': 'System Analysis',
      'detail':
      'Gained foundations through a feasibility study (requirements, ERD, workflows) and apply them by mapping features to real use cases.',
      'chips': ['Requirements', 'ERD', 'Workflows']
    },
    {
      'title': 'Frontend & Product Mindset',
      'detail':
      'Nearly one year of frontend experience plus Jira/Scrum simulations taught me to think beyond coding — managing backlogs and shaping complete products.',
      'chips': ['Frontend', 'Jira/Scrum', 'Product Thinking']
    },

  ];


  late List<bool> _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = List<bool>.filled(_caseFiles.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100, vertical: 100),
      color: AppColors.primaryColor,
      child: LayoutBuilder(builder: (context, constraints) {
        return isMobile ? _buildColumnLayout() : _buildTwoColumnLayout();
      }),
    );
  }

  Widget _buildColumnLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTitleBlock(isMobile: true),
        const SizedBox(height: 30),
        ...List.generate(
            _caseFiles.length, (i) => _buildExpandableCard(i, isMobile: true)),
        const SizedBox(height: 28),
        _buildProcessTimeline(isMobile: true),
      ],
    );
  }

  Widget _buildTwoColumnLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleBlock(isMobile: false),
              const SizedBox(height: 28),
              ...List.generate(_caseFiles.length,
                      (i) => _buildExpandableCard(i, isMobile: false)),
            ],
          ),
        ),
        const SizedBox(width: 48),
        Expanded(
          flex: 4,
          child: _buildProcessTimeline(isMobile: false),
        ),
      ],
    );
  }

  Widget _buildTitleBlock({required bool isMobile}) {
    return Column(
      crossAxisAlignment:
      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("04. ",
                style: AppTextStyles.titleSmall(context)),
            const SizedBox(width: 10),
            Text(
              "THE BRIEFING",
              style: AppTextStyles.titleLarge(context),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 36,
          child: DefaultTextStyle(
            style: AppTextStyles.bodyWhite(context),
            child: AnimatedTextKit(
              isRepeatingAnimation: false,
              totalRepeatCount: 1,
              animatedTexts: [
                TypewriterAnimatedText(
                  "A concise dossier — not just about code. It’s about building polished products.",
                  speed: const Duration(milliseconds: 35),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "You should know everything about one thing, and know one thing about everything. "
              "Below is proof — courses, tools, real work and a product-first mindset. "
              "Click any file to reveal precise outcomes.",
          style: AppTextStyles.bodyGrey(context).copyWith(height: 1.5),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
      ],
    );
  }

  Widget _buildExpandableCard(int index, {required bool isMobile}) {
    final title = _caseFiles[index]['title']!;
    final detail = _caseFiles[index]['detail']!;

    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 12 : 18),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _expanded[index] = !_expanded[index];
          });
        },
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: 18, vertical: _expanded[index] ? 18 : 14),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.88),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _expanded[index]
                    ? AppColors.greenColor.withOpacity(0.9)
                    : Colors.transparent,
                width: 1.2,
              ),
              boxShadow: _expanded[index]
                  ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.28),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                )
              ]
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: AppColors.greenColor.withOpacity(0.9),
                            width: 1.2),
                      ),
                      child: const Center(
                        child: Icon(Icons.folder_open,
                            size: 18, color: AppColors.greenColor),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(title,
                          style: AppTextStyles.titleMedium(context)),
                    ),
                    AnimatedRotation(
                      turns: _expanded[index] ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        _expanded[index]
                            ? Icons.expand_less
                            : Icons.expand_more,
                        color: AppColors.whiteColor.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),

                if (_expanded[index]) ...[
                  const SizedBox(height: 12),
                  Text(
                    detail,
                    style: AppTextStyles.bodyGrey(context).copyWith(height: 1.5),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: List.generate(
                      (_caseFiles[index]['chips'] as List<String>).length,
                          (j) => _buildMiniChip(_caseFiles[index]['chips'][j]),
                    ),
                  ),

                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMiniChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.greenColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: AppTextStyles.captionGreen(context)),
    );
  }

  Widget _buildProcessTimeline({required bool isMobile}) {
    final steps = [
      {"title": "Idea → Discovery", "sub": "Understanding requirements & framing product goals"},
      {"title": "Design", "sub": "Wireframes, simple flows & UX validation"},
      {"title": "Develop", "sub": "Building features with Flutter & testing components"},
      {"title": "Test", "sub": "Unit tests, widget tests & manual checks for reliability"},
      {"title": "Deliver", "sub": "Handover of a polished app ready for real users"},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Process", style: AppTextStyles.titleMedium(context)),
          const SizedBox(height: 12),
          Column(
            children: List.generate(steps.length, (i) {
              final s = steps[i];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: AppColors.greenColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        if (i != steps.length - 1)
                          Container(
                            width: 2,
                            height: 48,
                            color: AppColors.whiteColor.withOpacity(0.06),
                          ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(s['title']!,
                              style: AppTextStyles.titleSmall(context)),
                          const SizedBox(height: 6),
                          Text(s['sub']!,
                              style: AppTextStyles.bodyGrey(context)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),

        ],
      ),
    );
  }
}
