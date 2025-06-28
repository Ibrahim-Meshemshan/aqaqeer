// import 'dart:io';
// import 'package:badges/badges.dart' as badges;
// import 'package:flutter/material.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sanad/core/common/config/lang/app_localizations.dart';
// import 'package:sanad/core/common/config/theme/src/colors.dart';
// import 'package:sanad/core/common/function/get_width_height_screen.dart';
// import 'package:sanad/core/common/widgets/text_field/custom_text_field.dart';
// import 'package:sanad/features/profile/data/model/personal_profile_model.dart';
// import 'package:sanad/features/profile/presentation/ui/widgets/personal_profile_widgets/personal_profile_editing_dialog.dart';
// import 'package:sanad/generated/assets.dart';
//
// class PersonalSection extends StatefulWidget {
//   final PersonalProfileModelData? profileModel;
//
//   PersonalSection({super.key, required this.profileModel});
//
//   @override
//   State<PersonalSection> createState() => _PersonalSectionState();
// }
//
// class _PersonalSectionState extends State<PersonalSection> {
//   late String firstName;
//
//   late String lastName;
//
//   late String nationalId;
//   late bool allowPhotoUpload;
//
//   @override
//   void initState() {
//     super.initState();
//     firstName = widget.profileModel?.firstName?.value ?? '';
//     lastName = widget.profileModel?.lastName?.value ?? '';
//     nationalId = widget.profileModel?.nationalId?.value ?? '';
//     allowPhotoUpload = widget.profileModel?.avatarPath?.isLocked ?? true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: AlignmentDirectional.bottomEnd,
//       children: [
//         Column(
//           children: [
//             SizedBox(height: 50),
//             Container(
//               alignment: Alignment.bottomCenter,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             showAdaptiveDialog(
//                               context: context,
//                               barrierDismissible: true,
//                               builder: (context) => PersonalProfileEditDialog(),
//                             );
//                           },
//                           icon: Transform.flip(
//                               flipX: true,
//                               child: Icon(Icons.mode_edit_outline,
//                                   color: AppColors.primaryColor)),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     _buildTextField(firstName, 'first_name'),
//                     _buildTextField(lastName, 'last_name'),
//                     _buildTextField(nationalId, 'national_id'),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Positioned(
//           right: getWidthScreen(context) / 3,
//           top: 0,
//           child: badges.Badge(
//             badgeStyle: badges.BadgeStyle(badgeColor: AppColors.transparent),
//             position: badges.BadgePosition.bottomStart(bottom: -3, start: 0),
//             showBadge: !allowPhotoUpload,
//             badgeContent: GestureDetector(
//               onTap: () {
//                 pickAndCompressImage();
//               },
//               child: Icon(
//                 Icons.add_a_photo,
//                 color: AppColors.darkGrey,
//                 size: 28,
//               ),
//             ),
//             child: Container(
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 shape: BoxShape.circle,
//                 border: Border.all(color: AppColors.primaryGrey, width: 5),
//               ),
//               child: Image.asset(
//                 Assets.imagesUser,
//                 fit: BoxFit.contain,
//                 width: 90,
//                 height: 90,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTextField(String text, String label) {
//     return Column(
//       children: [
//         CustomTextField(
//           // controller: controller,
//           initialValue: text,
//           label: label.tr(context),
//           filled: false,
//           readOnly: true,
//           border: false,
//         ),
//         SizedBox(height: 10),
//       ],
//     );
//   }
// }
// Future<XFile> pickAndCompressImage() async {
//   final ImagePicker picker = ImagePicker(); // Initialize ImagePicker
//   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//   if (pickedFile == null) {
//     throw Exception("No image selected!");
//   }
//
//   XFile compressImage = await compressImageFile(imageFile: File(pickedFile.path));
//   return compressImage;
// }
//
//
// Future<XFile> compressImageFile(
//     {
//       required File imageFile,
//       int quality = 80,
//       CompressFormat format = CompressFormat.webp
//     }) async {
//
//   DateTime time = DateTime.now();
//   var path;
//   final String targetPath = path.join(
//       Directory.systemTemp.path, 'imagetemp-${format.name}-$quality-${time.second}.${format.name}'
//   );
//
//   final XFile? compressedImageFile = await FlutterImageCompress.compressAndGetFile(
//       imageFile.path,
//       minHeight: 1000,
//       minWidth: 1000,
//       targetPath,
//       quality: quality,
//       format: format
//   );
//
//
//   if (compressedImageFile == null){
//     throw ("Image compression failed! Please try again.");
//   }
//
//   return compressedImageFile;
// }
// // Future<List<PlatformFile>> pickFile({String? refTypeID}) async {
// //   List<PlatformFile> selectedImages = [];
// //   FilePickerResult? result = await FilePicker.platform.pickFiles(
// //     allowMultiple: refType(refTypeID) == FileType.image ? true : false,
// //
// //     type: refType(refTypeID),
// //     allowedExtensions: refType(refTypeID) == FileType.custom
// //         ? [
// //       'doc',
// //       'docx',
// //       'xls',
// //       'xlsx',
// //       'vsd',
// //       'vsdx',
// //       'pst',
// //       'mpp',
// //       'pdf',
// //       'txt',
// //       "rar",
// //       "zip",
// //     ]
// //         : null,
// //   );
// //
// //   if (result != null) {
// //     selectedImages = result.files;
// //     // notifyListeners();
// //   }
// //
// //   return selectedImages;
// // }
//
// // FileType refType(String? refTypeID) {
// //   switch (refTypeID) {
// //     case "1":
// //     // setFileType(FileType.image);
// //       return FileType.image;
// //     case "3":
// //     //   setFileType(FileType.video);
// //
// //       return FileType.video;
// //     case "4":
// //     //   setFileType(FileType.audio);
// //
// //       return FileType.audio;
// //     default:
// //     // setFileType(FileType.custom);
// //       return FileType.custom;
// //   }
// // }