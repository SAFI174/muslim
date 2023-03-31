import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/app/data/models/azkar.dart';
import 'package:share_plus/share_plus.dart';

import 'package:muslim/app/data/models/azkar_by_category.dart';

class AzkarDetailController extends GetxController {
  //TODO: Implement AzkarDetailController

  final String azkar = Get.arguments;
  AzkarByCategory azkarByCategory = AzkarByCategory();

  void copyToClipborad(Azkar azkar, BuildContext context) async {
    await Clipboard.setData(
      ClipboardData(
        text: '${azkar.category}\n\n'
            '${azkar.zekr}\n\n'
            '| ${azkar.description}. | (التكرار: ${azkar.count})',
      ),
    ).then(
      (value) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "تم نسخ الذكر الى الحافظة",
            style: GoogleFonts.ibmPlexSansArabic(fontSize: 16.0),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }

  void shareZekr(Azkar azkar) {
    Share.share(
      '${azkar.category}\n\n'
      '${azkar.zekr}\n\n'
      '| ${azkar.description}. | (التكرار: ${azkar.count})',
    );
  }

  @override
  void onInit() {
    azkarByCategory.getAzkarByCategory(azkar);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
