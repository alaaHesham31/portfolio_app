# 🌟 Personal Portfolio – Flutter Web

A fully responsive **personal portfolio website** built with **Flutter Web**, designed to showcase my skills, projects, and experience in a modern and interactive way.  
The app is **CV-ready**, easy to maintain, and optimized for **mobile, tablet, and desktop** using adaptive breakpoints.

🔗 **Live Portfolio:** [Link Here](https://alaahesham31.github.io/portfolio_app/)

---

## ✨ Features

- 📱 **Fully Responsive UI**  
  Works seamlessly across mobile, tablet, and desktop with custom breakpoints (`<800px`, `800–1200px`, `>1200px`).

- 🎨 **Modern & Clean Design**  
  Consistent typography, themed color palette, and polished animations.

- 🖼 **Sections Included**  
  - Hero section with animated intro text  
  - About section  
  - Experience timeline with page-based navigation  
  - Projects showcase with overlay cards  
  - Contact / Call-to-Action  

- 🔄 **Smooth Animations**  
  Animated page transitions, text reveals, and scroll interactions.

- 🖋 **Custom Responsive Typography**  
  Centralized `AppTextStyles` handles font sizes dynamically based on screen width.

- 🌍 **Deployed to GitHub Pages**  
  Configured with `<base href="/portfolio_app/">` for reliable hosting.

---

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/) (Web)
- **Language:** Dart  
- **Deployment:** GitHub Pages

---

## 📦 Packages Used

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^5.0.0
  flutter_svg: ^2.0.0
  animated_text_kit: ^4.2.2
  flutter_staggered_animations: ^1.1.0
  responsive_framework: ^0.2.0
  url_launcher: ^6.1.10
  lottie: ^2.2.0         # animated loaders and visuals
  cupertino_icons: ^1.0.8
  responsive_builder: ^0.7.0
  animate_do: ^3.1.2     # or scroll_animations
  font_awesome_flutter: ^10.6.0
  flutter_screenutil: ^5.9.3
  smooth_page_indicator: ^1.2.1
  flutter_animate: ^4.5.0
  visibility_detector: ^0.4.0+2
   ```

## 📐 Responsive Text Styles

Font sizes adapt based on breakpoints:

- **Mobile (<800px)** → smaller font  
- **Tablet (800–1200px)** → medium font  
- **Desktop (>1200px)** → large font  

Example:

```dart
static double _responsiveFontSize(BuildContext context,
    {required double mobile, required double tablet, required double desktop}) {
  final width = MediaQuery.of(context).size.width;
  if (width < 800) return mobile;
  if (width < 1200) return tablet;
  return desktop;
}
 ```


---

This portfolio is built to be developer-friendly, scalable, and CV-ready.
It highlights my skills, projects, and career journey while ensuring a modern, responsive, and interactive experience across all devices.
