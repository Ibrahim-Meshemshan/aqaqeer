import 'package:aqaqeer/core/injection/injection.dart';
import 'package:aqaqeer/feature/home/presentation/state/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/ui/screens/home_screen.dart';
import '../../../profile/profile/presentation/ui/screens/profile_screen.dart';
import '../../../services/presentation/ui/screen/services_screen.dart';


class BodyRoot extends StatelessWidget {
  BodyRoot({super.key});

  PageController pageController = PageController(
      initialPage: 1, keepPage: false);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      scrollBehavior: const ScrollBehavior(),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ProfileScreen(),
        HomeScreen(),
        ProfileScreen(),

      ],
    );
  }
}
