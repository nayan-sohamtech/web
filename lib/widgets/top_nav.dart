import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';

enum Options { profile, email, settings }

var appBarHeight = AppBar().preferredSize.height;
AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Image.asset(
                    "assets/icons/logo.png",
                    width: 28,
                  ),
                ),
              ],
            )
          : IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              splashRadius: 1,
              onPressed: () {
                key.currentState?.openDrawer();
              },
            ),
      title: Row(
        children: [
          Visibility(
            visible: !ResponsiveWidget.isSmallScreen(context),
            child: Text(
              "Dash",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          //if (!ResponsiveWidget.isSmallScreen(context))
          Spacer(flex: ResponsiveWidget.isLargeScreen(context) ? 2 : 1),
          const Expanded(
            child: SearchField(),
          ),
          const ProfileCard(),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/image/profile_pic.png",
            //height: 38,
          ),
          if (!ResponsiveWidget.isSmallScreen(context))
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Angelina Joli"),
            ),
          PopUpMenu(
            icon: const Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.white,
            ),
            menuList: [
              const PopupMenuItem(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: primaryColor,
                    child: Text(
                      "n",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  title: Text(
                    "Nayan Moradiya",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "abcd@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: ListTile(
                  splashColor: bgColor,
                  leading: const Icon(Icons.person_sharp),
                  title: const Text("Profile"),
                  onTap: () {},
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.g_mobiledata_sharp),
                  title: Text("Google Account"),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.switch_account_sharp),
                  title: Text("Account"),
                  trailing: Icon(Icons.keyboard_arrow_right_sharp),
                ),
              ),
            ],
          ),
          // PopupMenuButton(
          //   color: primaryColor,
          //   icon: const Icon(
          //     Icons.keyboard_arrow_down,
          //     color: Colors.white,
          //   ),
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(10)),
          //   ),
          //   splashRadius: 1,
          //   offset: Offset(20.0, appBarHeight),
          //   itemBuilder: (context) => [
          //     PopupMenuItem(
          //       child: ListTile(
          //         leading: CircleAvatar(
          //           backgroundColor: bgColor,
          //         ),
          //         title: Text(
          //           "NM",
          //         ),
          //       ),
          //     ),

          // UserAccountsDrawerHeader(
          //   accountName: Text("Nayan Moradiya"),
          //   accountEmail: Text("Abcd@gmail.com"),
          //   currentAccountPicture: CircleAvatar(
          //     backgroundColor: primaryColor,
          //     child: Text(
          //       "NM",
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),

          // _popupMenuItem(
          //     "Profile", Icons.account_box, Options.profile.index),
          // _popupMenuItem("Email", Icons.email, Options.email.index),
          // _popupMenuItem(
          //     "Settings", Icons.settings, Options.settings.index),
        ],
      ),
      //const Icon(Icons.keyboard_arrow_down),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: secondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            //margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class PopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const PopUpMenu({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: bgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      splashRadius: 1,
      offset: Offset(17.0, appBarHeight),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}
// PopupMenuItem _popupMenuItem() {
//   return PopupMenuItem(
//     child: Row(
//       children: [
//         ListTile(
//           leading: Icon(),
//         )
//       ],
//     ),
//   );
// }
