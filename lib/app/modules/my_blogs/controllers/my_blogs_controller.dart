import 'package:blog_app/app/data/firebase/firebase_functions.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:blog_app/app/models/blog_model.dart';
import 'package:get/get.dart';

class MyBlogsController extends GetxController {
  final FirebaseFunctions _functions = FirebaseFunctions();
  List blogsId = [];
  List<BlogsModel> myBlogs = [];

  void getMyBlogData() async {
    blogsId = await _functions.getMyBlogs();
    if (blogsId.isNotEmpty) {
      for (var i = 0; i < blogsId.length; i++) {
        BlogsModel model = await _functions.getBlogById(blogsId[i]);
        myBlogs.add(model);
      }
    }
    update();
    Indicator.closeLoading();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Indicator.showLoading();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyBlogData();
  }
}
