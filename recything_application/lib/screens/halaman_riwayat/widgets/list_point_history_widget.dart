import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/point_history_controller.dart';
import 'package:recything_application/screens/halaman_riwayat/widgets/no_record_history_point_widget.dart';

class ListPointHistoryWidget extends StatelessWidget {
  const ListPointHistoryWidget({
    super.key,
    required this.pointHistoryController,
  });

  final PointHistoryController pointHistoryController;

  @override
  Widget build(BuildContext context) {
    final historyUserPoint =
       pointHistoryController.achievementResult.value.data?.historyUserPoint;
    return Expanded(
      child: historyUserPoint == null || historyUserPoint.isEmpty
          ? const NoRecordHistoryPointWidget()
          : ListView.builder(
              itemCount: pointHistoryController
                      .achievementResult.value.data?.historyUserPoint?.length ??
                  0,
              itemBuilder: (context, index) {
                var historyItem = historyUserPoint[index];
                DateTime parsedDate = DateTime.parse(historyItem.date!);
                DateFormat formatter = DateFormat('d MMMM yyyy', 'id_ID');
                historyItem.date = formatter.format(parsedDate);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    height: 75.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: ColorConstant.blackColor.withOpacity(0.1),
                          blurRadius: 8.0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Menyelesaikan Chalenge',
                                style:
                                    TextStyleConstant.semiboldSubtitle.copyWith(
                                  color: ColorConstant.netralColor900,
                                ),
                              ),
                              Text(
                                '+ ${historyItem.points}',
                                style:
                                    TextStyleConstant.semiboldSubtitle.copyWith(
                                  color: ColorConstant.netralColor900,
                                ),
                              ),
                            ],
                          ),
                          SpacingConstant.verticalSpacing100,
                          Text(
                            '${historyItem.date}',
                            style: TextStyleConstant.regularCaption.copyWith(
                              color: ColorConstant.netralColor900,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
