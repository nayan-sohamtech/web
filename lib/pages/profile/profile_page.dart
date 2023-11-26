import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/profile/widgets/header_panel.dart';
import 'package:flutter_web_dashboard/pages/profile/widgets/profile_panel.dart';
import 'package:flutter_web_dashboard/pages/profile/widgets/top_background.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          const TopBackground(),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderPanel(),
                const ProfilePanel(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
