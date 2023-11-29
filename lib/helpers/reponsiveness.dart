// import 'package:flutter/material.dart';

// const int largeScreenSize = 1366;
// const int mediumScreenSize = 768;
// const int smallSceenSize = 360;
// const int customScreenSize = 1100;

// class ResponsiveWidget extends StatelessWidget {
//   // the custom screen size is specific to this project
//   final Widget largeScreen;
//   final Widget? mediumScreen;
//   final Widget? smallScreen;

//   const ResponsiveWidget({
//     Key? key,
//     required this.largeScreen,
//     this.mediumScreen,
//     this.smallScreen,
//   }) : super(key: key);

//   static bool isSmallScreen(BuildContext context) {
//     return MediaQuery.of(context).size.width < mediumScreenSize;
//   }

//   static bool isMediumScreen(BuildContext context) {
//     return MediaQuery.of(context).size.width >= mediumScreenSize &&
//         MediaQuery.of(context).size.width < largeScreenSize;
//   }

//   static bool isLargeScreen(BuildContext context) {
//     return MediaQuery.of(context).size.width > largeScreenSize;
//   }

//   static bool isCustomSize(BuildContext context) {
//     return MediaQuery.of(context).size.width <= customScreenSize &&
//         MediaQuery.of(context).size.width >= mediumScreenSize;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth >= largeScreenSize) {
//           return largeScreen;
//         } else if (constraints.maxWidth < largeScreenSize &&
//             constraints.maxWidth >= mediumScreenSize) {
//           return mediumScreen ?? largeScreen;
//         } else {
//           return smallScreen ?? largeScreen;
//         }
//       },
//     );
//   }
// }

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

const int customScreenSize = 1100;

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static bool isCustomSize(BuildContext context) {
    return MediaQuery.of(context).size.width <= customScreenSize;
    // &&
    //     MediaQuery.of(context).size.width >= 850;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (_size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
