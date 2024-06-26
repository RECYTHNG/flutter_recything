import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/map_rubbish_controller.dart';
import 'package:recything_application/controllers/report_rubbish_controller.dart';
import 'package:recything_application/screens/report_rubbish/details/details_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/image/image_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/widgets/header_report_rubbish_widget.dart';

class ReportRubbishScreen extends StatefulWidget {
  const ReportRubbishScreen({super.key});

  @override
  State<ReportRubbishScreen> createState() => _ReportRubbishScreenState();
}

class _ReportRubbishScreenState extends State<ReportRubbishScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final MapRubbishController controller = Get.put(MapRubbishController());
  final ReportRubbishController rubbishController = Get.put(ReportRubbishController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(onTap);
    controller.tabIndex.listen((index) {
      if (!controller.isDisabled[index]) {
        tabController.animateTo(index);
      }
    });
  }

  void onTap() {
    if (controller.isDisabled[tabController.index]) {
      int index = tabController.previousIndex;
      setState(() {
        tabController.index = index;
      });
    } else {
      controller.changeTabIndex(tabController.index);
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    controller.updateIsDisabled();
  });
  return Scaffold(
    backgroundColor: ColorConstant.whiteColor,
    body: Column(
      children: [
        const HeaderReportRubbishWidget(),
        Obx(() {
          return TabBar(
            controller: tabController,
            onTap: (index) {
              if (controller.isDisabled[index]) {
                return;
              }
              controller.changeTabIndex(index);
            },
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return ColorConstant.primaryColor200.withOpacity(0.2);
                }
                return null;
              },
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 35),
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            indicatorWeight: 4,
            labelStyle: TextStyleConstant.boldParagraph.copyWith(
              color: ColorConstant.netralColor900,
              fontFamily: 'Nunito',
            ),
            unselectedLabelStyle: TextStyleConstant.boldParagraph.copyWith(
              color: ColorConstant.netralColor700,
              fontFamily: 'Nunito',
            ),
            indicatorColor: ColorConstant.primaryColor500,
            tabs: [
              Tab(
                child: Text(
                  'Deskripsi Sampah',
                  style: TextStyle(
                    color: !controller.isDisabled[0] ? ColorConstant.netralColor900 : ColorConstant.netralColor400,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Unggah Gambar',
                  style: TextStyle(
                    color: !controller.isDisabled[1] ? ColorConstant.netralColor900 : ColorConstant.netralColor400,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        }),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: const [
              DetailsReportRubbishWidget(),
              ImageReportRubbishWidget(),
            ],
          ),
        ),
      ],
    ),
  );
}
}