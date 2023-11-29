import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/profile/widgets/footer_panel.dart';
import 'package:flutter_web_dashboard/pages/profile/widgets/header_panel.dart';
import 'package:flutter_web_dashboard/pages/profile/widgets/profile_panel.dart';
import 'package:flutter_web_dashboard/pages/profile/widgets/top_background.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive.isMobile(context)
          ? Stack(
              children: [
                Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.blue,
                ),
                const TopBackground(),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeaderPanel(),
                      const ProfilePanel(),
                      FooterPanel(),
                    ],
                  ),
                ),
              ],
            )
          : SafeArea(
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
                        FooterPanel(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
