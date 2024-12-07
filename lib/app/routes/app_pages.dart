import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pdf_search/bindings/pdf_search_binding.dart';
import '../modules/pdf_search/views/pdf_search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PDF_SEARCH,
      page: () => const PdfSearchView(),
      binding: PdfSearchBinding(),
    ),
  ];
}
