import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/models/demo_files.dart';
import 'package:flutter_web_dashboard/pages/dashboard/widgets/file_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Files",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        // ElevatedButton.icon(
        //   style: TextButton.styleFrom(
        //     padding: const EdgeInsets.symmetric(
        //         horizontal: defaultPadding * 1.5, vertical: defaultPadding),
        //   ),
        //   onPressed: () {},
        //   icon: const Icon(Icons.add),
        //   label: const Text("Add New"),
        // ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoGridView(
            crossAxixCount: size.width < 650 ? 2 : 4,
            childAspectRation: size.width < 650 ? 1.3 : 1,
          ),
          tablet: const FileInfoGridView(),
          desktop: FileInfoGridView(
            childAspectRation: size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
        // if (ResponsiveWidget.isLargeScreen(context) ||
        //     ResponsiveWidget.isMediumScreen(context))
        //   if (ResponsiveWidget.isCustomSize(context))
        //     FileInfoGridView(childAspectRation: size.width < 1400 ? 1.1 : 1.4)
        //   else
        //     const FileInfoGridView()
        // else
        //   FileInfoGridView(
        //     crossAxixCount: size.width < 650 ? 2 : 4,
        //     childAspectRation: size.width < 650 ? 1.3 : 1,
        //   )
      ],
    );
  }
}

class FileInfoGridView extends StatelessWidget {
  const FileInfoGridView({
    super.key,
    this.crossAxixCount = 4,
    this.childAspectRation = 1,
  });

  final int crossAxixCount;
  final double childAspectRation;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxixCount,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          childAspectRatio: childAspectRation),
      itemBuilder: (context, index) => FileInfoCard(
        info: demoFiles[index],
      ),
    );
  }
}
