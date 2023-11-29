import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/re_usable_button.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';

class HeaderPanel extends StatelessWidget {
  late bool isSmall;
  @override
  Widget build(BuildContext context) {
    isSmall = Responsive.isMobile(context) ? true : false;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width / 10, vertical: isSmall ? 30 : 10),
      child: isSmall
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: IconButton(onPressed: () {Get.offAllNamed(rootRoute);}, icon: Icon(Icons.arrow_back)),
          // ),
          const Text(
            "Timeless",
            style: TextStyle(
              fontSize: 25,
              color: light,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
          ),
          isSmall
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
