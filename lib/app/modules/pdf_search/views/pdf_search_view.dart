import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpdemo/app/modules/pdf_search/views/add_pdf_view.dart';
import '../controllers/pdf_search_controller.dart';

class PdfSearchView extends GetView<PdfSearchController> {
  const PdfSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final PdfSearchController controller = Get.find<PdfSearchController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
           
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Select Professional Discussion Forum'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: SizedBox(
                  width: 290,
                  child: Text(
                      "Select any 1 Professional Discussion Forum to continue with create discussion")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 23, top: 28),
              child: TextField(
                onChanged: (query) {
                  controller.filterList(query);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 19),
            Obx(() => 
            controller.filteredList.isEmpty? Center(child: CircularProgressIndicator(),): Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: SizedBox(
                    height: 1.sh,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.filteredList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InkWell(
                            onTap: () {
                              Get.to(const AddPdfView());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: const Color(0xff0D4D5C))),
                              width: 1.sw,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 15, bottom: 15),
                                child:
                                    Text(controller.filteredList[index].name),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
            
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
