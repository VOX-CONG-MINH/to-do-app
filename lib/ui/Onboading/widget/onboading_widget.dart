// import 'package:flutter/material.dart';

// class OnboardingPage extends StatelessWidget {
//   final String image;
//   final String title;
//   final String description;

//   const OnboardingPage({
//     required this.image,
//     required this.title,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(image, height: 300),
//           SmoothPageIndicator(
//             controller: _pageController,
//             count: onboardingData.length,
//             effect: ExpandingDotsEffect(
//               dotHeight: 10,
//               dotWidth: 10,
//               activeDotColor: Colors.purpleAccent,
//               dotColor: Colors.grey.shade600,
//               expansionFactor: 4,
//             ),
//           ),
//           const SizedBox(height: 24),
//           const SizedBox(height: 20),
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             description,
//             style: const TextStyle(fontSize: 16, color: Colors.white70),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
