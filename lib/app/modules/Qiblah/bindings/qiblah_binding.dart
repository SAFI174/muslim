import 'package:get/get.dart';

import '../controllers/qiblah_controller.dart';

class QiblahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QiblahController>(
      () => QiblahController(),
    );
  }
}
