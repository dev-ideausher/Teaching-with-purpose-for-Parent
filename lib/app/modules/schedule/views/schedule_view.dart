import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_parent/app/components/commom_table.dart';
import 'package:teaching_with_purpose_parent/app/components/cutsom_examsheet.dart';
import 'package:teaching_with_purpose_parent/app/services/colors.dart';
import 'package:teaching_with_purpose_parent/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_parent/app/services/text_style_util.dart';
import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.kGreyBack,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          textAlign: TextAlign.center,
          'Schedule',
          style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Student’s Schedule',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              16.kheightBox,
             DefaultTabController(
                  length: 5,
                  child: SizedBox(
                    height: 267.kh,
                    width: 343.kw,
                    child: Column(
                      children: [
                        TabBar(
                          controller: controller.tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          indicatorWeight: 3,
                          indicatorColor: context.kPrimary,
                          labelColor: context.kPrimary,
                          unselectedLabelColor: context.kLightTextColor,
                          tabs: const [
                            Tab(text: 'Mon'),
                            Tab(text: 'Tue'),
                            Tab(text: 'Wed'),
                            Tab(text: 'Thu'),
                            Tab(text: 'Fri'),
                          ],
                          onTap: (index) => controller.selectDay(index),
                        ),
                        // const Divider(),
                         Expanded(
                          child: TabBarView(
                            controller: controller.tabController,
                            physics: const NeverScrollableScrollPhysics(),
                              children:  [
                                CommoncardTable(),
                                CommoncardTable(),
                                CommoncardTable(),
                                CommoncardTable(),
                                CommoncardTable(),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              32.kheightBox,
              Text(
                textAlign: TextAlign.center,
                'Exam DateSheet',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              16.kheightBox,
                ExamSheet(
                  title: 'Physics',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: context.kLightred),
              8.kheightBox,
                ExamSheet(
                  title: 'Physics',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: context.kPrimary),
              8.kheightBox,
                ExamSheet(
                  title: 'Physics',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: context.kLightBlue),
            ],
          ),
        ),
      ),
    );
  }

}