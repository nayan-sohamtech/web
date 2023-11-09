import 'package:flutter/material.dart';

import 'package:flutter_web_dashboard/pages/task/widgets/task_table.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: const [
              Taskstable(),
            ],
          ),
        ),
      ],
    );
  }
}
