import 'package:flutter/material.dart';
import '../../../../resources/assets.gen.dart';


class MainLogo extends StatelessWidget {
  const MainLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.icons.mainLogo.path,
        width: 150,
        height: 150,
      ),
    );
  }
}
