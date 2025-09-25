import 'package:flutter/material.dart';
import '../core/styels/app_colors.dart';
import '../core/styels/app_text_styles.dart';


class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isMobile;
  final void Function(GlobalKey) onItemTap;
  final GlobalKey heroKey;
  final GlobalKey aboutKey;
  final GlobalKey experienceKey;
  final GlobalKey portfolioKey;
  final GlobalKey briefingKey;
  final GlobalKey contactKey;

  const NavBar({
    super.key,
    required this.isMobile,
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
    if (isMobile) {
      return AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text("AK", style: AppTextStyles.logoMobile(context)),
        centerTitle: true,
      );
    }

    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            // padding: EdgeInsets.all(4),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greenColor, width: 1.5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(child: Text("AK", style: AppTextStyles.logoDesktop(context))),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            _navItem("00. Hello", () => onItemTap(heroKey), context),
            _navItem("01. About", () => onItemTap(aboutKey), context),
            _navItem("02. Experience", () => onItemTap(experienceKey), context),
            _navItem("03. Projects", () => onItemTap(portfolioKey), context),
            _navItem("THE BRIEFING", () => onItemTap(briefingKey), context, isButton: true),
            const SizedBox(width: 12),
            _navItem("Contact", () => onItemTap(contactKey), context, isOutline: true),
            const SizedBox(width: 24),
          ],
        ),
      ],
    );
  }

  // ------------------ NAV ITEM BUILDER ------------------
  Widget _navItem(
    String text,
    VoidCallback onTap,
    BuildContext ctx, {
    bool isButton = false,
    bool isOutline = false,
    bool isBriefing = false, // 🔹 new flag
  }) {
    if (isBriefing) {
      return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          backgroundColor: AppColors.greenColor,
          foregroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // pill style
          ),
          elevation: 6,
          shadowColor: AppColors.greenColor.withOpacity(0.5),
        ).copyWith(
          overlayColor: MaterialStateProperty.all(AppColors.whiteColor.withOpacity(0.1)),
        ),
        child: Text(
          text,
          style: AppTextStyles.navButtonGreen(ctx).copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
      );
    }
    if (isButton) {
      return TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(color: AppColors.greenColor, width: 1.2)),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 18, vertical: 10)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          overlayColor: MaterialStateProperty.all(AppColors.greenColor.withOpacity(0.1)),
          foregroundColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.hovered) ? AppColors.greenColor : AppColors.whiteColor,
          ),
        ),
        child: Text(text, style: AppTextStyles.navButtonGreen(ctx)),
      );
    } else if (isOutline) {
      return OutlinedButton(
        onPressed: onTap,
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(color: AppColors.greenColor, width: 1.2)),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 18, vertical: 10)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          overlayColor: MaterialStateProperty.all(AppColors.greenColor.withOpacity(0.1)),
          foregroundColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.hovered) ? AppColors.greenColor : AppColors.whiteColor,
          ),
        ),
        child: Text(text, style: AppTextStyles.navButtonGreen(ctx)),
      );
    }

    // Simple text nav item with hover effect
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: HoverBuilder(
            builder: (hovered) => Text(
              text,
              style: hovered
                  ? AppTextStyles.navItem(ctx).copyWith(color: AppColors.greenColor)
                  : AppTextStyles.navItem(ctx),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

// ------------------ REUSABLE HOVER BUILDER ------------------
class HoverBuilder extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const HoverBuilder({super.key, required this.builder});

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: widget.builder(_isHovered),
    );
  }
}
