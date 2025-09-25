import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/styels/app_colors.dart';
import '../core/styels/app_text_styles.dart';

class SideColumns extends StatelessWidget {
  final bool isMobile;
  const SideColumns({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    if (isMobile) return const SizedBox(); // not visible on mobile

    return Stack(
      children: [
        // --- Left icons ---
        Positioned(
          left: 30,
          bottom: 0,
          child: Column(
            children: [
              _HoverIcon(FontAwesomeIcons.github, "https://github.com/alaaHesham31"),
              _HoverIcon(FontAwesomeIcons.linkedin, "https://www.linkedin.com/in/alaaelkeshky/"),
              _HoverIcon(FontAwesomeIcons.instagram, "https://www.instagram.com/alaa_elkeshki_23?igsh=ZGV1dXZoOWNzbzdl"),
              _HoverIcon(FontAwesomeIcons.facebook, "https://www.facebook.com/alaa.elkeshky33"),
              Container(
                height: 80,
                width: 1,
                color: AppColors.whiteColor.withOpacity(0.5),
                margin: const EdgeInsets.only(top: 10),
              ),
            ],
          ),
        ),

        // --- Right email ---
        Positioned(
          right: 30,
          bottom: 0,
          child: Column(
            children: [
              _HoverEmail(
                email: "alaa.elkeshky33@gmail.com",
              ),
              Container(
                height: 80,
                width: 1,
                color: AppColors.whiteColor.withOpacity(0.5),
                margin: const EdgeInsets.only(top: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ----------------- Hoverable Icon -----------------
class _HoverIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const _HoverIcon(this.icon, this.url);

  @override
  State<_HoverIcon> createState() => _HoverIconState();
}

class _HoverIconState extends State<_HoverIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url),
            mode: LaunchMode.externalApplication),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Icon(
            widget.icon,
            color: _isHovered ? AppColors.greenColor : AppColors.whiteColor,
            size: 26,
          ),
        ),
      ),
    );
  }
}

// ----------------- Hoverable Email -----------------
class _HoverEmail extends StatefulWidget {
  final String email;
  const _HoverEmail({required this.email});

  @override
  State<_HoverEmail> createState() => _HoverEmailState();
}

class _HoverEmailState extends State<_HoverEmail> {
  bool _isHovered = false;

  Future<void> _launchGmail() async {
    final Uri gmailUrl = Uri.parse(
        "https://mail.google.com/mail/?view=cm&fs=1&to=${widget.email}&su=Hello&body=Hi,");

    if (!await launchUrl(gmailUrl, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch Gmail");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launchGmail,
        child: RotatedBox(
          quarterTurns: 1,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: _isHovered
                ? AppTextStyles.captionGreen(context).copyWith(
              decoration: TextDecoration.underline,
            )
                : AppTextStyles.captionWhite(context).copyWith(
              decoration: TextDecoration.underline,
            ),
            child: Text(widget.email, style: TextStyle(fontSize: 18),),
          ),
        ),
      ),
    );
  }
}
