import 'package:flutter/material.dart';
import '../core/styels/app_colors.dart';
import '../core/styels/app_text_styles.dart';

class AppDrawer extends StatelessWidget {
  final void Function(GlobalKey) onItemTap;
  final GlobalKey heroKey;
  final GlobalKey aboutKey;
  final GlobalKey experienceKey;
  final GlobalKey portfolioKey;
  final GlobalKey briefingKey;
  final GlobalKey contactKey;

  const AppDrawer({
    super.key,
    required this.onItemTap,
    required this.heroKey,
    required this.aboutKey,
    required this.experienceKey,
    required this.portfolioKey,
    required this.briefingKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 36),
        children: [
          _drawerItem(context, "00. Hello", () => onItemTap(heroKey)),
          _drawerItem(context, "01. About", () => onItemTap(aboutKey)),
          _drawerItem(context, "02. Experience", () => onItemTap(experienceKey)),
          _drawerItem(context, "03. Projects", () => onItemTap(portfolioKey)),
          _drawerItem(context, "04. Briefing", () => onItemTap(briefingKey)),
          _drawerItem(context, "Contact", () => onItemTap(contactKey)),
        ],
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String label, VoidCallback onTap) {
    return ListTile(
      title: Text(label, style: AppTextStyles.navItem(context)),
      onTap: onTap,
    );
  }
}
