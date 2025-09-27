import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/styels/app_colors.dart';
import '../core/styels/app_text_styles.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final projects = [
      {
        'title': 'Inventory Intel ',
        'description':
            'Built an enterprise app for tracking inventory and forecasting trends using real factory datasets.'
                ' Delivered interactive charts for raw materials, products, and cash flow, with professional PDF report generation for '
                'decision-making. Structured with MVVM and API-driven analytics for scalability. ',
        'tech': [
          'Flutter',
          'MVVM',
          'Dio',
          'Charts',
          'PDF Generation (Uint8List)'
        ],
        'image': 'assets/images/project1.png',
        'link': '',
        'imageLeft': true,
      },
      {
        'title': 'Souqly - E-commerce App',
        'description':
            'Developed a full shopping experience with secure authentication, product browsing, cart, wishlist, and checkout. '
                'Integrated payments and applied Clean Architecture + Cubit to ensure maintainable, '
                'testable flows. Optimized for smooth performance and responsive design ',
        'tech': [
          'Clean Architecture',
          'Cubit',
          'api',
          'Secure Storage',
          'Payments Integration'
        ],
        'image': 'assets/images/project2.png',
        'link': 'https://github.com/alaaHesham31/souqly_app',
        'imageLeft': false,
      },
      {
       'title': 'Event Planning App',
  'description':
      'The Event Planning App makes personal event management effortless. '
      'Users can create and organize events with precise locations using Google Maps, '
      'store and sync event details in Firebase Firestore, navigate directly to venues, '
      'and enjoy a personalized experience with localization and custom theming.',

  'tech': [
    'MVVM',
    'Firebase Auth',
    'Firestore',
    'Google Maps',
    'Testing (Unit & Widget)',
  ],
        'image': 'assets/images/project3.png',
        'link': 'https://github.com/alaaHesham31/event-planning-app',
        'imageLeft': true,
      },
      {
        'title': 'Islami App',
        'description':
        'The Islami App brings together essential Islamic features in one polished mobile experience. '
            'It provides offline access to Quran and Ahadith, daily Azkar, an integrated Islamic radio, '
            'accurate prayer time calculation with reminders, and the ability to download and listen '
            'to Surahs from different reciters — all designed for smooth offline use.',
        'tech': [
          'Clean Architecture',
          'Riverpod',
          'Hive',
          'API Integration',
          'Offline Caching',
          'Testing (Unit & Widget)',
        ],
        'image': 'assets/images/project4.png',
        'link': 'https://github.com/alaaHesham31/islami_app',
        'imageLeft': false,
      },
    ];
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 100,
      ),
      color: AppColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Section Title ---
          Row(
            children: [
              Text("03. ", style: AppTextStyles.titleSmall(context)),
              const SizedBox(width: 10),
              Text("Some Things I've Built",
                  style: AppTextStyles.titleMedium(context)),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 1,
                  color: AppColors.whiteColor.withOpacity(0.3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60), // --- Projects ---
          Column(
            children: List.generate(projects.length, (i) {
              final project = projects[i];
              final widget = _buildProjectCard(
                context,
                isMobile,
                index: i,
                title: project['title'] as String,
                description: project['description'] as String,
                tech: List<String>.from(project['tech'] as List),
                image: project['image'] as String,
                link: project['link'] as String,
                imageLeft: project['imageLeft'] as bool,
              );
              if (i != projects.length - 1) {
                return Column(
                  children: [widget, const SizedBox(height: 100)],
                );
              } else {
                return widget;
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    bool isMobile, {
    required int index,
    required String title,
    required String description,
    required List<String> tech,
    required String image,
    required String link,
    required bool imageLeft,
  }) {
    final bool isRepo = link.contains("github.com");

    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        height: isMobile ? 220 : 400,
        width: double.infinity,
      ),
    );
    final descriptionCard = Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Text(
        description,
        style: AppTextStyles.bodyGrey(context).copyWith(
          height: 1.5,
          color: Colors.white70,
        ),
      ),
    );
    // --- Mobile layout ---
    if (isMobile) {
      return Column(
        key: ValueKey('mobileLayout-$index'),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imageWidget,
          const SizedBox(height: 20),
          Text("Featured Project", style: AppTextStyles.captionGreen(context)),
          const SizedBox(height: 6),
          Text(title, style: AppTextStyles.titleMedium(context)),
          const SizedBox(height: 20),
          descriptionCard,
          const SizedBox(height: 20),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: tech
                .map((t) => Text(t, style: AppTextStyles.bodyGrey(context)))
                .toList(),
          ),
          const SizedBox(height: 12),
          if (link.isNotEmpty)
            TextButton.icon(
              onPressed: () => launchUrl(Uri.parse(link)),
              icon: Icon(
                isRepo ? FontAwesomeIcons.github : FontAwesomeIcons.link,
                size: 18,
                color: Colors.white,
              ),
              label: Text(
                isRepo ? "GitHub Repo" : "Live Demo",
                style: AppTextStyles.bodyGrey(context).copyWith(color: Colors.white),
              ),
            ),

        ],
      );
    }
    // --- Desktop layout ---
    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Featured Project", style: AppTextStyles.captionGreen(context)),
        const SizedBox(height: 6),
        Text(title, style: AppTextStyles.titleMedium(context)),
        const SizedBox(height: 20),

        Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: 0.9, // take ~85% of column width
            child: descriptionCard,
          ),
        ),

        const SizedBox(height: 40),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: tech
              .map((t) => Text(t, style: AppTextStyles.bodyGrey(context)))
              .toList(),
        ),
        const SizedBox(height: 12),
        if (link.isNotEmpty)
          TextButton.icon(
            onPressed: () => launchUrl(Uri.parse(link)),
            icon: Icon(
              isRepo ? FontAwesomeIcons.github : FontAwesomeIcons.link,
              size: 18,
              color: Colors.white,
            ),
            label: Text(
              isRepo ? "GitHub Repo" : "Live Demo",
              style: AppTextStyles.bodyGrey(context).copyWith(color: Colors.white),
            ),
          ),



      ],
    );

    return Row(
      key: ValueKey('desktopLayout-$index'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: imageLeft
          ? [
              Expanded(flex: 5, child: imageWidget),
              const SizedBox(width: 40),
              Expanded(flex: 5, child: textColumn),
            ]
          : [
              Expanded(flex: 5, child: textColumn),
              const SizedBox(width: 40),
              Expanded(flex: 5, child: imageWidget),
            ],
    );
  }
}
