import 'dart:io';

import 'package:blog_app/app/data/const.dart';
import 'package:blog_app/app/data/firebase/firebase_functions.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadBlogController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final FirebaseFunctions _functions = FirebaseFunctions();
  File? imageFile;

  Future<void> pickImage() async {
    try {
      ImagePicker _picker = ImagePicker();
      await _picker.pickImage(source: ImageSource.gallery).then((value) {
        if (value != null) {
          imageFile = File(value.path);
          update();
        }
      });
    } catch (e) {
      showAlert("$e");
    }
  }

  void createBlog() async {
    if (title.text.isNotEmpty && description.text.isNotEmpty) {
      if (imageFile != null) {
        Indicator.showLoading();
        await _functions
            .uploadBlog(title.text, description.text, imageFile!)
            .then((value) {
          Indicator.closeLoading();
          showAlert("Blog Created Successfully");
          Get.back();
        });
      } else {
        showAlert("Select an image");
      }
    } else {
      showAlert("All fields should be filled");
    }
  }
}
