import 'package:flutter/material.dart';
import '../../../resources/assets.gen.dart';

class LoaderWidget extends StatelessWidget {
  final double? height;
  const LoaderWidget({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.images.loading,
        fit: BoxFit.fill,
        height: height?? 100,
        //  width: 180,
      ),
    );
  }
}
