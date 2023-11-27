import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/re_usable_button.dart';
import 'package:flutter_web_dashboard/constants/re_usable_text.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';

class FooterPanel extends StatelessWidget {
  late bool isMobile, isDesktop;
  @override
  Widget build(BuildContext context) {
    isMobile = ResponsiveWidget.isSmallScreen(context) ? true : false;
    isDesktop = ResponsiveWidget.isLargeScreen(context) ? true : false;

    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(isMobile ? 15 : width / 10, isMobile ? 0 : 20,
          isMobile ? 15 : width / 10, isMobile ? 0 : 15),
      //     EdgeInsets.symmetric(
      //   horizontal: isMobile ? 0 : width / 10,
      //   vertical: isMobile ? 0 : 20,
      // ),
      padding: EdgeInsets.all(isMobile ? 5 : 10),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: isMobile
            ? const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )
            : BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                socialNetwork(),
                webInfo(),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                socialNetwork(),
                webInfo(),
              ],
            ),
    );
  }

  Widget socialNetwork() => Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            boldBlackText('Let\'s keep in touch!'),
            normalGreyText(
                'Find us on any of these platforms, we respond 1-2 business days.',
                lightGrey),
            const SizedBox(height: 10),
            Row(
              children: [
                if (!isDesktop) const Spacer(flex: 1),
                floatingIconsButtons('assets/icons/facebook.svg'),
                floatingIconsButtons('assets/icons/linkedin.svg'),
                floatingIconsButtons('assets/icons/skype.svg'),
                floatingIconsButtons('assets/icons/twitter.svg'),
                floatingIconsButtons('assets/icons/youtube.svg'),
                if (!isDesktop) const Spacer(flex: 1),
              ],
            ),
          ],
        ),
      );

  Widget floatingIconsButtons(String path) => Container(
        margin: const EdgeInsets.all(5),
        height: 40,
        child: FloatingActionButton(
          backgroundColor: light,
          child: colorLogoButton(path),
          onPressed: () {},
        ),
      );

  Widget webInfo() => Container(
        margin: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            usefulLink(),
            isMobile ? const Spacer(flex: 1) : const SizedBox(width: 50),
            otherResources(),
          ],
        ),
      );

  Widget usefulLink() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          normalGreyText('USEFUL LINKS', light),
          textButtons('About Us', primaryColor),
          textButtons('Blog', primaryColor),
          textButtons('Github', primaryColor),
          textButtons('Free Products', primaryColor),
        ],
      );
  Widget otherResources() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          normalGreyText('OTHER RESOURCES', light),
          textButtons('MIT License', primaryColor),
          textButtons('Terms & Conditions', primaryColor),
          textButtons('Privacy Policy', primaryColor),
          textButtons('Contact Us', primaryColor),
        ],
      );
}
