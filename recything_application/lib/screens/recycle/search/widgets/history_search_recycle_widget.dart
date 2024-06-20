import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/screens/recycle/search/widgets/empty_state_search_recycle_widget.dart';
import 'package:recything_application/screens/recycle/search/widgets/list_history_search_recyle_widget.dart';

class HistorySearchRecycleWidget extends StatelessWidget {
  const HistorySearchRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getSearchHistory();
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Pencarian Terkini',
                  style: TextStyleConstant.boldSubtitle.copyWith(
                    color: ColorConstant.netralColor900,
                  ),
                ),
              ],
            ),
            SpacingConstant.verticalSpacing150,
            if (controller.searchHistory.isNotEmpty)
              const ListHistorySearchRecyleWidget()
            else
              const EmptyStateSearchRecycleWidget(),
          ],
        );
      }),
    );
  }
}
