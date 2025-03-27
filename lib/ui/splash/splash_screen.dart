import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_app/resource/generated/assets.gen.dart';
import 'package:to_do_app/ui/Onboading/onboading_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Tạo Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    // Tạo hiệu ứng phóng to (scale animation)
    _animation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Chuyển màn hình sau 3 giây
    Timer(const Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323642),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 150, // Đặt kích thước cho Container
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45), // Bo góc

                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(Assets.icons.logo.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text(
                "LET'S DO IT",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
