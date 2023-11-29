import 'package:flutter/material.dart';

import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/profile/widgets/profile_design.dart';

class ProfilePanel extends StatelessWidget {
  const ProfilePanel({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context) ? true : false;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(isMobile ? 15 : width / 10,
          isMobile ? 0 : 150, isMobile ? 15 : width / 10, 10),
      child: Stack(
        children: [
          const ProfileDesign(),
          Container(
            alignment: Alignment.center,
            child: profileImage(),
          ),
        ],
      ),
    );
  }

  Widget profileImage() => InkWell(
        child: const CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage("assets/images/person.png"),
        ),
        onTap: () {},
      );
}
