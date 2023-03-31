import 'package:get/get.dart';

import '../../Azkar/controllers/azkar_controller.dart';
import '../controllers/azkar_detail_controller.dart';

class AzkarDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AzkarDetailController>(
      () => AzkarDetailController(),
    );
    
  }
}
