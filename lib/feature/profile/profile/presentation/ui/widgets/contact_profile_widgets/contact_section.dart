import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../data/model/contact_profile_model.dart';
import '../../../state/profile_bloc.dart';
import 'contact_profile_editing_dialog.dart';

class ContactSection extends StatefulWidget {
  final ContactProfileModelData? contactModel;

  const ContactSection({super.key, required this.contactModel});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'contact_info'.tr(context),
          style:
              CustomTextStyle.titleLarge(context, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.call,
                  size: 16,
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'ملف التواصل',
                        style: CustomTextStyle.bodySmall(
                          context,
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: CustomText(
                          text: widget.contactModel?.mobile.value ?? '',
                          style: CustomTextStyle.bodyMedium(
                            context,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showAdaptiveDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (dialogContext) => ContactProfileEditingDialog(
                        scaffoldContext: context, // <-- نمرّر السياق الأساسي
                      ),
                    ).then((result) {
                      if (result == true) {
                        context
                            .read<ProfileBloc>()
                            .add(GetContactProfileEvent());
                      }
                    });
                  },
                  icon: badges.Badge(
                    showBadge: widget.contactModel?.email.value == null ||
                            widget.contactModel?.address.value == null
                        ? true
                        : false,
                    position: badges.BadgePosition.topStart(top: 0, start: -5),
                    badgeStyle: badges.BadgeStyle(
                        padding: EdgeInsets.all(4),
                        badgeColor: AppColors.secondaryColor),
                    child: Transform.flip(
                      flipX: true,
                      child: Icon(
                        Icons.mode_edit_outline,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
