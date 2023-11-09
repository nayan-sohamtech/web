import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/transaction/widgets/transaction_table.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView(
          children: const [TransactionsTable()],
        )),
      ],
    );
  }
}
