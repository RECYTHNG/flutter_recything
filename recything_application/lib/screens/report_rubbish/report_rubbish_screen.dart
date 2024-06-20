import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/map_rubbish_controller.dart';
import 'package:recything_application/screens/report_rubbish/details/details_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/image/image_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/widgets/header_report_rubbish_widget.dart';

class ReportRubbishScreen extends StatefulWidget {
  const ReportRubbishScreen({super.key});

  @override
  State<ReportRubbishScreen> createState() => _ReportRubbishScreenState();
}

class _ReportRubbishScreenState extends State<ReportRubbishScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final MapRubbishController controller = Get.put(MapRubbishController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    controller.tabIndex.listen((index) {
      _tabController.animateTo(index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Column(
        children: [
          const HeaderReportRubbishWidget(),
          TabBar(
            controller: _tabController,
            onTap: (index) {
              controller.changeTabIndex(index);
            },
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
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
            tabs: const [
              Tab(text: 'Deskripsi Sampah'),
              Tab(text: 'Unggah Gambar'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
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
