import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/screens/recycle/dashboard/widgets/category/item_category_dashboard_recycle_widget.dart';
import 'package:recything_application/screens/recycle/dashboard/widgets/category/subheader_category_dashboard_recycle_widget.dart';
import 'package:recything_application/screens/recycle/result/by_category/result_by_category_recycle_screen.dart';

class ListCategoryDashboardRecycleWidget extends StatelessWidget {
  const ListCategoryDashboardRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    final List<Map<String, dynamic>> items = [
      {
        'image': ImageConstant.plastik,
        'category': 'Plastik',
      },
      {
        'image': ImageConstant.besi,
        'category': 'Besi',
      },
      {
        'image': ImageConstant.kaca,
        'category': 'Kaca',
      },
      {
        'image': ImageConstant.organik,
        'category': 'Organik',
      },
    ];
    return Column(
      children: [
        const SubheaderCategoryDashboardRecycleWidget(),
        SpacingConstant.verticalSpacing150,
        SizedBox(
          height: 87,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ItemCategoryDashboardRecycleWidget(
                image: items[index]['image'],
                category: items[index]['category'],
                onTap: () {
                  controller.selectedCategory.value = items[index]['category'];
                  controller.searchByCategoryController.text = controller.selectedCategory.value!;
                  Get.to(() => const ResultByCategoryRecycleScreen());
                },
              );
            },
          ),
        )
      ],
    );
  }
}
