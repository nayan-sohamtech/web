import 'package:flutter/material.dart';

import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/profile/widgets/profile_design.dart';

class ProfilePanel extends StatelessWidget {
  const ProfilePanel({super.key});

  @override
  Widget build(BuildContext context) {
    bool isScreen = ResponsiveWidget.isSmallScreen(context) ? true : false;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(isScreen ? 15 : width / 10,
          isScreen ? 0 : 150, isScreen ? 15 : width / 10, 10),
      child: Stack(
        children: [
          const ProfileDesign(),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: profileImage(),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileImage() => const CircleAvatar(
        radius: 70,
        backgroundImage: AssetImage("assets/images/person.png"),
      );
}
