import 'package:flutter/material.dart';
import '../../config/theme/src/colors.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: Card(
            margin: EdgeInsets.zero,
            elevation: 2,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),

            ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
