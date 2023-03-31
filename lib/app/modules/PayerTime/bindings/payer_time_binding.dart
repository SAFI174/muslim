import 'package:get/get.dart';

import '../controllers/payer_time_controller.dart';

class PayerTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayerTimeController>(
      () => PayerTimeController(),
    );
  }
}
