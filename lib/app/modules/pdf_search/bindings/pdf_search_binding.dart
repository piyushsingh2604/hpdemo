import 'package:get/get.dart';

import '../controllers/pdf_search_controller.dart';

class PdfSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfSearchController>(
      () => PdfSearchController(),
    );
  }
}
