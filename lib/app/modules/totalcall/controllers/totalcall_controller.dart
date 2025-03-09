import 'package:get/get.dart';

class TotalcallController extends GetxController {
  //TODO: Implement TotalcallController
  final RxString _title = ''.obs;
  String get title => _title.value;
  set title(String v) => _title.value = v;


  @override
  void onInit() {
    super.onInit();
    if(Get.arguments!=null){
      title=Get.arguments;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

}
