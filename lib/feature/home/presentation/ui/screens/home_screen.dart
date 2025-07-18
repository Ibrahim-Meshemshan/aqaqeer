import 'package:aqaqeer/core/injection/injection.dart';
import 'package:aqaqeer/feature/home/presentation/state/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/config/theme/src/colors.dart';
import '../widgets/bottom_home_section.dart';
import '../widgets/statics_section.dart';
import '../widgets/user_info_section.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // locator.get<AuthLocal>().saveAuthToken('value');
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserInfoSection(fullName: 'محمد نبيل'),
              StaticsPharmacySection(),
              PharmacyNewsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
