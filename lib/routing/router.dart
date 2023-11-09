import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/dashboard/dashboard.dart';
import 'package:flutter_web_dashboard/pages/task/task.dart';
import 'package:flutter_web_dashboard/pages/transaction/transaction.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case dashboardPageRoute:
      return _getPageRoute(const DashboardPage());
    case transactionPageRoute:
      return _getPageRoute(const TransactionsPage());
    case taskPageRoute:
      return _getPageRoute(const TasksPage());
    default:
      return _getPageRoute(const DashboardPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
