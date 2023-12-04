import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_parent/app/services/colors.dart';
import 'package:teaching_with_purpose_parent/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_parent/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_parent/gen/assets.gen.dart';
import 'dart:io' show Platform;
import '../controllers/results_controller.dart';

class ResultsView extends GetView<ResultsController> {
  const ResultsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Teacher’s Feedback',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              16.kheightBox,
              feedback(
                  Assets.images.teacherimg.image(),
                  'Esther Howard',
                  'It’s good to see improvement in English so far.',
                  'Reply',
                  '01:50 pm'),
            8.kheightBox,
              feedback(
                  Assets.images.teacherimg.image(),
                  'Esther Howard',
                  'It’s good to see improvement in English so far.',
                  'Reply',
                  '01:50 pm'),
            8.kheightBox,
              feedback(
                  Assets.images.teacherimg.image(),
                  'Esther Howard',
                  'It’s good to see improvement in English so far.',
                  'Reply',
                  '01:50 pm'),
            ],
          ),
        ),
      ),
    );
  }



// abbbar widget
  appBarWidget() {
    IconData iconData =
        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back;
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Get.context!.kGreyBack,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(iconData, color: Get.context!.kPrimary),
      ),
      title: Text(
        textAlign: TextAlign.center,
        'Results',
        style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
      ),
    );
  }


//Widget for feedback section by teachers
  Widget feedback(Image feebackimg, String text1, String text2, String reply,
      String time) {
    return SizedBox(
      height: 113.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(image: feebackimg.image,height: 30.kh,width: 30.kw)),
            12.kwidthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    textAlign: TextAlign.center,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                  ),
                  4.kheightBox,
                  Text(
                    text2,
                    maxLines: 2,
                    style: TextStyleUtil.kText12_4(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.kLightTextColor),
                  ),
                  12.kheightBox,
                  Text(
                    reply,
                    maxLines: 2,
                    style: TextStyleUtil.kText14_4(
                        fontWeight: FontWeight.w500,
                        color: Get.context!.kPrimary),
                  ),
                ],
              ),
            ),
            33.kwidthBox,
            Text(
              time,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyleUtil.kText12_4(
                  fontWeight: FontWeight.w400,
                  color: Get.context!.kLightTextColor),
            ),
          ],
        ),
      ),
    );
  }



}
