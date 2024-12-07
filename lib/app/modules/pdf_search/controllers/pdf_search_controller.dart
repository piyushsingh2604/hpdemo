import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpdemo/app/data/pdf_model.dart';
import 'package:image_picker/image_picker.dart';

class PdfSearchController extends GetxController {
  RxList<PdfModel> pdfList = <PdfModel>[].obs;
  RxList<PdfModel> filteredList = <PdfModel>[].obs;
  RxString searchQuery = ''.obs;
  RxList<File> images = <File>[].obs;

  // add pdf screen
  TextEditingController title = TextEditingController();
  RxBool onTap = false.obs;
  RxBool isVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    fetchPdfData();
  }

  Dio dio = Dio();

  Future<void> fetchData() async {
    final data = {"userId": "", "query": ""};
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjhiMDE4MDIyLTdmYzAtNDNhNi1iZDBjLTM5MzVkODc1ZGUyMyIsInN1YiI6Ikc2NDJuOVFzTlp0OUZpVHVwQzY1azZRTWpTSlQxRkVJU3F6MjA2ZEF5aTg9IiwiZW1haWwiOiJraXJhbi5zYXdhbnRAYW5qaXRhaXQuY29tIiwianRpIjoiNWI0YmE4NzAtZWIwMC00MWIyLWFjYjMtNDZmMmUzN2UxNDUzIiwibmJmIjoxNzMzMzkyNTExLCJleHAiOjE3NjQ5Mjg1MTEsImlhdCI6MTczMzM5MjUxMSwiaXNzIjoiaHR0cDovL2FkbWluLnBhcmxpYW1lbnQuaGVhbHRoLyIsImF1ZCI6Imh0dHA6Ly9hZG1pbi5wYXJsaWFtZW50LmhlYWx0aC8ifQ.wWz1UUrMBSKehZtZURSMYQCnJmRSKjeEraDr5O_yHSU2DRPLwQ9uZ_DsBleFX3LJjQhrwmziV8xKjSS3SWlDOA'
    };

    try {
      final response = await dio.post(
          'https://testapi.parliament.health/FetchPDFList',
          data: data,
          options: Options(headers: requestHeaders));
      if (response.statusCode == 200) {
        List<PdfModel> jsonData = (response.data['pdFs'] as List)
            .map((e) => PdfModel.fromJson(e))
            .toList();
        pdfList.value = jsonData;
        filteredList.value = jsonData;
      }
    } catch (e) {
      print(e);
    }
  }

  void filterList(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredList.value = pdfList;
    } else {
      filteredList.value = pdfList.where((pdf) {
        return pdf.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  // add pdf screen
  void onTapButton() {
    onTap.value = !onTap.value;
  }

  void isVisibleButton() {
    isVisible.value = !isVisible.value;
  }

  Future addImageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    File imageTemp = File(image.path);
    print("Image from gallery picked: ${imageTemp.path}");
    images.add(imageTemp);
  }

  Future addImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    File imageTemp = File(image.path);
    print("Image from camera picked: ${imageTemp.path}");
    images.add(imageTemp);
  }

  void deleteImage(int i) {
    images.removeAt(i);
  }

  Future<void> fetchPdfData() async {
    final data = {
      "img": [],
      "pdfId": "Bli+h9/j7kLoDuLDNShUxA==",
      "discussionId": "",
      "userId": "",
      "title": 'hi i am piyush',
      "body": 'testing',
      "tagsList": '',
      "source": '',
      "taggedUsers": '',
      "metadata": '',
    };
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjhiMDE4MDIyLTdmYzAtNDNhNi1iZDBjLTM5MzVkODc1ZGUyMyIsInN1YiI6Ikc2NDJuOVFzTlp0OUZpVHVwQzY1azZRTWpTSlQxRkVJU3F6MjA2ZEF5aTg9IiwiZW1haWwiOiJraXJhbi5zYXdhbnRAYW5qaXRhaXQuY29tIiwianRpIjoiNWI0YmE4NzAtZWIwMC00MWIyLWFjYjMtNDZmMmUzN2UxNDUzIiwibmJmIjoxNzMzMzkyNTExLCJleHAiOjE3NjQ5Mjg1MTEsImlhdCI6MTczMzM5MjUxMSwiaXNzIjoiaHR0cDovL2FkbWluLnBhcmxpYW1lbnQuaGVhbHRoLyIsImF1ZCI6Imh0dHA6Ly9hZG1pbi5wYXJsaWFtZW50LmhlYWx0aC8ifQ.wWz1UUrMBSKehZtZURSMYQCnJmRSKjeEraDr5O_yHSU2DRPLwQ9uZ_DsBleFX3LJjQhrwmziV8xKjSS3SWlDOA'
    };

    try {
      final response = await dio.post(
          'https://testapi.parliament.health/CreateUpdateDiscussionV2',
          data: data,
          options: Options(headers: requestHeaders));
      if (response.statusCode == 200) {
        print(response.data);
        // List<PdfModel> jsonData = (response.data['pdFs'] as List)
        //     .map((e) => PdfModel.fromJson(e))
        //     .toList();
        // pdfList.value = jsonData;
        // filteredList.value = jsonData;
      }
    } catch (e) {
      print(e);
    }
  }
}
