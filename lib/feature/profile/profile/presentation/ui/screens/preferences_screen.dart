import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/app_bar/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../widgets/change_language_section.dart';
import '../widgets/permissions_section.dart';



class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        title: (localizations.preferences),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.primaryGray,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChangeLanguageSection(),
              const SizedBox(height: 10),
              CustomText(
                text: localizations.app_permissions,
                style: CustomTextStyle.titleLarge(
                  context,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              PermissionsSection(),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesNames.privacyScreen);
                },
                child: Container(
                  width: getWidthScreen(context),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.white,
                  ),
                  child: Row(
                    children: [
                      CustomText(
                        text: localizations.privacy_policy,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.lightPurple,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
