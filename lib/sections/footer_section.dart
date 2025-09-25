import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/styels/app_colors.dart';
import '../core/styels/app_text_styles.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIcon(FontAwesomeIcons.github, "https://github.com/alaaHesham31"),
              _buildIcon(FontAwesomeIcons.linkedin, "https://www.linkedin.com/in/alaaelkeshky/"),
              _buildIcon(FontAwesomeIcons.instagram, "https://www.instagram.com/alaa_elkeshki_23?igsh=ZGV1dXZoOWNzbzdl"),
              _buildIcon(FontAwesomeIcons.facebook, "https://www.facebook.com/alaa.elkeshky33"),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => launchUrl(
              Uri.parse(
                  "https://mail.google.com/mail/?view=cm&fs=1"
                      "&to=alaa.elkeshky33@gmail.com"
                      "&su=Hello"
                      "&body=Hi,"
              ),
              mode: LaunchMode.externalApplication,
            ),
            child: Text(
              "alaa.elkeshky33@gmail.com",
              style: AppTextStyles.bodyWhite(context).copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),

          const SizedBox(height: 20),
          Divider(
            thickness: 1,
            color: AppColors.whiteColor.withOpacity(0.3),
            indent: 40,
            endIndent: 40,
          ),
          const SizedBox(height: 10),
          Text(
            "© 2025 Alaa Elkeshki — All Rights Reserved",
            style: AppTextStyles.captionWhite(context),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Icon(icon, color: AppColors.whiteColor, size: 20),
      ),
    );
  }
}
