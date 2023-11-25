import 'package:flutter/material.dart';

import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';

class ProfileDesign extends StatelessWidget {
  const ProfileDesign({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: EdgeInsets.only(top: 70),
      padding: EdgeInsets.fromLTRB(
          10, ResponsiveWidget.isSmallScreen(context) ? 80 : 20, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
