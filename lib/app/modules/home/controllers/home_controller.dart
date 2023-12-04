import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_parent/gen/assets.gen.dart';

class HomeController extends GetxController {

// event items to list..........
  List<String> eventsTitile = [
    'Sports Day',
    'Annual Day',
    'Parent-Teacher Meeting',
  ];
  List<String> time = ['Friday, 3:00 pm', 'Friday, 3:00 pm', 'Friday, 3:00 pm'];
  List<String> detailsText = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ];
  List<Image> eventImages = [
    Assets.images.sportsImg.image(),
    Assets.images.sportsImg.image(),
    Assets.images.sportsImg.image(),
  ];
}
