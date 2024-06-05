import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/models/faq/get_all_faq_model.dart';
import 'package:recything_application/services/faq_services/get_all_faq_service.dart';

class CustomerServiceFaqController extends GetxController {
  final GetAllFaqService _faqService = GetAllFaqService();
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController().obs;
  var faqData = <Datum>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;

  @override
  void dispose() {
    searchController.value.dispose();
    super.dispose();
  }

  Future<void> fetchFaqData() async {
    isLoading(true);
    try {
      final faqDataResult = await _faqService.getAllFaq();
      faqDataResult.data?.shuffle();
      faqData.value = faqDataResult.data?.take(3).toList() ?? [];
    } catch (e) {
      error.value = e.toString();
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
          title: 'Error',
          message: 'Message : ${error.value}',
          contentType: ContentType.failure,
        ),
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchFaqData();
    super.onInit();
  }
}
