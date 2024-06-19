import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/screens/recycle/category/widgets/app_bar_category_recycle_widget.dart';
import 'package:recything_application/screens/recycle/category/widgets/list_category_recycle_widget.dart';

class CategoryRecycleScreen extends StatelessWidget {
  const CategoryRecycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBarCategoryRecycleWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            ListCategoryRecycleWidget(),
          ],
        ),
      ),
    );
  }
}
