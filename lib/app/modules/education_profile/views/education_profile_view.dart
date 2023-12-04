import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_parent/app/components/custom_richtext.dart';
import 'package:teaching_with_purpose_parent/app/services/colors.dart';
import 'package:teaching_with_purpose_parent/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_parent/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_parent/gen/assets.gen.dart';
import 'dart:io' show Platform;
import '../controllers/education_profile_controller.dart';

class EducationProfileView extends GetView<EducationProfileController> {
  const EducationProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReUsableRichText(
                  text1: 'Student Nmae: ',
                  text2: 'Leslie Alexander!',
                  style1: TextStyleUtil.kText18_6(fontWeight: FontWeight.w500),
                  style2: TextStyleUtil.kText18_6(
                      fontWeight: FontWeight.w500,
                      color: Get.context!.kPrimary)),
              40.kheightBox,
              rowColumWidget('School', 'Oregon High School', 'District',
                  'Oregon School District'),
              16.kheightBox,
              rowColumWidget('District student id    ', '54646',
                  'State student id', '499522'),
              16.kheightBox,
              ReUsableRichText(
                  text1: 'Date last updated : ',
                  text2: '15/08/2023',
                  style1: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                  style2: TextStyleUtil.kText14_4(
                      fontWeight: FontWeight.w400,
                      color: Get.context!.kLightTextColor)),
              48.kheightBox,
              Text(
                textAlign: TextAlign.center,
                'Career Tracker',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.171,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 16,
                ),
                children: [
                  careerTracker(Assets.images.plan1.image(),'Self-Assessment',(){}),
                  careerTracker(
                      Assets.images.plan2.image(), 'Career Exploration', (){}),
                  careerTracker(Assets.images.plan3.image(), 'Goals and Plans',(){}),
                  careerTracker(
                      Assets.images.plan4.image(), 'Essential Skills', (){}),
                  careerTracker(
                      Assets.images.plan5.image(), 'Career test results', (){}),
                  careerTracker(Assets.images.plan6.image(), 'Skill Set', (){}),
                  careerTracker(
                      Assets.images.plan7.image(), 'Discussion Forum', (){}),
                  careerTracker(Assets.images.plan8.image(), 'Career Bio', (){}),
                  careerTracker(
                      Assets.images.plan9.image(), 'Academic Achievements', (){}),
                  careerTracker(
                      Assets.images.plan0.image(), 'Learning Exploration', (){}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // appbar widget
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
        'About Me',
        style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
      ),
    );
  }

  //rowColumWidget for student details
  Widget rowColumWidget(
      String c1text1, String c1text2, String c2text1, String c2text2) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.left,
              c1text1,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
            ),
            Text(
              textAlign: TextAlign.left,
              c1text2,
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400,
                  color: Get.context!.kLightTextColor),
            ),
          ],
        ),
        37.kwidthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.left,
              c2text1,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
            ),
            Text(
              textAlign: TextAlign.left,
              c2text2,
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400,
                  color: Get.context!.kLightTextColor),
            ),
          ],
        ),
      ],
    );
  }

  //widget for carrer tracker
  Widget careerTracker(Image img, String text, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 140.kh,
        width: 164.kw,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(image: img.image, height: 122.kh, width: 164.kw)),
            Text(
              textAlign: TextAlign.center,
              text,
              style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
