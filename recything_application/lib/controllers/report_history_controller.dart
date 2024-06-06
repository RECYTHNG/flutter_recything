import 'package:get/get.dart';
import 'package:recything_application/models/report_history/report_history_model.dart';
import 'package:recything_application/services/report_history/report_history_service.dart';

class ReportHistoryController extends GetxController {
  RxList<ReportHistoryModel> data = <ReportHistoryModel>[].obs;
  RxList<ReportHistoryModel> displayedData = <ReportHistoryModel>[].obs;
  RxBool isLoading = true.obs;
  Rx<ReportHistoryModel>? selectedHistory;

  // Dasboard Reporting Controller
  RxInt currentIndexCarousell = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchReportHistoryData();
  }

  void fetchReportHistoryData() async {
    data.clear();
    try {
      isLoading(true);
      final response = await ReportHistoryService().getReportHistory();
      data.value = response;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
