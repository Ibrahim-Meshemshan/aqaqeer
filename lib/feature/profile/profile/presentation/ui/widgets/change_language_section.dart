// ignore_for_file: depend_on_referenced_packages
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/core/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../core/common/widgets/card/custom_card.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../core/di/di.dart';

class ChangeLanguageSection extends StatefulWidget {
  final String? lang;

  const ChangeLanguageSection({super.key, this.lang});

  @override
  State<ChangeLanguageSection> createState() => _ChangeLanguageSectionState();
}

class _ChangeLanguageSectionState extends State<ChangeLanguageSection> {
  late bool isArabicSelected;

  @override
  void initState() {
    super.initState();
    isArabicSelected = !getIt<AppConfigProvider>().isEn();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        CustomText(
          text: localization.lang_settings,
          style: CustomTextStyle.titleLarge(
            context,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              isArabicSelected = true;
            });
          },
          child: CustomCard(
            height: 50,
            borderRadius: 10,
            marginRight: 0,
            marginLeft: 0,
            marginBottom: 0,
            marginTop: 0,
            shadowColor: AppColors.chartGray,
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: localization.arabic,
                    style: CustomTextStyle.bodyLarge(context),
                  ),
                ),
                Radio<bool>(
                  value: true,
                  groupValue: isArabicSelected,
                  onChanged: (value) {
                    setState(() {
                      isArabicSelected = true;
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ],
            ),
          ),
        ),

        // English Option
        GestureDetector(
          onTap: () {
            setState(() {
              isArabicSelected = false;
            });
          },
          child: CustomCard(
            height: 50,
            borderRadius: 10,
            marginRight: 0,
            marginLeft: 0,
            marginBottom: 0,
            shadowColor: AppColors.chartGray,
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: localization.english,
                    style: CustomTextStyle.bodyLarge(context),
                  ),
                ),
                Radio<bool>(
                  value: false,
                  groupValue: isArabicSelected,
                  onChanged: (value) {
                    setState(() {
                      isArabicSelected = false;
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),
        Center(
          child: CustomButton(
            width: double.infinity,
            borderRadius: BorderRadius.circular(10),
            child: CustomText(
              text: localization.save,
              style: CustomTextStyle.titleMedium(context)?.copyWith(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              final appConfig = getIt<AppConfigProvider>();
              final newLanguage = isArabicSelected ? 'ar' : 'en';
              if (appConfig.getLocal() != newLanguage) {
                appConfig.changeLanguage(newLanguage);
              }
            },
          ),
        ),
      ],
    );
  }
}