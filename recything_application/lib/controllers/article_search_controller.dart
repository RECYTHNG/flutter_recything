import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/article_controller.dart';

class ArticleSearchController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var searchController = TextEditingController().obs;
  var searchResults = <String>[].obs;
  var matchData = <String>[].obs;
  RxString queryInput = ''.obs;
  var isLoading = false.obs;

  final ArticleController articleController = Get.find();

  @override
  void dispose() {
    searchController.value.dispose();
    super.dispose();
  }

  void onSearchChanged(String query) {
    if (query.isNotEmpty) {
      searchArticle(query);
    }
  }

  void searchArticle(String query) {
    isLoading.value = true;
    try {
      searchResults.value = articleController.allArticleTitles
          .where((title) => title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      isLoading.value = false;
    } catch (e) {
      searchResults.clear();
      isLoading.value = false;
      Get.snackbar(
        '',
        '',
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(12),
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Colors.transparent,
        barBlur: 0.0,
        overlayBlur: 0.0,
        snackPosition: SnackPosition.BOTTOM,
        messageText: AwesomeSnackbarContent(
          title: 'Gagal',
          message: 'Opps! Ada Kesalahan',
          contentType: ContentType.failure,
        ),
      );
    }
  }

  void onChangedQuery(String value) {
    queryInput.value = value;
    if (value.isEmpty) {
      matchData.clear();
    } else {
      matchData.value = searchResults
          .where((element) => element.contains(queryInput.value))
          .map((e) => e)
          .toList();
    }
  }

  void onClickMatchedResult(String newValue) {
    queryInput.value = newValue;
    searchController.value.text = newValue;
    matchData.value = [newValue];
    matchData.clear();
  }

  void clear() {
    searchController.value.clear();
    searchResults.clear();
    matchData.clear();
    queryInput.value = '';
  }
}
