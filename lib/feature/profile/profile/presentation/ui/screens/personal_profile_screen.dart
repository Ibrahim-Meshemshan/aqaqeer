import 'dart:io';

import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/resources/assets.gen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/app_bar/custom_app_bar.dart';
import '../../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../widgets/delete_account_section.dart';

class PersonalProfileScreen extends StatefulWidget {
  const PersonalProfileScreen({super.key});

  @override
  State<PersonalProfileScreen> createState() => _PersonalProfileScreenState();
}

class _PersonalProfileScreenState extends State<PersonalProfileScreen> {
   String? firstName;
   String? lastName;
   String? nationalId;
   bool? allowPhotoUpload;
  File? selectedImage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: Icon(Icons.cancel),
        centerTitle: true,
        title: AppLocalizations.of(context)!.personal_profile,
        fontColor: AppColors.black,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.primaryGray,
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 50),
                        Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                  ],
                                ),
                                const SizedBox(height: 20),
                                _buildTextField(firstName ?? 'محمد',AppLocalizations.of(context)!.first_name),
                                _buildTextField(lastName ?? 'نبيل', AppLocalizations.of(context)!.last_name),
                                // _buildTextField(nationalId ?? '204008855', 'nationalId'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: getWidthScreen(context) / 3,
                      top: 0,
                      child: badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: AppColors.transparent,
                        ),
                        position: badges.BadgePosition.bottomStart(
                          bottom: -3,
                          start: 0,
                        ),
                        showBadge: false,
                        badgeContent: GestureDetector(
                          // onTap: () async {
                          //   final permissionStatus =
                          //   await checkPermission();
                          //   if (permissionStatus.isDenied ||
                          //       permissionStatus
                          //           .isPermanentlyDenied ||
                          //       permissionStatus.isLimited) {
                          //     showSnackBar(
                          //       context: context,
                          //       icon: Icons.warning_amber,
                          //       message: permissionStatus
                          //           .isPermanentlyDenied
                          //           ? 'تم رفض صلاحية الوصول بشكل دائم، يمكنك منح السماحية من الإعدادات'
                          //           : 'لم يتم منح السماحية، لا يمكن التحميل ',
                          //     );
                          //     return;
                          //   }
                          //   if (permissionStatus.isGranted) {
                          //     pickAndUploadImage(context);
                          //     return;
                          //   }
                          // },
                          child: const Icon(
                            Icons.add_a_photo,
                            color: AppColors.gray,
                            size: 28,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 90,
                              height: 90,
                              child: ModalProgressHUD(
                                inAsyncCall: false,
                                color: AppColors.transparent,
                                progressIndicator:
                                    const CircularProgressIndicator(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.primaryGray,
                                      width: 5,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                      Assets.images.aqaqeerLogo.path,
                                    ),
                                    backgroundColor: AppColors.transparent, // Optional, prevents default background color
                                  ),
                                ),
                              ),
                            ),
                            // if (state.uploadPhotoState
                            //     .isLoading())
                            //   const CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // ContactSection(contactModel: contactModel),
                SizedBox(height: 20),
                DeleteAccountSection(),
              ],
            ),
          ),
        ],

        //   if (state.personalProfileState.isFail()) {
        //     return CustomPlaceholder(
        //       message: state.personalProfileState.error,
        //     );
        //   }
        //
        //   if (state.contactProfileState.isFail()) {
        //     return CustomPlaceholder(
        //       message: state.contactProfileState.error,
        //     );
        //   }
        //   return Container();
        // },
      ),
    );
  }

  Widget _buildTextField(String text, String label) {
    return Column(
      children: [
        CustomTextField(
          // initialValue: text,
          filledColor: AppColors.white,
          label: label.tr(context),
          readOnly: true,
          border: false,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  XFile? pickedFile;

  // Future<void> pickAndUploadImage(BuildContext context) async {
  //   final ImagePicker picker = ImagePicker();
  //   pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   DateTime time = DateTime.now();
  //   final String targetPath = p.join(
  //     Directory.systemTemp.path,
  //     'imagetemp-webp-${time.second}.webp',
  //   );
  //   final XFile? compressedImageFile =
  //   await FlutterImageCompress.compressAndGetFile(
  //       pickedFile?.path ?? '',
  //       // minHeight: 1000,
  //       // minWidth: 1000,
  //       targetPath,
  //       // quality: quality,
  //       format: CompressFormat.webp);
  //
  //   if (compressedImageFile == null) return;
  //
  //   context
  //       .read<ProfileBloc>()
  //       .add(UploadPhotoEvent(file: compressedImageFile));
  // }
}
