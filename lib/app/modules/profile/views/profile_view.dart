import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teaching_with_purpose_parent/app/components/custom_bottomsheet.dart';
import 'package:teaching_with_purpose_parent/app/components/custom_profile_card.dart';
import 'package:teaching_with_purpose_parent/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_parent/app/services/colors.dart';
import 'package:teaching_with_purpose_parent/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_parent/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_parent/gen/assets.gen.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.kGreyBack,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            textAlign: TextAlign.center,
            'Profile',
            style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileImage(
                    Assets.images.profileImgLarge
                        .image(height: 100.kh, width: 100.kw),
                    () {}),
                32.kheightBox,
                CustomProfileCard(
                    img: Assets.svg.editProfile,
                    title: 'Edit Profile',
                    onTap: () => Get.toNamed(Routes.EDIT_PROFILE)),
                8.kheightBox,
                CustomProfileCard(
                    img: Assets.svg.ratingOutline,
                    title: 'App Review & Ratings',
                    onTap: () => showBottomSheetWidget(context)),
                8.kheightBox,
                CustomProfileCard(
                    img: Assets.svg.language,
                    title: 'Content Language',
                    onTap: () {}),
                8.kheightBox,
                CustomProfileCard(
                    img: Assets.svg.password,
                    title: 'Change Password',
                    onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD)),
                8.kheightBox,
                CustomProfileCard(
                    img: Assets.svg.helpCircle,
                    title: 'HelpCenter',
                    onTap: () => Get.toNamed(Routes.HELP_CENTER)),
                8.kheightBox,
                CustomProfileCard(
                    img: Assets.svg.logout,
                    title: 'Logout',
                    onTap: () => logoutWidget()),
              ],
            ),
          ),
        ));
  }


//.............profile image section.....
  Widget profileImage(Image profileImg, void Function() onTap) {
    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(image: profileImg.image),
              ),
            ),
            Positioned(
                bottom: 12,
                right: 120,
                child: InkWell(
                    onTap: onTap,
                    child: Assets.svg.addPlus.svg(height: 29.kh, width: 29.kw)))
          ],
        ),
        8.kheightBox,
        Text(
          textAlign: TextAlign.center,
          'Hi, Mr Alexander',
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

//rating Section
  showBottomSheetWidget(BuildContext context) {
    return showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ResponseBottomSheet(
        onTap: () => Get.back(),
        bottomSheetImg: Lottie.asset('assets/lottiefiles/rating.json'),
        title: 'Enjoying Teaching With Purpose ?',
        text1:
            'Support us by giving rate and your precious review ! It will take few seconds only.',
        text2: 'Maybe Later',
      ),
    );
  }

  // dialo box for log-out
  logoutWidget() {
    return Get.defaultDialog(
        title: 'Confirm Logout',
        titleStyle: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
        middleText: 'Are you sure you want to logout ?',
        middleTextStyle: TextStyleUtil.kText14_4(
            fontWeight: FontWeight.w400, color: Get.context!.kLightTextColor),
        cancel: TextButton(onPressed: ()=> Get.back(), child: const Text('No')),
        confirm: TextButton(onPressed: ()=> Get.back(), child: const Text('Logout'))
      );
  }
}
