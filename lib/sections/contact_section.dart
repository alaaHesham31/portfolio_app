import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/styels/app_colors.dart';
import '../core/styels/app_text_styles.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchMailto() async {
    final Uri uri = Uri.parse(
        "https://mail.google.com/mail/?view=cm&fs=1"
            "&to=alaa.elkeshky33@gmail.com"
            "&su=Hello"
            "&body=Hi,"
    );

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $uri");
    }
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 120,
      ),
      color: AppColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🔹 Title
          Text(
            "Get In Touch",
            style: AppTextStyles.titleLarge(context),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // 🔹 Body text
          SizedBox(
            width: isMobile ? double.infinity : 600,
            child: Text(
              "I’m always happy to connect — whether it’s about opportunities, collaboration, or just a quick hello. "
            "Feel free to reach out and I’ll get back to you soon!",
              style: AppTextStyles.bodyGrey(context).copyWith(height: 1.6),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 40),

          // 🔹 Action Button
          OutlinedButton(
            onPressed: _launchMailto,
            // icon: const Icon(Icons.mail_outline, size: 20),

            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.greenColor, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              foregroundColor: AppColors.greenColor,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
            child: Text(
              "Say Hello",
              style: AppTextStyles.navButtonGreen(context),
            ),
          ),
        ],
      ),
    );
  }
}
