import 'package:get/get.dart';

import '../modules/Azkar/bindings/azkar_binding.dart';
import '../modules/Azkar/views/azkar_view.dart';
import '../modules/AzkarDetail/bindings/azkar_detail_binding.dart';
import '../modules/AzkarDetail/views/azkar_detail_view.dart';
import '../modules/Home/bindings/home_binding.dart';
import '../modules/Home/views/home_view.dart';
import '../modules/PayerTime/bindings/payer_time_binding.dart';
import '../modules/PayerTime/views/payer_time_view.dart';
import '../modules/Qiblah/bindings/qiblah_binding.dart';
import '../modules/Qiblah/views/qiblah_view.dart';
import '../modules/Quran/bindings/quran_binding.dart';
import '../modules/Quran/views/quran_view.dart';
import '../modules/dashborad/bindings/dashborad_binding.dart';
import '../modules/dashborad/views/dashborad_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBORAD;

  static final routes = [
    GetPage(
      name: _Paths.DASHBORAD,
      page: () => const DashboradView(),
      binding: DashboradBinding(),
    ),
    GetPage(
      name: _Paths.PAYER_TIME,
      page: () => const PayerTimeView(),
      binding: PayerTimeBinding(),
    ),
    GetPage(
      name: _Paths.QURAN,
      page: () => const QuranView(),
      binding: QuranBinding(),
    ),
    GetPage(
      name: _Paths.AZKAR,
      page: () => const AzkarView(),
      binding: AzkarBinding(),
    ),
    GetPage(
      name: _Paths.QIBLAH,
      page: () => QiblahView(),
      binding: QiblahBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AZKAR_DETAIL,
      page: () => const AzkarDetailView(),
      binding: AzkarDetailBinding(),
    ),
  ];
}
