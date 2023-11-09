import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';

class CloudStorageInfo {
  final String icon, title, totalStorage;
  final int numOfFiles, percentage;
  final Color color;

  CloudStorageInfo({
    required this.icon,
    required this.title,
    required this.totalStorage,
    required this.numOfFiles,
    required this.percentage,
    required this.color,
  });
}

List demoFiles = [
  CloudStorageInfo(
    icon: "assets/icons/Documents.svg",
    title: "Documents",
    totalStorage: "1.9GB",
    numOfFiles: 1328,
    percentage: 35,
    color: primaryColor,
  ),
  CloudStorageInfo(
    icon: "assets/icons/google_drive.svg",
    title: "Google Drive",
    totalStorage: "1.9GB",
    numOfFiles: 1328,
    percentage: 35,
    color: const Color(0xFFFFA113),
  ),
  CloudStorageInfo(
    icon: "assets/icons/one_drive.svg",
    title: "One Drive",
    totalStorage: "1.9GB",
    numOfFiles: 1328,
    percentage: 35,
    color: const Color(0xFFA4CDFF),
  ),
  CloudStorageInfo(
    icon: "assets/icons/unknown.svg",
    title: "Unknown",
    totalStorage: "1.9GB",
    numOfFiles: 1328,
    percentage: 35,
    color: const Color(0xFFfa0202),
  )
];
