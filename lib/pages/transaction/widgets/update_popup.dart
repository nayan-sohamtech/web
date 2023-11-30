import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/controllers/user_controller.dart';
import 'package:get/get.dart';

class UpdatePopup extends GetView<FileController> {
  const UpdatePopup({super.key});

  @override
  Widget build(BuildContext context) {
    //final TableController controller =
    Get.put(FileController());

    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('edit New File'),
          content: Column(
            children: [
              TextField(
                controller: controller.title2Controller,
                decoration: const InputDecoration(hintText: 'File Name'),
              ),
              TextField(
                controller: controller.date2Controller,
                decoration: const InputDecoration(hintText: 'Date'),
              ),
              TextField(
                controller: controller.size2Controller,
                decoration: const InputDecoration(hintText: 'Size'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.addRow(
                    controller.title2Controller.text,
                    controller.date2Controller.text,
                    controller.size2Controller.text,
                    controller.icon2Controller.text);
                Get.back();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
      icon: const Icon(Icons.edit),
    );
  }
}
