import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/app/data/models/azkar.dart';
import 'package:muslim/app/widgets/text_ibm.dart';
import 'package:muslim/constants/colors.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/azkar_detail_controller.dart';

class AzkarDetailView extends GetView<AzkarDetailController> {
  const AzkarDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller1 = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: TextKufi(
          text: controller.azkar,
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: AnimationLimiter(
          child: ListView.builder(
            controller: controller1,
            itemCount: controller.azkarByCategory.azkarList.length,
            itemBuilder: (context, index) {
              Azkar azkar = controller.azkarByCategory.azkarList[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 100.0,
                  child: FadeInAnimation(
                    child: Container(
                      decoration: BoxDecoration(
                          color: lightGreen1.withAlpha(20),
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightGreen1,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.bookmark_add_outlined,
                                          color: lightGreen5,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.shareZekr(azkar);
                                        },
                                        icon: Icon(
                                          Icons.share,
                                          color: lightGreen5,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          controller.copyToClipborad(
                                              azkar, context);
                                        },
                                        icon: Icon(
                                          Icons.copy,
                                          color: lightGreen5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          azkar.count!,
                                          style: GoogleFonts.ibmPlexSansArabic(
                                            color: lightGreen7,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Icon(
                                          Icons.repeat,
                                          color: lightGreen5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                GetBuilder<AzkarDetailController>(
                                  builder: (controller) => SelectableText(
                                    azkar.zekr!,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.ibmPlexSansArabic(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  azkar.reference!,
                                  style: GoogleFonts.notoKufiArabic(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.rtl,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                if (azkar.description != "")
                                  Text(
                                    azkar.description!,
                                    style: GoogleFonts.ibmPlexSansArabic(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                    textDirection: TextDirection.rtl,
                                  )
                                else
                                  const SizedBox()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )),
      ),
    );
  }
}
