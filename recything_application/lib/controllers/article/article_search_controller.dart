import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/services/article/article_service.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ArticleSearchController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var searchController = TextEditingController().obs;
  var searchResults = <String>[].obs;
  var matchData = <String>[].obs;
  RxString queryInput = ''.obs;
  var isLoading = false.obs;
  Timer? _debounce;

  @override
  void dispose() {
    searchController.value.dispose();
    super.dispose();
  }

  Future<void> searchArticle(String query) async {
    isLoading.value = true;
    try {
      final data = await ArticleService().getAllArticles(keyword: query);
      searchResults.value = data.data
              ?.where((article) =>
                  article.title?.toLowerCase().contains(query.toLowerCase()) ??
                  false)
              .map((article) => article.title ?? '')
              .toList() ??
          [];
      isLoading.value = false;
    } catch (e) {
      searchResults.clear();
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
    } finally {
      isLoading.value = false;
    }
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchArticle(query);
    });
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
}
