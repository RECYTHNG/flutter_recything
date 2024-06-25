import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/challenge/dashboard/challenge_dashboard_screen.dart';
import 'package:recything_application/screens/homepage/home_navbar_screen.dart';
import 'package:recything_application/screens/homepage/widgets/custom_carousel_item_widget.dart';
import 'package:recything_application/screens/report_litter/pick_litter/pick_litter_type_screen.dart';
import 'package:recything_application/screens/report_litter/report_litter_screen.dart';
import 'package:recything_application/screens/report_rubbish/report_rubbish_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ReportSectionWidget extends StatefulWidget {
  final List<Map<String, String>> carouselData;

  const ReportSectionWidget({super.key, required this.carouselData});

  @override
  _ReportSectionWidgetState createState() => _ReportSectionWidgetState();
}

class _ReportSectionWidgetState extends State<ReportSectionWidget> {
  int _activeIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 24,
            left: 24,
            top: 24,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingin Laporkan Sampah?',
                        style: TextStyleConstant.boldSubtitle,
                      ),
                      Text(
                        'Pilih Jenis Pelaporan Disini',
                        style: TextStyleConstant.regularParagraph,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAll(() => HomeNavBarScreen(currentIndex: 2));
                    },
                    child: Text(
                      'Lihat Semua',
                      style: TextStyleConstant.semiboldCaption.copyWith(
                        color: ColorConstant.primaryColor500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 232,
          child: FlutterCarousel.builder(
            options: CarouselOptions(
              height: 280,
              showIndicator: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _activeIndex = index;
                });
              },
            ),
            itemCount: widget.carouselData.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              final item = widget.carouselData[itemIndex];
              return CustomCarouselItem(
                onTap: itemIndex == 0
                    ? () {
                        Get.to(() => const ReportRubbishScreen());
                      }
                    : () {
                      Get.to(()=> const PickLitterTypeScreen());
                    },
                pageViewIndex: pageViewIndex,
                title: item['title']!,
                subtitle: item['subtitle']!,
                imagePath: item['imagePath']!,
                footerText: item['footerText']!,
              );
            },
          ),
        ),
        AnimatedSmoothIndicator(
          activeIndex: _activeIndex,
          count: widget.carouselData.length,
          effect: const ExpandingDotsEffect(
            dotWidth: 40,
            dotHeight: 4,
            activeDotColor: ColorConstant.netralColor900,
          ),
        ),
      ],
    );
  }
}
