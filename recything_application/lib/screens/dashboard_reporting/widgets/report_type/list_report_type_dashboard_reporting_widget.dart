import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/report_type/item_report_type_dashboard_reporting_widget.dart';

class ListReportTypeDashboardReportingWidget extends StatelessWidget {
  ListReportTypeDashboardReportingWidget({super.key});

  final List<Widget> reportTypeItems = [
    ItemReportTypeDashboardReportingWidget(
      title: 'Penumpukan Sampah',
      image: ImageConstant.rubbishCarousel,
    ),
    ItemReportTypeDashboardReportingWidget(
      title: 'Pembuangan Sampah Sembarangan',
      image: ImageConstant.litteringCarousel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final ReportHistoryController controller = Get.find();
    return CarouselSlider(
      items: reportTypeItems,
      options: CarouselOptions(
        height: 180,
        viewportFraction: 1,
        autoPlay: true,
        disableCenter: true,
        clipBehavior: Clip.none,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {
          controller.currentIndexCarousell.value = index;
        },
      ),
    );
  }
}
