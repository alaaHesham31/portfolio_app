import 'package:flutter/material.dart';
import 'package:portfolio_app/home_screen.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alaa Elkeshki — Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Montserrat', // 👈 now uses your bundled font immediately
        textTheme: const TextTheme(), // can extend if needed
      ),
      home: const HomeScreen(),
    );
  }
}
