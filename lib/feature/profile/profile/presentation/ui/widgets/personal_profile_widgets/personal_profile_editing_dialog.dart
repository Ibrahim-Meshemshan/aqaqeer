import 'dart:developer';
import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../../core/common/widgets/custom_alert_dialog.dart';
import '../../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../../core/common/widgets/dropdown/custom_drop_down.dart';
import '../../../../../../../core/common/widgets/icons/required_icon.dart';
import '../../../../../../../core/common/widgets/loader_widget.dart';
import '../../../../../../../core/common/widgets/my_custom_widgets/indicates_required_field_widget.dart';
import '../../../../../../../core/common/widgets/radio_btn/custom_radio_button.dart';
import '../../../../../../../core/common/widgets/snack_bar/snack_bar_custom.dart';
import '../../../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../../../../../core/injection/injection.dart';
import '../../../../data/model/gender_model.dart';
import '../../../../data/model/marital_status_model.dart';
import '../../../../domain/entities/personal_profile_param.dart';
import '../../../state/profile_bloc.dart';


class PersonalProfileEditDialog extends StatefulWidget {


  PersonalProfileEditDialog({
    super.key,

  });

  @override
  _PersonalProfileEditDialogState createState() =>
      _PersonalProfileEditDialogState();
}

class _PersonalProfileEditDialogState extends State<PersonalProfileEditDialog> {
  List<MaritalStatusModelDatum> maritalStatusList = [];
  List<GenderModelDatum> gendersList = [];
  late int _selectedGender;
  late int? selectedMaritalState;
  late TextEditingController fatherNameController;
  late ProfileBloc profileBloc;
  MaritalStatusModelDatum? selectedItem;
  @override
  void initState() {
    super.initState();
    profileBloc = locator.get<ProfileBloc>();
    _fetchProfileData();

  }

