import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:muslim/app/data/models/azkar.dart';

import '../../../data/models/all_azkar.dart';

class AzkarController extends GetxController {
  // Get Azkar Names
  Future<List<Azkar>> getAzkarMainData() async {
    final String azkarRes =
        await rootBundle.loadString('assets/json/azkar/azkar.json');
    final azkarData = (json.decode(azkarRes) as List<dynamic>);
    return azkarData.map((e) => Azkar.fromJson(e)).toList();
  }

  List<String> filteredAzkarDataList = azkarDataList;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    return;
    super.onClose();
  }
}
