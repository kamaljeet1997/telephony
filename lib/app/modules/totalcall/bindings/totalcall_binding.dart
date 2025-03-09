import 'package:get/get.dart';

import '../controllers/totalcall_controller.dart';

class TotalcallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TotalcallController>(
      () => TotalcallController(),
    );
  }
}
