import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_parent/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_parent/app/modules/on_board/controllers/on_board_controller.dart';
import 'package:teaching_with_purpose_parent/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_parent/app/services/colors.dart';
import 'package:teaching_with_purpose_parent/app/services/custom_button.dart';
import 'package:teaching_with_purpose_parent/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_parent/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_parent/gen/assets.gen.dart';

class GetStartedView extends GetView<OnBoardController> {
  const GetStartedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 86, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: getStartedWidget(
                  img: Assets.images.getStarted.image(height: 300.kh,width: 355.kw),
                  title: StringConstants.getStarted,
                  subTitle: StringConstants.getStartedText),
            ),
            123.kheightBox,
            SizedBox(
              width: 343.kw,
              height: 56.kh,
              child: PRButton(
                  title: StringConstants.login,
                  onTap: () => Get.toNamed(Routes.LOGIN)),
            ),
          ],
        ),
      ),
    );
  }

  //custom Widget for img and text

  Widget getStartedWidget(
      {required Image img, required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: img.image),
        50.kheightBox,
        ListTile(
          title: Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyleUtil.kText24_6(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            textAlign: TextAlign.center,
            subTitle,
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400,color: Get.context!.kNeutral),
          ),
        )
      ],
    );
  }
}