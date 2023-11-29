import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';

import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/profile/widgets/profile_info.dart';

class ProfileDesign extends StatelessWidget {
  const ProfileDesign({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: const EdgeInsets.only(top: 70),
      padding: EdgeInsets.fromLTRB(
          10, Responsive.isMobile(context) ? 80 : 20, 10, 10),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ProfileInFo(),
    );
  }
}
