import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/app/modules/AzkarDetail/views/azkar_detail_view.dart';
import 'package:muslim/app/routes/app_pages.dart';
import 'package:muslim/app/widgets/text_ibm.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:muslim/app/widgets/search_bar.dart';
import 'package:muslim/constants/colors.dart';

import '../../../data/models/all_azkar.dart';
import '../controllers/azkar_controller.dart';

class AzkarView extends GetView<AzkarController> {
  const AzkarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String searchText = '';
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const TextKufi(text: 'حصن المسلم'),
      ),
      body: Column(
        children: [
          SearchBar(
            hintText: 'ابحث عن ذكر , دعاء',
            onQuerySubmited: (value) {
              controller.filteredAzkarDataList = azkarDataList.where(
                (element) {
                  return element.contains(value);
                },
              ).toList();
              controller.update();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: AnimationLimiter(
                child: GetBuilder<AzkarController>(
                  builder: (context) {
                    return ListView.builder(
                      itemCount: controller.filteredAzkarDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: GetBuilder<AzkarController>(
                                builder: (context) {
                                  return _buildListItem(index);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(int index) {
    BorderRadius borderRadius = BorderRadius.only(
      topLeft:
          index == 0 ? const Radius.circular(20.0) : const Radius.circular(5.0),
      topRight:
          index == 0 ? const Radius.circular(20.0) : const Radius.circular(5.0),
      bottomLeft: index == azkarDataList.length - 1
          ? const Radius.circular(20.0)
          : const Radius.circular(5.0),
      bottomRight: index == azkarDataList.length - 1
          ? const Radius.circular(20.0)
          : const Radius.circular(5.0),
    );

    String azkar = controller.filteredAzkarDataList[index];
    EdgeInsets lastItemMargin;
    if (controller.filteredAzkarDataList.last.toString() == azkar) {
      lastItemMargin = const EdgeInsets.only(bottom: 12);
    } else {
      lastItemMargin = const EdgeInsets.only(bottom: 0);
    }

    return Container(
      height: 70,
      margin: lastItemMargin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: (index % 2 == 0 ? lightGreen1 : Colors.transparent),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {
            Get.toNamed(Routes.AZKAR_DETAIL, arguments: azkar);
          },
          child: Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Text(
                    azkar,
                    style: GoogleFonts.notoKufiArabic(fontSize: 16),
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
