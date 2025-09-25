import 'package:flutter/material.dart';
import 'package:portfolio_app/sections/about_section.dart';
import 'package:portfolio_app/sections/contact_section.dart';
import 'package:portfolio_app/sections/experience_section.dart';
import 'package:portfolio_app/sections/projects_section.dart';
import 'package:portfolio_app/widgets/nav_bar.dart';
import 'widgets/animated_scroll_builder.dart';
import 'widgets/app_drawer.dart';
import 'widgets/side_icons.dart';
import 'core/styels/app_colors.dart';
import 'sections/briefing_section.dart';
import 'sections/footer_section.dart';
import 'sections/hero_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  // All the section keys used for scrolling
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey portfolioKey = GlobalKey();
  final GlobalKey briefingKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignment: 0, // top aligned
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;
    final isTablet = width >= 800 && width < 1200;

    final double pagePadding = isMobile ? 16 : (isTablet ? 60 : 120);
    final double sectionSpacing = isMobile ? 60 : (isTablet ? 70 : 80);

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: NavBar(
        isMobile: isMobile,
        onItemTap: _scrollToSection,
        heroKey: heroKey,
        aboutKey: aboutKey,
        experienceKey: experienceKey,
        portfolioKey: portfolioKey,
        briefingKey: briefingKey,
        contactKey: contactKey,
      ),
      drawer: isMobile
          ? AppDrawer(
        onItemTap: (key) {
          Navigator.pop(context); // close the drawer first
          Future.microtask(() => _scrollToSection(key));
        },
        heroKey: heroKey,
        aboutKey: aboutKey,
        experienceKey: experienceKey,
        portfolioKey: portfolioKey,
        briefingKey: briefingKey,
        contactKey: contactKey,
      )
          : null,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.all(pagePadding),
              child: Column(
                children: [

                  HeroSection(
                    key: heroKey,
                    onCheckWork: () => _scrollToSection(portfolioKey),
                  ),
                  SizedBox(height: sectionSpacing),
                  ScrollAnimatedWidget(child: AboutSection(key: aboutKey)),

                  SizedBox(height: sectionSpacing),
                  ScrollAnimatedWidget(child: ExperienceSection(key: experienceKey)),

                  SizedBox(height: sectionSpacing),
                  ScrollAnimatedWidget(child: ProjectsSection(key: portfolioKey)),

                  SizedBox(height: sectionSpacing),
                  ScrollAnimatedWidget(child: BriefingSection(key: briefingKey)),

                  SizedBox(height: sectionSpacing),
                  ScrollAnimatedWidget(child: ContactSection(key: contactKey)),

                  SizedBox(height: sectionSpacing),
                  if (isMobile) const FooterSection(),
                ],
              ),
            ),
          ),

          if (!isMobile) SideColumns(isMobile: isMobile),
        ],
      ),
    );
  }
}
