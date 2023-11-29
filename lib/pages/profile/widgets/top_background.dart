import 'package:flutter/material.dart';

import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';

class TopBackground extends StatelessWidget {
  const TopBackground({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: Responsive.isMobile(context) ? 300 : 450,
      child: Image.asset(
        "assets/images/mount.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
