import 'package:get/get.dart';
import 'package:recything_application/models/report_history/report_history_model.dart';
import 'package:recything_application/services/report_history/report_history_service.dart';

class ReportHistoryController extends GetxController {
  Rxn<ReportHistoryModel> reportHistoryData = Rxn<ReportHistoryModel>();
  Rxn<List<ReportHistoryModel>> displayedData = Rxn<List<ReportHistoryModel>>();
  RxBool isLoadingFetchReportHistoryData = RxBool(false);
  Rxn<Report> selectedHistory = Rxn<Report>();
  RxInt currentIndexCarousell = RxInt(1);

  @override
  void onInit() {
    super.onInit();
    fetchReportHistoryData();
  }

  void fetchReportHistoryData() async {
    isLoadingFetchReportHistoryData.value = true;
    try {
      final response = await ReportHistoryService().getReportHistory();
      reportHistoryData.value = response;
    } finally {
      isLoadingFetchReportHistoryData.value = false;
    }
  }
}