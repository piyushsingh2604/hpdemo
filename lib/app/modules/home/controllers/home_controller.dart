import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hpdemo/app/data/api_model.dart';

class HomeController extends GetxController {
  RxList<DiscussionLists> discussionLists = <DiscussionLists>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  final Dio dio = Dio();

  RxInt pages = 0.obs;


  Future<void> fetchData() async {
    final data = {
      "userId": "DLaVLOSzhZzYTKF9Eak4Pw==",
      "shownDiscussionId": [],
      "offset": 2,
      "recordCount": 20
    };
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjhiMDE4MDIyLTdmYzAtNDNhNi1iZDBjLTM5MzVkODc1ZGUyMyIsInN1YiI6Ikc2NDJuOVFzTlp0OUZpVHVwQzY1azZRTWpTSlQxRkVJU3F6MjA2ZEF5aTg9IiwiZW1haWwiOiJraXJhbi5zYXdhbnRAYW5qaXRhaXQuY29tIiwianRpIjoiNWI0YmE4NzAtZWIwMC00MWIyLWFjYjMtNDZmMmUzN2UxNDUzIiwibmJmIjoxNzMzMzkyNTExLCJleHAiOjE3NjQ5Mjg1MTEsImlhdCI6MTczMzM5MjUxMSwiaXNzIjoiaHR0cDovL2FkbWluLnBhcmxpYW1lbnQuaGVhbHRoLyIsImF1ZCI6Imh0dHA6Ly9hZG1pbi5wYXJsaWFtZW50LmhlYWx0aC8ifQ.wWz1UUrMBSKehZtZURSMYQCnJmRSKjeEraDr5O_yHSU2DRPLwQ9uZ_DsBleFX3LJjQhrwmziV8xKjSS3SWlDOA'
    };

    try {
      final response = await dio.post(
          'https://testapi.parliament.health/FetchHomeFeed',
          data: data,
          options: Options(headers: requestHeaders));

      if (response.statusCode == 200) {
        List<DiscussionLists> jsonData =
            (response.data['discussionLists'] as List)
                .map((e) => DiscussionLists.fromJson(e))
                .toList();
        discussionLists.value = jsonData;
      }
    } catch (e) {
      print(e);
    }
  }
}