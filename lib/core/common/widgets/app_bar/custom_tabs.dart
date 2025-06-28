import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';



class CustomTabs extends StatefulWidget {
  final List<Widget> tabs;
  final TabController tabController;
  final void Function(int)?  onTap;

  const CustomTabs({
    super.key,
    required this.tabs,
    required this.tabController,
    this.onTap
  });

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  @override
  void initState() {
    super.initState();
    // Listen to tab index changes
    widget.tabController.addListener(_updateState);
  }

  void _updateState() {
    // Update the state when the tab index changes
    setState(() {});
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_updateState);
    super.dispose();
  }

  void _goToNextTab() {
    if (widget.tabController.index < widget.tabs.length - 1) {
      widget.tabController.animateTo(widget.tabController.index + 1);
    }
  }

  void _goToPreviousTab() {
    if (widget.tabController.index > 0) {
      widget.tabController.animateTo(widget.tabController.index - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isScrollable = widget.tabs.length > 2;

    return Container(
      height: MediaQuery.sizeOf(context).height * 0.07,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          // Backward arrow button
          if (isScrollable && widget.tabController.index > 0)
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: _goToPreviousTab,
              color: Colors.black,
            ),
          Expanded(
            child: TabBar(
              onTap:widget.onTap,
              controller: widget.tabController,
              isScrollable: isScrollable,
              labelColor: Colors.white,
              dividerHeight:0 ,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: AppColors.primaryColor,
              ),
              tabs: widget.tabs,
            ),
          ),
          // Forward arrow button
          if (isScrollable &&
              widget.tabController.index < widget.tabs.length - 1)
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: _goToNextTab,
              color: Colors.black,
            ),
        ],
      ),
    );
  }
}
