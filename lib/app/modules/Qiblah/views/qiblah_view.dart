import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import 'package:get/get.dart';
import 'package:muslim/app/modules/Qiblah/assets/qiblah_compass.dart';
import 'package:muslim/app/widgets/text_ibm.dart';

import '../controllers/qiblah_controller.dart';

class QiblahView extends GetView<QiblahController> {
  const QiblahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const TextKufi(
        text: 'القبلة',
      )),
      body: FutureBuilder(
        future: FlutterQiblah.androidDeviceSensorSupport(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error.toString()}'),
            );
          }
          if (snapshot.hasData) {
            return QiblahCompass();
          } else {
            return const Text('Error');
          }
        },
      ),
    );
  }
}
