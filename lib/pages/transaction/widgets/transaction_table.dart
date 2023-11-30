import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_dashboard/constants/re_usable_text.dart';

import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/user_controller.dart';
import 'package:flutter_web_dashboard/pages/transaction/widgets/create_file.dart';

import 'package:get/get.dart';

/// Example without datasource
class TransactionsTable extends GetView<FileController> {
  const TransactionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FileController());
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Recent Files",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  width: double.infinity,
                  height: (60 * 7) + 40,
                  child: Obx(
                    () => DataTable2(
                      columnSpacing: 10,
                      dataRowHeight: 60,
                      headingRowHeight: 40,
                      horizontalMargin: 12,
                      minWidth: 600,
                      columns: const [
                        DataColumn(
                          label: Text("FIle Name"),
                        ),
                        DataColumn(
                          label: Text("Date"),
                        ),
                        DataColumn(
                          label: Text("Size"),
                        ),
                        DataColumn(
                          label: Text("Update"),
                        ),
                      ],
                      rows: List.generate(
                        controller.demoRecentFiles.length,
                        (index) {
                          var dataRow = controller.demoRecentFiles[index];
                          return DataRow(
                            selected: index == controller.selected1Index.value,
                            onSelectChanged: (selected) {
                              controller.set1SelectedIndex(index);
                            },
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      dataRow.icon,
                                      height: 25,
                                      width: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: defaultPadding,
                                      ),
                                      child: Text(dataRow.title),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Text(dataRow.date),
                              ),
                              DataCell(
                                Text(dataRow.size),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        controller.title2Controller.text =
                                            dataRow.title;
                                        controller.date2Controller.text =
                                            dataRow.date;
                                        controller.size2Controller.text =
                                            dataRow.size;
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return customDailog2(
                                              context,
                                              index,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () => showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            customDailog(
                                          context,
                                          index,
                                        ),
                                      ),
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const CreateFile(),
          ),
        ],
      ),
    );
  }

  Widget customDailog2(BuildContext context, int index) {
    return Dialog(
      child: SizedBox(
        height: 280,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              buildTextField2(controller.title2Controller, 'File Name'),
              const SizedBox(height: 10),
              buildTextField2(controller.date2Controller, 'Date'),
              const SizedBox(height: 10),
              buildTextField2(controller.size2Controller, 'Size'),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.editRow(
                        index,
                        controller.date2Controller.text,
                        controller.date2Controller.text,
                        controller.date2Controller.text,
                        controller.icon2Controller.text,
                      );
                      Get.back();
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  customDailog(BuildContext context, int index) {
    return Dialog(
      child: SizedBox(
        height: 110,
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              normalGreyText(
                  "Confirm that you want to delete this file?", light),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.deleteRow(index);
                      Get.back();
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  //final TableController controller =
//    Get.put(TableController());
//     return Padding(
//       padding: const EdgeInsets.all(defaultPadding),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Recent Files",
//             style: Theme.of(context).textTheme.labelLarge,
//           ),
//           SizedBox(
//             //width: double.infinity,
//             height: (60 * 7) + 40,
//             child: Obx(
//               () => DataTable2(
//                 columnSpacing: defaultPadding,
//                 dataRowHeight: 60,
//                 headingRowHeight: 40,
//                 horizontalMargin: 0,
//                 minWidth: 600,
//                 columns: const [
//                   DataColumn2(
//                     label: Text("File Name"),
//                     //size: ColumnSize.L,
//                   ),
//                   DataColumn(
//                     label: Text("Date"),
//                   ),
//                   DataColumn(
//                     label: Text("Update"),
//                   ),
//                 ],
//                 rows: List<DataRow>.generate(controller.data.length, (index) {
//                   var rowData = controller.data[index];
//                   return DataRow(
//                     selected: index == controller.selectedIndex.value,
//                     onSelectChanged: (selected) {
//                       controller.setSelectedIndex(selected! ? index : -1);
//                     },
//                     cells: [
//                       DataCell(
//                         Text(rowData.title),
//                       ),
//                       DataCell(
//                         Text(
//                           rowData.date,
//                         ),
//                       ),

//                       DataCell(
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.edit),
//                               onPressed: () {
//                                 controller.titleController.text = rowData.title;
//                                 controller.dateController.text = rowData.date;
//                                 showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return AlertDialog(
//                                       title: const Text('Edit Row'),
//                                       content: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           TextField(
//                                             controller:
//                                                 controller.titleController,
//                                             decoration: const InputDecoration(
//                                                 labelText: 'Name'),
//                                           ),
//                                           TextField(
//                                             controller:
//                                                 controller.dateController,
//                                             decoration: const InputDecoration(
//                                                 labelText: 'Age'),
//                                             keyboardType: TextInputType.number,
//                                           ),
//                                         ],
//                                       ),
//                                       actions: [
//                                         TextButton(
//                                           onPressed: () {
//                                             Navigator.of(context).pop();
//                                           },
//                                           child: const Text('Cancel'),
//                                         ),
//                                         TextButton(
//                                           onPressed: () {
//                                             controller.editRow(
//                                                 index,
//                                                 controller.titleController.text,
//                                                 controller.dateController.text);
//                                             Get.back();
//                                           },
//                                           child: const Text('Save'),
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 );
//                               },
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.delete),
//                               onPressed: () {
//                                 controller.deleteRow(index);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//           ),
//           FloatingActionButton(onPressed: () {}, child: const CreateFile())
//         ],
//       ),
//     );
//   }
// }