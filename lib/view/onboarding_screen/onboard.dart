
// import 'package:flutter/material.dart';

// import '../../core/routes/routes.dart';
// import '../../core/themes/app_color.dart';
// import '../widgets/onboarding_data.dart';

// class OnboardingScreen extends StatefulWidget {
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Stack(
//           children: [
//             PageView(
//               controller: _pageController,
//               onPageChanged: (index) {
//                 setState(() {
//                   _currentPage = index;
//                 });
//               },
//               children: [
//                 OnboardingPage(
//                   image: 'assets/images/attendance.png',
//                   title: "Join eRecycle",
//                   description: "Sign up for eco-friendly recycling and environmental impact.",
//                 ),
//                 OnboardingPage(
//                   image: 'assets/images/students.png',
//                   title: "Collect your trash",
//                   description: "Contribute to a cleaner environment with eRecycle.",
//                 ),
//                 OnboardingPage(
//                   image: 'assets/images/attendance.png',
//                   title: "Send pick-up request",
//                   description: "Effortless recycling with eRecycle's convenient pick-up service.",
//                 ),
//                 OnboardingPage(
//                   image: 'assets/images/students.png',
//                   title: "Earn money",
//                   description: "Turn your recyclables into cash with eRecycle's rewards.",
//                 ),
//               ],
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 20.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(
//                         4,
//                         (index) => buildPageIndicator(index),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 10.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_currentPage == 3) {
//                           Navigator.pushReplacementNamed(context, Routes.login);
//                         } else {
//                           _pageController.nextPage(
//                             duration: Duration(milliseconds: 500),
//                             curve: Curves.ease,
//                           );
//                         }
//                       },
//                       child: Text(
//                         _currentPage == 3 ? 'Get Started' : 'Next',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         primary: AppColors.primaryColor,
//                         minimumSize: Size(350, 50.0), // Adjust the width
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildPageIndicator(int index) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 4.0),
//       height: 8.0,
//       width: _currentPage == index ? 24.0 : 8.0,
//       decoration: BoxDecoration(
//         color: _currentPage == index ? AppColors.primaryColor : Colors.grey,
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//     );
//   }
// }
