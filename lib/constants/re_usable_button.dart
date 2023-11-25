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