  void _fetchProfileData() {
    profileBloc.add(GetMaritalStatusEvent());
    profileBloc.add(GetGendersEvent());
    profileBloc.add(GetPersonalProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: profileBloc,
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listenWhen: (p,c) => p != c,
        listener: (context, state) {
          if (state.maritalStatusState.isSuccess() &&
              state.gendersState.isSuccess() &&
              state.personalProfileState.isSuccess() &&
              state.updatePersonalProfileState.isInitial()) {
            maritalStatusList = state.maritalStatusState.model?.data ?? [];
            gendersList = state.gendersState.model?.data ?? [];
            fatherNameController = TextEditingController(
                text: state.personalProfileState.model?.data.fatherName.value);
            if (state.personalProfileState.model?.data.maritalStatus.value !=
                null) {
              selectedItem = maritalStatusList.firstWhere(
                    (item) =>
                item.value ==
                    state.personalProfileState.model?.data.maritalStatus.value,
              );
            }

            _selectedGender =
                state.personalProfileState.model?.data.gender.value ?? 0;
            selectedMaritalState =
                state.personalProfileState.model?.data.maritalStatus.value;
          }

          if (state.updatePersonalProfileState.isSuccess()) {
            log('editPersonalProfileState isSuccess ${state.updatePersonalProfileState} ');
            // state.editPersonalProfileState=BlocStatus.initial();
            // profileBloc.add(GetPersonalProfileEvent());
            Navigator.pop(context);
            showSnackBar(
                context: context,
                message: 'تم تحديث الملف الشخصي بنجاح!',
                icon: Icons.check);
          }
          if (state.updatePersonalProfileState.isFail()) {
            log('editPersonalProfileState isFail ${state.updatePersonalProfileState} ');
            Navigator.pop(context);
            showSnackBar(
                context: context,
                message: state.updatePersonalProfileState.error??'',
                icon: Icons.warning_amber);
          }
        },
        builder: (context, state) {
          if (state.maritalStatusState.isLoading() ||
              state.gendersState.isLoading()||state.personalProfileState.isLoading()) {
            return CustomAlertDialog(
              title: 'تعديل الملف الشخصي',
              isTranslatedTitle: false,
              content: Container(
                  color: AppColors.transparent,
                  child: const Center(
                      child: LoaderWidget(
                        height: 75,
                      ))),
            );
          }
          if(state.maritalStatusState.isSuccess() &&
              state.gendersState.isSuccess()&&state.personalProfileState.isSuccess()) {
            return ModalProgressHUD(
              inAsyncCall: state.updatePersonalProfileState.isLoading(),
              color: AppColors.secondaryColor.withValues(alpha: 0.3),
              progressIndicator: LoaderWidget(),
              child: CustomAlertDialog(
                title: 'تعديل الملف الشخصي',
                isTranslatedTitle: false,
                content: SizedBox(
                  width: getWidthScreen(context) * 0.7,
                  height: getHeightScreen(context) / 1.5,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: state.personalProfileState.model?.data.gender.value == null ||
                              state.personalProfileState.model?.data.maritalStatus.value == null ||
                              state.personalProfileState.model?.data.fatherName.value == null,
                          child: IndicatesRequiredFieldWidget(),
                        ),
                        _buildTextField(
                            controller: TextEditingController(
                                text: state.personalProfileState.model?.data.firstName.value ?? ''),
                            label: ('first_name').tr(context),
                            readOnly: state.personalProfileState.model?.data.firstName.isLocked ?? true),
                        _buildTextField(
                            controller: TextEditingController(
                                text: state.personalProfileState.model?.data.lastName.value ?? ''),
                            label: ('last_name').tr(context),
                            readOnly: state.personalProfileState.model?.data.lastName.isLocked ?? false),
                        _buildTextField(
                            controller: TextEditingController(
                                text: state.personalProfileState.model?.data.nationalId.value ?? ''),
                            label: ('national_id').tr(context),
                            readOnly: state.personalProfileState.model?.data.nationalId.isLocked ?? false),
                        _buildTextField(
                            controller: TextEditingController(
                                text: state.personalProfileState.model?.data.birthDate.value ?? ''),
                            label: ('birthdate').tr(context),
                            readOnly: state.personalProfileState.model?.data.birthDate.isLocked ?? false),
                        _buildTextField(
                            controller: fatherNameController,
                            label: ('father_name').tr(context),
                            readOnly: state.personalProfileState.model?.data.fatherName.isLocked ?? false,
                            prefixIcon: state.personalProfileState.model?.data.fatherName.value == null
                                ? const RequiredFieldIcon()
                                : null),
                        const SizedBox(height: 10),
                        CustomDropDown<MaritalStatusModelDatum>(
                          prefixIcon: selectedMaritalState == null
                              ? RequiredFieldIcon()
                              : null,

                          itemAsString: (MaritalStatusModelDatum item) =>
                          item.text,
                          filled: false,
                          border: const UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(),
                          selectedItem: selectedItem,
                          onChange: (MaritalStatusModelDatum? newValue) {
                            setState(() {
                              selectedItem = newValue;
                              // selectedItem.value = newValue?.value ??0;
                            });
                          },
                          list: (_, __) => maritalStatusList,
                          label: 'الحالة الإجتماعية',
                          compareFn: (_, __) => true,
                          backgroundColor: Colors.white,
                          // searchEnabled: true,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Visibility(
                                visible: _selectedGender == 0,
                                child: const RequiredFieldIcon()),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CustomText(
                                text: 'الجنس',
                                style: CustomTextStyle.bodySmall(context),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: gendersList
                              .map((gender) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0),
                            // Horizontal padding for spacing in Row
                            child: CustomRadioButton(
                              width: getWidthScreen(context)/5.5,
                              text: gender.text,
                              icon: gender.value == 1
                                  ? Icons.male
                                  : Icons.female,
                              value: gender.value,
                              groupValue: _selectedGender,
                              onChanged: (int? value) {
                                if (state.personalProfileState.model?.data.gender.value == null) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                }
                              },
                            ),
                          ))
                              .toList(),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                onAcceptButtonPressed: () {
                  if (fatherNameController.text.trim().isEmpty ||
                      selectedItem == null ||
                      _selectedGender == 0) {
                    showSnackBar(
                      context: context,
                      message: 'يرجى ملئ جميع الحقول المطلوبة!',
                      icon: Icons.warning_amber,
                    );
                    return;
                  }

                  final PersonalProfileParam param = PersonalProfileParam(
                    fatherName: fatherNameController.text.trim(),
                    maritalStatusId: selectedItem!.value.toString(),
                    birthDate: state.personalProfileState.model?.data.birthDate.value ?? '',
                    genderId: _selectedGender.toString(),
                  );
                  profileBloc.add(UpdatePersonalProfileEvent(param: param));
                },

                acceptButtonNameKey: 'save',
              ),
            );
          }
          return CustomAlertDialog(
            title: 'تعديل الملف الشخصي',
            isTranslatedTitle: false,
            content: Container(
            ),
          );
        },
      ),
    );
  }
}

Widget _buildTextField(
    {required TextEditingController controller,
      required String label,
      required bool readOnly,
      Widget? prefixIcon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: CustomTextField(
      controller: controller,
      label: label,
      border: false,
      readOnly: readOnly,
      prefixIcon: prefixIcon,
    ),
  );
}


