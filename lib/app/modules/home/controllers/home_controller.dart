import 'package:blog_app/app/data/firebase/firebase_functions.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:blog_app/app/models/blog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseFunctions _functions = FirebaseFunctions();
  final ScrollController controller = ScrollController();
  List<BlogsModel> blogs = [];
  var isLoading = false.obs;

  void getData() async {
    blogs.addAll(await _functions.getBlogs());

    update();
  }

  @override
  void onReady() {
    super.onReady();
    Indicator.showLoading();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
    _functions.isLoading.listen((p) {
      isLoading.value = p;
    });
    controller.addListener(() {
      double maxScrollPoint = controller.position.maxScrollExtent;
      double currenPosition = controller.position.pixels;
      double height20 = Get.size.height * 0.2;
      if (maxScrollPoint - currenPosition <= height20) {
        getData();
      }
    });
  }
}
