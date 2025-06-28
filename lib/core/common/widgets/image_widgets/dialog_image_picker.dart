import 'dart:io';
import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class DialogImagePicker extends StatefulWidget {
  const DialogImagePicker({super.key});

  @override
  State<DialogImagePicker> createState() => _DialogImagePickerState();
}

class _DialogImagePickerState extends State<DialogImagePicker> {
  final ImagePicker picker = ImagePicker();
  // List<XFile> selectedImages = [];
  List<File> selectedImagesFile = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('select_image_source'.tr(context)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('from_camera'.tr(context)),
            onTap: () async {
              List<File> selectedImagesFromCamera = await getImageCamera(selectedImagesFile);
              if(context.mounted) {
                Navigator.pop(context,selectedImagesFromCamera);
              }
            },
          ),
          ListTile(
            title: Text('from_gallery'.tr(context)),
            onTap: () async {
              List<File> selectedImagesFromGallery =  await getImagesGallery(selectedImagesFile);

              if(context.mounted) {
                Navigator.pop(context,selectedImagesFromGallery);
              }
            },
          ),
        ],
      ),
    );
  }
  Future<List<File>> getImageCamera(List<File> selectedImageFromCamera) async {
    var img = await picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      selectedImageFromCamera.add(File(img?.path??''));
    });
    return selectedImageFromCamera;
  }

  Future<List<File>> getImagesGallery(List<File> selectedImageFromGallery) async {

    final pickedFile = await picker.pickMultiImage(
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    List<XFile> xfilePick = pickedFile;

    setState(
          () {
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {

            selectedImageFromGallery.add((File(xfilePick[i].path)));}
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
    return selectedImageFromGallery;
  }
}

