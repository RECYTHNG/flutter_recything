import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/screens/recycle/dashboard/widgets/activity/list_activity_dashboard_recycle_widget.dart';
import 'package:recything_application/screens/recycle/dashboard/widgets/app_bar_dashboard_recycle_widget.dart';
import 'package:recything_application/screens/recycle/dashboard/widgets/article/list_article_dashboard_recycle_widget.dart';
import 'package:recything_application/screens/recycle/dashboard/widgets/category/list_category_dashboard_recycle_widget.dart';
import 'package:recything_application/screens/recycle/dashboard/widgets/video/list_video_dashboard_recycle_widget.dart';

class DashboardRecycleScreen extends StatelessWidget {
  const DashboardRecycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RecycleController());
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: const AppBarDashboardRecycleWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SpacingConstant.verticalSpacing250,
              const ListActivityDashboardRecycleWidget(),
              SpacingConstant.verticalSpacing250,
              const ListCategoryDashboardRecycleWidget(),
              SpacingConstant.verticalSpacing250,
              const ListArticleDashboardRecycleWidget(),
              SpacingConstant.verticalSpacing250,
              const ListVideoDashboardRecycleWidget(),
              SpacingConstant.verticalSpacing250,
            ],
          ),
        ),
      ),
    );
  }
}
