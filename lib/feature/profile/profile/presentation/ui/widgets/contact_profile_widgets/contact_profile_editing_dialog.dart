import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../../core/common/function/validator.dart';
import '../../../../../../../core/common/widgets/custom_alert_dialog.dart';
import '../../../../../../../core/common/widgets/dropdown/custom_drop_down.dart';
import '../../../../../../../core/common/widgets/icons/required_icon.dart';
import '../../../../../../../core/common/widgets/loader_widget.dart';
import '../../../../../../../core/common/widgets/my_custom_widgets/indicates_required_field_widget.dart';
import '../../../../../../../core/common/widgets/snack_bar/snack_bar_custom.dart';
import '../../../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../../../../../core/injection/injection.dart';
import '../../../../data/model/countries_model.dart';
import '../../../state/profile_bloc.dart';



class ContactProfileEditingDialog extends StatefulWidget {
  final BuildContext scaffoldContext;

  ContactProfileEditingDialog({
    super.key,
    required this.scaffoldContext,
  });

  @override
  _ContactProfileEditingDialogState createState() =>
      _ContactProfileEditingDialogState();
}

class _ContactProfileEditingDialogState
    extends State<ContactProfileEditingDialog> {
  late ProfileBloc profileBloc;
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  late int? selectedStatesState;
  List<CountriesModelData> statesList = [];
  CountriesModelData? selectedItem;


  @override
  void initState() {
    super.initState();
    profileBloc = locator.get<ProfileBloc>();
    _fetchProfileData();
  }

  void _fetchProfileData() {
    profileBloc.add(GetContactProfileEvent());
    profileBloc.add(GetStatesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: profileBloc,
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.contactProfileState.isSuccess() &&
              state.statesState.isSuccess() &&
              state.updateContactProfileState.isInitial()) {
            // Only update controllers when initially fetching data
            statesList = state.statesState.model?.data ?? [];
            emailController.text =
                state.contactProfileState.model?.data.email.value ?? '';
            addressController.text =
                state.contactProfileState.model?.data.address.value ?? '';
            mobileController.text =
                state.contactProfileState.model?.data.mobile.value ?? '';
            if (state.contactProfileState.model?.data.state.value !=
                null) {
              selectedItem = statesList.firstWhere(
                    (item) =>
                item.value ==
                    state.contactProfileState.model?.data.state.value,
              );
            }
            selectedStatesState =
                state.contactProfileState.model?.data.state.value;
          }
          if (state.updateContactProfileState.isSuccess()) {
            Navigator.pop(context);
            showSnackBar(
                context: context,
                message: 'تم تحديث  ملف التواصل بنجاح!',
                icon: Icons.check);
          }
          if (state.updateContactProfileState.isFail()) {
            Navigator.pop(context);
            showSnackBar(
                context: context,
                message: state.updateContactProfileState.error ?? '',
                icon: Icons.warning_amber);
          }
        },
        builder: (context, state) {
          if (state.contactProfileState.isLoading()||state.statesState.isLoading()) {
            return CustomAlertDialog(
              title: 'تعديل ملف التواصل',
              isTranslatedTitle: false,
              content: Container(
                  color: AppColors.transparent,
                  height: getHeightScreen(context) / 2.7,
                  child: const Center(
                      child: LoaderWidget(
                        height: 75,
                      ))),
            );
          }
          if (state.contactProfileState.isSuccess()&&state.contactProfileState.isSuccess()) {
            return ModalProgressHUD(
              inAsyncCall: state.updateContactProfileState.isLoading(),
              color: AppColors.secondaryColor.withValues(alpha: 0.3),
              progressIndicator: LoaderWidget(),
              child: CustomAlertDialog(
                title: 'تعديل ملف التواصل',
                isTranslatedTitle: false,
                content: SizedBox(
                  width: getWidthScreen(context) * 0.7,
                  height: getHeightScreen(context) / 2.4,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: state.contactProfileState.model?.data.state
                              .value ==
                              null
                          ,
                          child: IndicatesRequiredFieldWidget(),
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: _buildTextField(
                              controller: mobileController,
                              // label: ('mobile').tr(context),
                              readOnly: state.contactProfileState.model?.data
                                  .mobile.isLocked ??
                                  true),
                        ),
                        const SizedBox(height: 10),
                        CustomDropDown<CountriesModelData>(
                          prefixIcon: selectedStatesState == null
                              ? RequiredFieldIcon()
                              : null,

                          itemAsString: (CountriesModelData item) =>
                          item.text??'',
                          filled: false,
                          border: const UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(),
                          selectedItem: selectedItem,
                          onChange: (CountriesModelData? newValue) {
                            setState(() {
                              selectedItem = newValue;
                              // selectedItem.value = newValue?.value ??0;
                            });
                          },
                          list: (_, __) => statesList,
                          label: 'المحافظة',
                          compareFn: (_, __) => true,
                          backgroundColor: Colors.white,
                          searchEnabled: true,
                          // searchEnabled: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CustomTextField(
                            controller: emailController,
                            label: ('email').tr(context),
                            // filled: false,
                            border: false,
                            readOnly: state.contactProfileState.model?.data
                                .email.isLocked ??
                                true,
                            isEmail: true,
                          ),
                        ),
                        _buildTextField(
                          controller: addressController,
                          label: ('address').tr(context),
                          readOnly: state.contactProfileState.model?.data
                              .address.isLocked ??
                              true,
                        ),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                onAcceptButtonPressed: () {
                  // if (emailController.text.trim().isNotEmpty) {
                  //   String? emailError = validator(
                  //     value: emailController.text.trim(),
                  //     context: context,
                  //     isEmail: true,
                  //   );
                  //
                  //   showSnackBar(
                  //     context: widget.scaffoldContext,
                  //     message: emailError,
                  //     icon: Icons.warning_amber,
                  //   );
                  //   return;
                  //                   }
                  // if (selectedItem == null) {
                  //   showSnackBar(
                  //     context: widget.scaffoldContext,
                  //     message: 'يرجى اختيار المحافظة', // "Please select a state"
                  //     icon: Icons.warning_amber,
                  //   );
                  //   return;
                  // }
                  // // if (emailController.text.trim().isEmpty ||
                  // //     addressController.text.trim().isEmpty) {
                  // //   showSnackBar(
                  // //     context: widget.scaffoldContext, // مهم جدا
                  // //     message: 'يرجى ملئ جميع الحقول المطلوبة!',
                  // //     icon: Icons.warning_amber,
                  // //   );
                  // //   return;
                  // // }
                  //
                  //
                  // final ContactProfileParam param = ContactProfileParam(
                  //   address: addressController.text,
                  //   email: emailController.text,
                  //   state_id:selectedItem!.value.toString(),
                  // );
                  //
                  // profileBloc.add(UpdateContactProfileEvent(param: param));
                },

                acceptButtonNameKey: 'save',
              ),
            );
          }
          return CustomAlertDialog(
            title: 'تعديل الملف الشخصي',
            isTranslatedTitle: false,
            content: Container(),
          );
        },
      ),
    );
  }
}

Widget _buildTextField(
    {required TextEditingController controller,
      String label = '',
      required bool readOnly,
      Widget? prefixIcon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: CustomTextField(
      controller: controller,
      label: label,
      // filled: false,
      border: false,
      readOnly: readOnly,
      prefixIcon: prefixIcon,
    ),
  );
}

