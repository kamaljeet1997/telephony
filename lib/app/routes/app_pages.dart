import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/totalcall/bindings/totalcall_binding.dart';
import '../modules/totalcall/views/totalcall_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TOTALCALL,
      page: () =>  TotalcallView(),
      binding: TotalcallBinding(),
    ),
  ];
}
