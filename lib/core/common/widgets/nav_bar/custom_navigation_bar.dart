import 'package:flutter/material.dart';
import '../../config/theme/src/colors.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar(
      {super.key,
      required this.onDestinationSelected,
      required this.selectedIndex});

  final void Function(int index) onDestinationSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (index) {
        onDestinationSelected(index);
      },
      indicatorColor: AppColors.primaryColor,
      backgroundColor: AppColors.white,
      labelPadding: EdgeInsets.zero,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      selectedIndex: selectedIndex,
      animationDuration: const Duration(milliseconds: 300),
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home,
            color: AppColors.white,
            size: 30,
          ),
          icon: Icon(
            Icons.home_outlined,
            size: 28,
          ),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.dashboard,
            color: AppColors.white,
            size: 30,
          ),
          icon: Icon(
            Icons.dashboard_outlined,
            size: 28,
          ),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.person,
            color: AppColors.white,
            size: 30,
          ),
          icon: Icon(
            Icons.person_2_outlined,
            size: 28,
          ),
          label: '',
        ),
      ],
    );
  }
}
