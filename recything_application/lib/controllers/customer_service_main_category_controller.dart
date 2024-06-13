import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/models/faq/category_faq_model.dart';
import 'package:recything_application/services/faq_services/category_faq_service.dart';

class CustomerServiceMainCategoryController extends GetxController {
  var faqCategoryData = <Datum>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> fetchFaqData(String category) async {
    isLoading(true);
    try {
      final faqCategoryData =
          await CategoryFaqService().getCategoryFaq(name: category);
      this.faqCategoryData(faqCategoryData.data ?? []);
    } catch (e) {
      errorMessage('Error: ${e.toString()}');
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
      isLoading(false);
    }
  }
}
