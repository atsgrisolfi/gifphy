import 'package:aprendendo/home/Controller.dart';
import 'package:get/get.dart';
import '../repository/repository.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GifRepository());
    Get.put<HomePageController>(HomePageController(Get.find()));
  }
}