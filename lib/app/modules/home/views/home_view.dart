import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:teaching_with_purpose_parent/app/components/custom_card_vertical.dart';
import 'package:teaching_with_purpose_parent/app/components/custom_profile_card.dart';
import 'package:teaching_with_purpose_parent/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_parent/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_parent/app/services/colors.dart';
import 'package:teaching_with_purpose_parent/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_parent/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_parent/gen/assets.gen.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              childParentDetails(),
              32.kheightBox,
              progressWidget(),
              32.kheightBox,
              CustomProfileCard(
                  img: Assets.svg.results,
                  title: 'Results',
                  onTap: () => Get.toNamed(Routes.RESULTS)),
              16.kheightBox,
              CustomProfileCard(
                  img: Assets.svg.results,
                  title: 'Education Profile',
                  onTap: () => Get.toNamed(Routes.EDUCATION_PROFILE)),
              16.kheightBox,
              CustomProfileCard(
                  img: Assets.svg.attendence,
                  title: "Child’s Attendance",
                  onTap: () => Get.toNamed(Routes.ATTENDANCE)),
              32.kheightBox,
              rowWidget('Announcements', 'See all',
                  () => Get.toNamed(Routes.ANNOUNCEMENTS)),
              16.kheightBox,
              announcementWidget(),
              32.kheightBox,
              rowWidget('Events', 'See all', () => Get.toNamed(Routes.EVENTS)),
              16.kheightBox,
              SizedBox(
                height: 156.kh,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => 16.kwidthBox,
                  itemCount: 3,
                  itemBuilder: (context, index) => CustomCardVertical(
                      borderColor: context.kLightred,
                      title: controller.eventsTitile[index],
                      text1: controller.time[index],
                      text2: controller.detailsText[index],
                      imagePath: controller.eventImages[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//..... parent and child details widget
  Widget childParentDetails() {
    return SizedBox(
      height: 222.kh,
      width: 343.kw,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.images.parentImgsmll.image(height: 48.kh, width: 48.kw),
              12.kwidthBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Mr Alexander',
                      style:
                          TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
                    ),
                    4.kheightBox,
                    Text(
                      "Your Student’s Name:",
                      style:
                          TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Patrick Alexand",
                      style: TextStyleUtil.kText14_4(
                          fontWeight: FontWeight.w400,
                          color: Get.context!.kLightTextColor),
                    ),
                  ],
                ),
              ),
              Assets.svg.notifications.svg(width: 18.kw, height: 21.kh),
            ],
          ),
          16.kheightBox,
          rowColumWidget('School', 'Oregon High School', 'District',
              'Oregon School District'),
          16.kheightBox,
          rowColumWidget(
              'District student id', '54646', 'State student id', '499522'),
        ],
      ),
    );
  }

  //........ row widget
  Widget rowColumWidget(
      String c1text1, String c1text2, String c2text1, String c2text2) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              c1text1,
              textAlign: TextAlign.left,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
            ),
            Text(
              c1text2,
              textAlign: TextAlign.left,
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
              c2text1,
              textAlign: TextAlign.left,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
            ),
            Text(
              c2text2,
              textAlign: TextAlign.left,
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400,
                  color: Get.context!.kLightTextColor),
            ),
          ],
        ),
      ],
    );
  }

  // widget for progress
  Widget progressWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.center,
          'Progress',
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
        ),
        16.kheightBox,
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.352,
            crossAxisCount: 2,
            crossAxisSpacing: 13,
            mainAxisSpacing: 16,
          ),
          children: [
            percentageIndicater(0.75, '75%', 'Cource completion',
                () => Get.toNamed(Routes.COURCE_COMPLETION)),
            percentageIndicater(0.75, '75%', 'Assignment Performance',
                () => Get.toNamed(Routes.ASSIGNMENT)),
            percentageIndicater(0.75, '75%', 'Quiz Performance',
                () => Get.toNamed(Routes.QUIZ_PERFORMANCE)),
            percentageIndicater(1, 'View', 'Student Behavior',
                () => Get.toNamed(Routes.STUDENT_BEHAVIOUR)),
          ],
        ),
        32.kheightBox,
      ],
    );
  }

  // prcentage progress indiacater for marks and all inside the progresswidget
  Widget percentageIndicater(
      double percent, String text1, String text2, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 165.kw,
        height: 122.kh,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Column(
            children: [
              CircularPercentIndicator(
                radius: 30,
                lineWidth: 8,
                progressColor: Get.context!.kPrimary,
                animation: true,
                percent: percent,
                center: Text(text1,
                    style:
                        TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
              ),
              8.kheightBox,
              Text(
                textAlign: TextAlign.center,
                text2,
                style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }

// insted of use multiple row in  a single tree
  rowWidget(String title, String subtitle, void Function() onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            textAlign: TextAlign.center,
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
        149.kwidthBox,
        InkWell(
          onTap: onTap,
          child: Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400, color: Get.context!.kPrimary)),
        )
      ],
    );
  }

//announcement widget
  Widget announcementWidget() {
    return SizedBox(
      height: 180.kh,
      width: 343.kw,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Principal',
                  textAlign: TextAlign.center,
                  style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                ),
                16.kheightBox,
                Text(
                  StringConstants.announcementText1,
                  maxLines: 5,
                  style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Assets.images.gpdEllipsLargeright.image(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Assets.images.gpdEllipsLargeleft.image(),
          )
        ],
      ),
    );
  }
}
