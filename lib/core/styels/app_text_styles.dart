import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static double _responsiveFontSize(BuildContext context,
      {required double mobile, required double tablet, required double desktop}) {
    final width = MediaQuery.of(context).size.width;
    if (width < 800) return mobile;
    if (width < 1200) return tablet;
    return desktop;
  }

  // ---------- LOGO ----------
  static TextStyle logoMobile(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 16, tablet: 16, desktop: 20),
    color: AppColors.greenColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle logoDesktop(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 18, tablet: 16, desktop: 24),
    color: AppColors.greenColor,
    fontWeight: FontWeight.w500,
  );

  // ---------- NAV / BUTTON ----------
  static TextStyle navItem(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 18),
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle navButtonGreen(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
    color: AppColors.greenColor,
    fontWeight: FontWeight.w600,
  );
  // ---------- NAME ----------
  static TextStyle nameLarge(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 20, tablet: 28, desktop: 44),
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
  );

  // ---------- TITLES ----------
  static TextStyle titleLarge(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 20, tablet: 28, desktop: 36),
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleMedium(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 18, tablet: 24, desktop: 32),
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleSmall(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 18, tablet: 20, desktop: 22),
    color: AppColors.greenColor,
    fontWeight: FontWeight.w700,
  );

  // ---------- BODY ----------
  static TextStyle bodyGrey(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 14, tablet: 15, desktop: 16),
    color: Colors.grey,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyWhite(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 14, tablet: 15, desktop: 16),
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyGreen(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 14, tablet: 15, desktop: 16),
    color: AppColors.greenColor,
    fontWeight: FontWeight.w600,
  );

  // ---------- CAPTIONS ----------
  static TextStyle captionWhite(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle captionGreen(BuildContext context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: _responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
    color: AppColors.greenColor,
    fontWeight: FontWeight.w500,
  );
}
