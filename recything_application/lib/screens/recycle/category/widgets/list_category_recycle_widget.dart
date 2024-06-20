import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/screens/recycle/category/widgets/item_category_recycle_widget.dart';
import 'package:recything_application/screens/recycle/result/by_category/result_by_category_recycle_screen.dart';

class ListCategoryRecycleWidget extends StatelessWidget {
  const ListCategoryRecycleWidget({super.key});

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
      {
        'image': ImageConstant.kayu,
        'category': 'Kayu',
      },
      {
        'image': ImageConstant.kertas,
        'category': 'Kertas',
      },
      {
        'image': ImageConstant.baterai,
        'category': 'Baterai',
      },
      {
        'image': ImageConstant.kaleng,
        'category': 'Kaleng',
      },
      {
        'image': ImageConstant.elektronik,
        'category': 'Elektronik',
      },
      {
        'image': ImageConstant.tekstil,
        'category': 'Tekstil',
      },
      {
        'image': ImageConstant.minyak,
        'category': 'Minyak',
      },
      {
        'image': ImageConstant.bolaLampu,
        'category': 'Bola Lampu',
      },
      {
        'image': ImageConstant.berbahaya,
        'category': 'Berbahaya',
      },
    ];

    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCategoryRecycleWidget(
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
    );
  }
}
