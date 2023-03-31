import 'package:get/get.dart';

import '../../Azkar/controllers/azkar_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
   
  }
}
