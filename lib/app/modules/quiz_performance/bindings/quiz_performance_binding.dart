import 'package:get/get.dart';

import '../controllers/quiz_performance_controller.dart';

class QuizPerformanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizPerformanceController>(
      () => QuizPerformanceController(),
    );
  }
}
