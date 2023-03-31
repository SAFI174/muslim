import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:muslim/app/widgets/text_ibm.dart';

import '../../../widgets/progress_bar.dart';
import '../controllers/payer_time_controller.dart';

class PayerTimeView extends GetView<PayerTimeController> {
  const PayerTimeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PayerTimeController>(
      builder: (controller) {
        return Scaffold(
          body: FutureBuilder(
            future: controller.getPrayerTime(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ProgressBar();
              }
              var prayerData = snapshot.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextKufi(
                      text: DateFormat.jm().format(prayerData.fajr),
                    ),
                    TextKufi(
                      text: DateFormat.jm().format(prayerData.sunrise),
                    ),
                    TextKufi(
                      text: DateFormat.jm().format(prayerData.dhuhr),
                    ),
                    TextKufi(
                      text: DateFormat.jm().format(prayerData.asr),
                    ),
                    TextKufi(
                      text: DateFormat.jm().format(prayerData.maghrib),
                    ),
                    TextKufi(
                      text: DateFormat.jm().format(prayerData.isha),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
