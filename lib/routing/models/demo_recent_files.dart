class RecentFileinfo {
  final String icon, title, date, size;

  RecentFileinfo({
    required this.icon,
    required this.title,
    required this.date,
    required this.size,
  });
}

List demoRecentFiles = [
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
];
