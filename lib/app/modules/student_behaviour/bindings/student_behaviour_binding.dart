import 'package:get/get.dart';

import '../controllers/student_behaviour_controller.dart';

class StudentBehaviourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentBehaviourController>(
      () => StudentBehaviourController(),
    );
  }
}
