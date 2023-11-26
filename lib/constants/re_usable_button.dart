import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget iconLabelButtons(String lebel, String path) => TextButton.icon(
      onPressed: () => print('pressed'),
      icon: SvgPicture.asset(
        path,
        width: 20,
        //colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      label: Text(
        lebel,
        style: const TextStyle(color: Colors.white),
      ),
    );

Widget logoButton(String path) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      child: IconButton(
        icon: SvgPicture.asset(
          path,
          width: 15,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        onPressed: () {},
      ),
    );

Widget normalButton(String label, Color txtcolor, String path, Color iconColor,
        Color backColor) =>
    InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (path != '') Image.asset(path, color: iconColor, width: 15),
            if (path != '') const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: txtcolor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
