import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowData {
  final String title;
  final String date;

  RowData(this.title, this.date);
}

class RecentFileinfo {
  final String title, date, size, icon;

  RecentFileinfo({
    required this.icon,
    required this.title,
    required this.date,
    required this.size,
  });
}

class FileController extends GetxController {
  TextEditingController title2Controller = TextEditingController();
  TextEditingController date2Controller = TextEditingController();
  TextEditingController size2Controller = TextEditingController();
  TextEditingController icon2Controller = TextEditingController();
  TextEditingController edit2TitleController = TextEditingController();
  TextEditingController edit2DateController = TextEditingController();

  void addRow(String title, date, size, icon) {
    demoRecentFiles
        .add(RecentFileinfo(icon: icon, title: title, date: date, size: size));
    title2Controller.clear();
    date2Controller.clear();
    size2Controller.clear();
    update(); // Trigger a rebuild of the UI
  }

  void deleteRow(int index) {
    demoRecentFiles.removeAt(index);
    update(); // Trigger a rebuild of the UI
  }

  void editRow(int index, String title, date, size, icon) {
    demoRecentFiles[index] =
        RecentFileinfo(icon: icon, title: title, date: date, size: size);
    selected1Index.value = -1;
    title2Controller.clear();
    date2Controller.clear();
    size2Controller.clear(); // Reset the selected index
    update(); // Trigger a rebuild of the UI
  }

  void set1SelectedIndex(int index) {
    selected1Index.value = index;
  }

  var selected1Index = RxInt(-1);
  var demoRecentFiles = <RecentFileinfo>[
    RecentFileinfo(
      icon: "assets/icons/xd_file.svg",
      title: "XD File",
      date: "01-03-2021",
      size: "3.5mb",
    ),
    RecentFileinfo(
      icon: "assets/icons/Figma_file.svg",
      title: "Figma File",
      date: "01-03-2021",
      size: "3.5mb",
    ),
    RecentFileinfo(
      icon: "assets/icons/Documents.svg",
      title: "Document",
      date: "01-03-2021",
      size: "3.5mb",
    ),
    RecentFileinfo(
      icon: "assets/icons/sound_file.svg",
      title: "Sound File",
      date: "01-03-2021",
      size: "3.5mb",
    ),
    RecentFileinfo(
      icon: "assets/icons/media_file.svg",
      title: "Media File",
      date: "01-03-2021",
      size: "3.5mb",
    ),
    RecentFileinfo(
      icon: "assets/icons/pdf_file.svg",
      title: "Sales PDF",
      date: "01-03-2021",
      size: "3.5mb",
    ),
    RecentFileinfo(
      icon: "assets/icons/excel_file.svg",
      title: "Excel File",
      date: "01-03-2021",
      size: "3.5mb",
    )
  ].obs;
}

//////////////////////////
// class RecentFileinfo extends GetxController {
//   String icon, title, date, size;

//   RecentFileinfo({
//     required this.icon,
//     required this.title,
//     required this.date,
//     required this.size,
//   });
// }

// List demoRecentFiles = [
//   RecentFileinfo(
//     icon: "assets/icons/xd_file.svg",
//     title: "XD File",
//     date: "01-03-2021",
//     size: "3.5mb",
//   ),
//   RecentFileinfo(
//     icon: "assets/icons/Figma_file.svg",
//     title: "Figma File",
//     date: "01-03-2021",
//     size: "3.5mb",
//   ),
//   RecentFileinfo(
//     icon: "assets/icons/Documents.svg",
//     title: "Document",
//     date: "01-03-2021",
//     size: "3.5mb",
//   ),
//   RecentFileinfo(
//     icon: "assets/icons/sound_file.svg",
//     title: "Sound File",
//     date: "01-03-2021",
//     size: "3.5mb",
//   ),
//   RecentFileinfo(
//     icon: "assets/icons/media_file.svg",
//     title: "Media File",
//     date: "01-03-2021",
//     size: "3.5mb",
//   ),
//   RecentFileinfo(
//     icon: "assets/icons/pdf_file.svg",
//     title: "Sales PDF",
//     date: "01-03-2021",
//     size: "3.5mb",
//   ),
//   RecentFileinfo(
//     icon: "assets/icons/excel_file.svg",
//     title: "Excel File",
//     date: "01-03-2021",
//     size: "3.5mb",
//   )
// ];
