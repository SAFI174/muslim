import 'package:get/get.dart';

import 'package:muslim/app/modules/Azkar/controllers/azkar_controller.dart';
import 'package:muslim/app/modules/Home/controllers/home_controller.dart';
import 'package:muslim/app/modules/PayerTime/controllers/payer_time_controller.dart';
import 'package:muslim/app/modules/Qiblah/controllers/qiblah_controller.dart';
import 'package:muslim/app/modules/Quran/controllers/quran_controller.dart';

import '../controllers/dashborad_controller.dart';

class DashboradBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboradController>(
      () => DashboradController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<PayerTimeController>(
      () => PayerTimeController(),
      fenix: true,
    );
    Get.lazyPut<QuranController>(
      () => QuranController(),
    );
    Get.lazyPut<AzkarController>(
      () => AzkarController(),
      fenix: true,
    );
    Get.lazyPut<QiblahController>(
      () => QiblahController(),
    );
  }
}
