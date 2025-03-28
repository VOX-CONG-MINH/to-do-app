import 'package:flutter/material.dart';

import '../../pos.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome !!!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.monaSans,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Please login to your account or create \nnew account to continue",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontFamily: FontFamily.monaSans,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // TODO Login screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.mediumBackground,
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.monaSans,
                ),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                // TODO register screen
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColor.mediumBackground, width: 2),
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "CREATE ACCOUNT",
                style: TextStyle(
                  color: AppColor.mediumBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.monaSans,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
