import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/models/demo_recent_files.dart';
import 'package:flutter_web_dashboard/pages/transaction/widgets/update_popup.dart';

/// Example without datasource
class TransactionsTable extends StatelessWidget {
  const TransactionsTable({super.key});

//   @override
//   State<TransactionsTable> createState() => _TransactionsTableState();
// }

// class _TransactionsTableState extends State<TransactionsTable> {
//   late List users;

//   @override
//   void initState() {
//     super.initState();

//     this.users = List.of(demoRecentFiles);
//   }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        // color: Colors.white,
        // border: Border.all(color: active.withOpacity(.4), width: .5),
        // boxShadow: [
        //   BoxShadow(
        //       offset: const Offset(0, 6),
        //       color: lightGrey.withOpacity(.1),
        //       blurRadius: 12)
        // ],

        //padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Files",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(
              width: double.infinity,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
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
                  demoRecentFiles.length,
                  (index) => recentFileDataRow(demoRecentFiles[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow recentFileDataRow(RecentFileinfo fileinfo) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              SvgPicture.asset(
                fileinfo.icon,
                height: 25,
                width: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(fileinfo.title),
              ),
            ],
          ),
        ),
        DataCell(
          Text(fileinfo.date),
        ),
        DataCell(
          Text(fileinfo.size),
        ),
        DataCell(
          Row(
            children: [
              const UpdatePopup(),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}



//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Recent Files",
//               style: Theme.of(context).textTheme.labelLarge,
//             ),
            
            
//             SizedBox(
//               //width: double.infinity,
//               height: (60 * 7) + 40,
//               child: DataTable2(
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
//                     label: Text("Size"),
//                   ),
//                   DataColumn(
//                     label: Text("Update"),
//                   ),
//                 ],
//                 rows: List<DataRow>.generate(
//                   15,
//                   (index) => DataRow(
//                     cells: [
//                       const DataCell(
//                         CustomText(text: "Santos Enoque"),
//                       ),
//                       const DataCell(CustomText(text: "New yourk city")),
//                       const DataCell(Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             Icons.star,
//                             color: Colors.deepOrange,
//                             size: 18,
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           CustomText(
//                             text: "4.5",
//                           )
//                         ],
//                       )),
//                       DataCell(
//                         Container(
//                           decoration: BoxDecoration(
//                             color: light,
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(color: active, width: .5),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 12, vertical: 6),
//                           child: CustomText(
//                             text: "Block",
//                             color: active.withOpacity(.7),
//                             weight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  // DataRow recentFileDataRow(RecentFileinfo fileinfo) {
  //   final cells = [fileinfo.icon, fileinfo.title, fileinfo.date, fileinfo.size];
  //   return DataRow(
  //     cells: Utils.modelBuilder(
  //       cells,
  //       (index, cell) {
  //         final showEdition = index == 3;
  //         return DataCell(Text('$cell'), showEditIcon: showEdition, onTap: () {
            // switch (index) {
            //   case 0:
            //     editFirstName(fileinfo);
            //     break;
            // case 1:
            //   editLastName(user);
            //   break;
            // }
  //         });
         
  //       },
  //     ),
  //   );
  // }

//   Future editFirstName(RecentFileinfo editUser) async {
//     final fileName = await showTextDialog(
//       context,
//       title: 'Change First Name',
//       value: editUser.title,
//     );

//     setState(() => users = users.map((user) {
//           final isEditedUser = user == editUser;

//           return isEditedUser ? user.copy(fileName: fileName) : user;
//         }).toList());
//   }
// }
