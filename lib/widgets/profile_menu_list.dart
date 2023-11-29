import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/pages/profile/profile_page.dart';
import 'package:get/get.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var appBarHeight = AppBar().preferredSize.height;
    return PopupMenuButton(
      color: secondaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      splashRadius: 1,
      offset: Offset(17.0, appBarHeight),
      icon: const Icon(
        Icons.keyboard_arrow_down,
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
                style: TextStyle(color: Colors.white, fontSize: 22),
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
        const PopupMenuDivider(),
        PopupMenuItem(
          child: ListTile(
            splashColor: bgColor,
            leading: const Icon(Icons.person_sharp),
            title: const Text("Profile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
        ),
        const PopupMenuItem(
          child: SwitchAccount(),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.translate_sharp),
            title: Text("Language: English"),
          ),
        ),
        const PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.language_outlined),
            title: Text("Location: India"),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          child: ListTile(
            splashColor: bgColor,
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {},
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          child: ListTile(
            splashColor: bgColor,
            leading: const Icon(Icons.help_outline_outlined),
            title: const Text("Help"),
            onTap: () {},
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            splashColor: bgColor,
            leading: const Icon(Icons.feedback_outlined),
            title: const Text("Send feedback"),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class SwitchAccount extends StatelessWidget {
  const SwitchAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shadowColor: Colors.white,
      color: secondaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      splashRadius: 1,
      offset: const Offset(-200.0, 56),
      child: const ListTile(
        leading: Icon(Icons.switch_account_sharp),
        title: Text("Switch Account"),
        trailing: Icon(Icons.keyboard_arrow_right_sharp),
      ),
      onSelected: (selaction) {
        Get.off(context);
        //Navigator.pop(context);
      },
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem(
          enabled: false,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_sharp),
                splashRadius: 1,
              ),
              //Spacer(),
              const Padding(
                padding: EdgeInsets.only(left: defaultPadding / 2),
                child: Text(
                  "Account",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          enabled: false,
          child: ListTile(
            title: Text(
              "Nayan Moradiya",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
            subtitle: Text(
              "abcd@gmail.com",
              style: TextStyle(color: Colors.white54, fontSize: 13),
            ),
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.person_add_outlined),
            title: Text("Add Account"),
          ),
        ),
        const PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.login_outlined),
            title: Text("Sign out"),
          ),
        ),
      ],
    );
  }
}
