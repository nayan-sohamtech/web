import 'package:flutter/material.dart';

import 'package:flutter_web_dashboard/pages/transaction/widgets/transaction_table.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //  SafeArea(
        //   child: SingleChildScrollView(
        //     padding: const EdgeInsets.all(defaultPadding),
        //     child: Column(children: [
        //       const SizedBox(height: defaultPadding),
        //       const RecentFile(),
        //       // if (ResponsiveWidget.isSmallScreen(context))
        //     ]),
        //   ),
        // );

        Column(
      children: [
        Expanded(
            child: ListView(
          children: const [TransactionsTable()],
        )),
      ],
    );
  }
}
