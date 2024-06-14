import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/models/faq/search_faq_model.dart';
import 'package:recything_application/services/faq_services/search_faq_service.dart';

class CustomerServiceSearchController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var searchController = TextEditingController().obs;
  var searchResults = <DatumSearch>[].obs;
  var matchData = <String>[].obs;
  RxString queryInput = ''.obs;
  var isLoading = false.obs;
  Timer? _debounce;

  @override
  void dispose() {
    searchController.value.dispose();
    super.dispose();
  }

  Future<void> searchFaq(String query) async {
    isLoading.value = true;
    try {
      final searchResult = await SearchFaqService().getSearchFaq(query: query);
      searchResults.value = searchResult.data ?? [];
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
      searchFaq(query);
    });
  }

  void onChangedQuery(String value) {
    queryInput.value = value;
    if (value.isEmpty) {
      matchData.clear();
    } else {
      matchData.value = searchResults
          .where((element) => element.question!.contains(queryInput.value))
          .map((e) => e.question!)
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
