import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatePopup extends StatelessWidget {
  const UpdatePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Change File Name'),
          
          content: Column(
            children: [
              buildTextFormField('File Name', keyboardType: TextInputType.text),
              buildTextFormField('Date', keyboardType: TextInputType.datetime),
              buildTextFormField('Size', keyboardType: TextInputType.number),
            ],
          ),

          actions: <Widget>[
            if (Responsive.isMobile(context) ||
                Responsive.isDesktop(context) ||
                Responsive.isTablet(context))
              const AddFile(),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      icon: const Icon(Icons.edit),
    );
  }

  Widget buildTextFormField(String labalText,
      {required TextInputType keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Form(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: labalText,
            labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

class AddFile extends StatelessWidget {
  const AddFile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shadowColor: Colors.white,
        color: secondaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        splashRadius: 1,
        offset: const Offset(-40.0, -200.0),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        itemBuilder: (context) => <PopupMenuEntry>[
              const PopupMenuItem(
                enabled: false,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: active,
                    child: Text(
                      "n",
                      style: TextStyle(
                          color: Colors.white, fontSize: 22),
                    ),
                  ),
                  title: Text(
                    "Nayan Moradiya",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "abcd@gmail.com",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
            ]);
  }
}
