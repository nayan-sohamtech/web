import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/re_usable_button.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';

class HeaderPanel extends StatelessWidget {
  late bool isScreen;

  @override
  Widget build(BuildContext context) {
    isScreen = ResponsiveWidget.isSmallScreen(context) ? true : false;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width / 10, vertical: isScreen ? 30 : 10),
      child: isScreen
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [leftSidePanel(), rightSidePanel()],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [leftSidePanel(), rightSidePanel()],
            ),
    );
  }

  Widget leftSidePanel() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Timeless",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
          ),
          isScreen
              ? const Spacer(
                  flex: 1,
                )
              : const SizedBox(width: 50),
          iconLabelButtons('Docs', 'assets/icons/Documents.svg')
        ],
      );

  Widget rightSidePanel() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoButton('assets/icons/facebook.svg'),
          logoButton('assets/icons/twitter.svg'),
          logoButton('assets/icons/linkedin.svg'),
        ],
      );
}
