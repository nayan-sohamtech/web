import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';

Widget largeBoldTextBlack(String label) => Text(
      label,
      style: const TextStyle(
        fontSize: 25,
        color: light,
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
      ),
    );

Widget normalGreyText(String label, Color color) => Text(
      label,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14,
        wordSpacing: 1,
        letterSpacing: .5,
        color: color,
      ),
    );

Widget boldBlackText(String label) => Text(
      label,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
      ),
    );

Widget smallBlackText(String label) => Text(
      label,
      style: TextStyle(
        fontSize: 10,
        color: Colors.grey[800],
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
      ),
    );

Widget buildTextField1(controller, String hintText) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

Widget buildTextField2(controller, String hintText) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
