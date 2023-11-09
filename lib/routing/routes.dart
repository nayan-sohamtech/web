const rootRoute = "/";

const dashboardPageDisplayName = "Dashboard";
const dashboardPageRoute = "/dashboard";

const transactionPageDisplayName = "Transaction";
const transactionPageRoute = "/transaction";

const taskPageDisplayName = "Task";
const taskPageRoute = "/task";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(dashboardPageDisplayName, dashboardPageRoute),
  MenuItem(transactionPageDisplayName, transactionPageRoute),
  MenuItem(taskPageDisplayName, taskPageRoute),
  MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];
