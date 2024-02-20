import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/widgets/images/image_profile.dart';
import '../../../../../core/widgets/snackbar/snackbar.dart';

class CustomImgProfilePage extends StatefulWidget {
  const CustomImgProfilePage({
    super.key,
  });

  @override
  State<CustomImgProfilePage> createState() => _CustomImgProfilePageState();
}

class _CustomImgProfilePageState extends State<CustomImgProfilePage> {
  final picker = ImagePicker();
  File? image;

  Future<void> pickImageFromGallery(BuildContext context) async {
    try {
      final pickImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        image = File(pickImage.path);
        setState(() {});
      }
    } catch (e) {
      AppSnackBar.snackBarError(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomRight, children: [
      // * Image
      SizedBox(height: 140.h, child: const ImageProfile()),
      // * Edite Image Btn
      IconButton(
          onPressed: () {
            pickImageFromGallery(context);
          },
          icon: Icon(
            Icons.camera_alt,
            size: 35.sp,
          )),
    ]);
  }
}
