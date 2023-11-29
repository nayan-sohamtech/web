import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/re_usable_button.dart';
import 'package:flutter_web_dashboard/constants/re_usable_text.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';

class ProfileInFo extends StatelessWidget {
  String data =
      'An artist of considerable range, Jenna the name taken by Melbourne-raised, Brooklyn-based Nick Murphy writes, performs and records all of his own music, giving it a warm, intimate feel with a solid groove structure. An artist of considerable range.';
  late bool isMobile;

  @override
  Widget build(BuildContext context) {
    isMobile = Responsive.isMobile(context) ? true : false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// card header
        SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              socialValue('Friends', 22),
              socialValue('Photos', 10),
              socialValue('Comments', 86),
              const Spacer(flex: 10),
              normalButton('Edit', light, '', light, primaryColor),
              const Spacer(flex: 1),
            ],
          ),
        ),
        SizedBox(height: isMobile ? 20 : 50),
        largeBoldTextBlack('Nayan Moradiya'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_pin,
              size: 20,
              color: primaryColor,
            ),
            const SizedBox(width: 5),
            normalGreyText('LOS ANGELES, CALIFORNIA', lightGrey),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.work,
              size: 20,
              color: primaryColor,
            ),
            const SizedBox(width: 5),
            normalGreyText(
                'Solution Manager - Creative Team Officer', lightGrey),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.school,
              size: 20,
              color: primaryColor,
            ),
            const SizedBox(width: 5),
            normalGreyText('University of Computer Science', lightGrey),
          ],
        ),

        /// description
        Divider(height: 30, thickness: 1, color: Colors.grey.shade300),
        normalGreyText(data, lightGrey),
        const SizedBox(height: 10),
        textButtons('Show more', primaryColor)
      ],
    );
  }

  Widget socialValue(String label, int value) => Container(
        padding: const EdgeInsets.all(5),
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$value',
              style: TextStyle(
                color: light,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: light,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
}
