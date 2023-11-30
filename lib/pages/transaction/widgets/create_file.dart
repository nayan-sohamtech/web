import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/re_usable_text.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/user_controller.dart';
import 'package:get/get.dart';

class CreateFile extends GetView<FileController> {
  const CreateFile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final TableController controller =
    Get.put(FileController());

    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => customDailog1(context),
      ),
      icon: const Icon(Icons.add),
    );
  }

  Widget customDailog1(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 280,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              buildTextField1(controller.newtitle2Controller, 'File Name'),
              const SizedBox(height: 10),
              buildTextField1(controller.newdate2Controller, 'Date'),
              const SizedBox(height: 10),
              buildTextField1(controller.newsize2Controller, 'Size'),
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
                      controller.addRow(
                          controller.newtitle2Controller.text,
                          controller.newdate2Controller.text,
                          controller.newsize2Controller.text,
                          controller.newicon2Controller.text);
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
}
