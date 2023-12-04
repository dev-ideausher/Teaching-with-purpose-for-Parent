import 'package:get/get.dart';

import '../controllers/cource_completion_controller.dart';

class CourceCompletionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourceCompletionController>(
      () => CourceCompletionController(),
    );
  }
}
