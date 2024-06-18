import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';

class ListHistorySearchRecyleWidget extends StatelessWidget {
  const ListHistorySearchRecyleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    return Obx(
      () {
        return ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.searchHistory.length,
          itemBuilder: (context, index) {
            return _itemHistory(index);
          },
        );
      },
    );
  }

  Widget _itemHistory(int index) {
    final RecycleController controller = Get.find();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              controller.onSelectedHistory(controller.searchHistory[index]);
            },
            child: Text(
              controller.searchHistory[index],
              style: TextStyleConstant.mediumCaption.copyWith(
                color: ColorConstant.netralColor600,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => controller.deleteSearchHistory(index),
            child: const SizedBox(
              width: 18,
              height: 18,
              child: Icon(
                Icons.close,
                color: ColorConstant.netralColor600,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
