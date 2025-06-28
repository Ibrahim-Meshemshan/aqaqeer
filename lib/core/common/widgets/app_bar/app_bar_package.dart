import 'package:flutter/material.dart';
import '../../config/theme/src/colors.dart';
import 'custom_tabs.dart';
import 'custom_title_app_bar.dart';
class AppBarPackage extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title;
  final List<Widget> tabs;
  final TabController tabController;
  final void Function(int)? onTap;

  const AppBarPackage({
    super.key,
    required this.context,
    required this.title,
    required this.tabs,
    required this.tabController,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height * .16),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              CustomTitleAppBar(
                title: title,
                showButtonIcon: true,
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomTabs(
                tabs: tabs,
                tabController: tabController,
                onTap:onTap ,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.sizeOf(context).height * .16);
}
