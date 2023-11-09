import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = dashboardPageDisplayName.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case dashboardPageDisplayName:
        return _customIcon("assets/icons/menu_dashboard.svg", itemName);
      case transactionPageDisplayName:
        return _customIcon("assets/icons/menu_tran.svg", itemName);
      case taskPageDisplayName:
        return _customIcon("assets/icons/menu_task.svg", itemName);
      case authenticationPageDisplayName:
        return _customIcon("assets/icons/menu_dashboard.svg", itemName);
      default:
        return _customIcon("assets/icons/menu_dashboard.svg", itemName);
    }
  }

  Widget _customIcon(String icon, String itemName) {
    if (isActive(itemName)) {
      return SvgPicture.asset(icon,
          height: 22,
          width: 22,
          colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn));
    }

    return SvgPicture.asset(icon,
        colorFilter: ColorFilter.mode(
            isHovering(itemName) ? Colors.white : lightGrey, BlendMode.srcIn));
  }
}
