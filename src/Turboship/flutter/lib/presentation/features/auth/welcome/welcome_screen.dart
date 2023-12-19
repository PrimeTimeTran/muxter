// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../core/extensions/all.dart';
// import '../../../../core/utils/all.dart';
// import '../../../common_widgets/all.dart';
// import '../../../resource/all.dart';
// import '../../../routing/routing.dart';

// class WelcomePage extends StatefulWidget {
//   const WelcomePage({super.key});

//   @override
//   State<WelcomePage> createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> {
//   final _pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return CommonScaffold(
//       applyAutoPaddingBottom: true,
//       padding: AppSpacing.edgeInsetsH20,
//       body: Column(
//         children: [
//           Expanded(
//             child: _buildCarousel(),
//           ),
//           AppSpacing.gapH64,
//           _buildButtons(),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     ViewUtil.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//         statusBarIconBrightness: Brightness.light, // For Android (light icons)
//         statusBarBrightness: Brightness.dark, // For iOS (light icons)
//       ),
//     );
//     super.initState();
//   }

//   Widget _buildButtons() {
//     return Column(
//       children: [
//         AppButton.primary(
//           onPressed: () => context.go(AppPages.signUp.path),
//           width: double.infinity,
//           label: 'Sign Up',
//           bgColor: context.colorTheme.bgDecorBrandLightest,
//           textColor: context.colorTheme.txtNormalPrimary,
//         ),
//         AppButton.primary(
//           onPressed: () => context.go(AppPages.home.path),
//           width: double.infinity,
//           label: 'Home',
//           bgColor: context.colorTheme.bgDecorBrandLightest,
//           textColor: context.colorTheme.txtNormalPrimary,
//         ),
//         AppSpacing.gapH8,
//         TextButton(
//           onPressed: () => context.go(AppPages.signIn.path),
//           child: Text(
//             'Sign In',
//             style: context.textTheme.b14BaseMedium.toColor(
//               context.colorTheme.txtInversePrimary,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildCarousel() {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         PageView(
//           controller: _pageController,
//           children:
//               [1, 2, 3].toList().map((e) => _buildCarouselItem(e)).toList(),
//         ),
//         Positioned(
//           bottom: 100 + Sizes.s28,
//           left: 0,
//           right: 0,
//           child: AppPageIndicator(
//             controller: _pageController,
//             count: 3,
//             dotSize: Sizes.s8,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildCarouselItem(int item) {
//     return Column(
//       children: [
//         const Spacer(),
//         // _getIllustration(item),
//         const SizedBox(height: 115),
//         SizedBox(
//           height: 100,
//           child: Column(
//             children: [
//               Text(
//                 _getOnBoardingTitle(item),
//                 textAlign: TextAlign.center,
//                 style: context.textTheme.headingH33xlSemibold
//                     .toColor(context.colorTheme.txtInversePrimary),
//               ),
//               AppSpacing.gapH12,
//               Text(
//                 _getOnBoardingDesc(item),
//                 textAlign: TextAlign.center,
//                 style: context.textTheme.b14BaseRegular
//                     .toColor(context.colorTheme.txtInverseSecondary),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   // Widget _getIllustration(int item) {
//   //   late SvgGenImage image;
//   //   switch (item) {
//   //     case 1:
//   //       image = Assets.illus.onboarding1;
//   //     case 2:
//   //       image = Assets.illus.onboarding2;
//   //     case 3:
//   //       image = Assets.illus.onboarding3;
//   //   }

//   //   return image.svg(
//   //     width: 120,
//   //     height: 120,
//   //   );
//   // }

//   String _getOnBoardingDesc(int item) {
//     switch (item) {
//       case 1:
//         return 'ssoso';
//       case 2:
//         return 'ssoso';
//       case 3:
//         return 'ssoso';
//       default:
//         return '';
//     }
//   }

//   String _getOnBoardingTitle(int item) {
//     switch (item) {
//       case 1:
//         return 'ssoso';
//       case 2:
//         return 'ssoso';
//       case 3:
//         return 'ssoso';
//       default:
//         return '';
//     }
//   }
// }
