import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/dashboard/widgets/my_files.dart';
import 'package:flutter_web_dashboard/pages/dashboard/widgets/recent_file.dart';
import '../dashboard/widgets/storage_details.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(height: defaultPadding),
                      const RecentFile(),
                      if (ResponsiveWidget.isSmallScreen(context))
                        const SizedBox(height: defaultPadding),
                      if (ResponsiveWidget.isSmallScreen(context))
                        const StorageDetails(),
                    ],
                  ),
                ),
                if (!ResponsiveWidget.isSmallScreen(context))
                  const SizedBox(width: defaultPadding),
                // on Mobile means if the screen is less than 850 we dont want to show it
                if (!ResponsiveWidget.isSmallScreen(context))
                  const Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
