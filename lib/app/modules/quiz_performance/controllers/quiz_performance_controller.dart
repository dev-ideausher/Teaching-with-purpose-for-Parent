import 'package:get/get.dart';
import 'package:teaching_with_purpose_parent/gen/assets.gen.dart';

class QuizPerformanceController extends GetxController {
  final selectedSubjectIndex = 0.obs;
  var selectedValue = 'In-Between Quiz'.obs;

  List<SvgGenImage> subjectImage = [
    Assets.svg.allSubjects,
    Assets.svg.maths,
    Assets.svg.physicsRed,
    Assets.svg.chemistry,
    Assets.svg.history,
    Assets.svg.geography,
    Assets.svg.biology,
  ];

  List<String> subjectText = [
    'All Subjects',
    'Mathematics',
    'Physics',
    'chemistry',
    'History',
    'Geography',
    'biology',
  ];

  final List<String> items = [
    'In-Between Quiz',
    'Live Quiz'
  ];
  void selecteQuiz(String item) {
    selectedValue.value = item;
  }
}
