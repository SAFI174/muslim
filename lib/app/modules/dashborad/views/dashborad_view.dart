import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muslim/app/data/imports.dart';
import '../controllers/dashborad_controller.dart';

class DashboradView extends GetView<DashboradController> {
  const DashboradView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboradController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
              child: [
            HomeView(),
            PayerTimeView(),
            QuranView(),
            AzkarView(),
            QiblahView(),
          ][controller.tabIndex]),
          bottomNavigationBar: BottomNavBar(
            onTap: (value) => controller.changeTabIndex(value),
          ),
        );
      },
    );
  }
}
